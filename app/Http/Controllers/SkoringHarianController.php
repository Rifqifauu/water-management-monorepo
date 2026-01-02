<?php

namespace App\Http\Controllers;

use App\Models\Lokasi;
use App\Models\MonitoringHarian;
use App\Models\SkoringHarian;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class SkoringHarianController extends Controller
{
    /**
     * Menampilkan Rekapitulasi Skor Harian (List)
     */
    public function index(Request $request) 
    {
        // 1. Validasi Input
        $validator = Validator::make($request->all(), [
            'search'    => 'nullable|string',
            'id_lokasi' => 'nullable',
            'status'    => 'nullable|string', 
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'errors' => $validator->errors()], 422);
        }

        // 2. Siapkan Rumus Raw SQL
        // Hitung Rata-rata Parit (Handle division by zero)
        $sqlAvgParit = "COALESCE(SUM(CASE WHEN monitoring_harian.tipe_objek = 'Parit' THEN skoring_harians.total_skor ELSE 0 END) / NULLIF(COUNT(CASE WHEN monitoring_harian.tipe_objek = 'Parit' THEN 1 ELSE NULL END), 0), 0)";
        
        // Hitung Rata-rata Genangan
        $sqlAvgGenangan = "COALESCE(SUM(CASE WHEN monitoring_harian.tipe_objek = 'Genangan' THEN skoring_harians.total_skor ELSE 0 END) / NULLIF(COUNT(CASE WHEN monitoring_harian.tipe_objek = 'Genangan' THEN 1 ELSE NULL END), 0), 0)";

        // Total Skor = Rata-rata Parit + Rata-rata Genangan
        $sqlTotalScore = "({$sqlAvgParit} + {$sqlAvgGenangan})/2";

        // 3. Query Builder Utama
        $query = DB::table('monitoring_harian')
            ->join('skoring_harians', 'monitoring_harian.id', '=', 'skoring_harians.id_monitoring_harian')
            ->join('lokasi', 'monitoring_harian.id_lokasi', '=', 'lokasi.id')
            ->select(
                'monitoring_harian.id_lokasi',
                'lokasi.afdeling',
                'lokasi.blok',
                // PENTING: Ambil tanggal saja (abaikan jam) agar grouping valid
                DB::raw('DATE(monitoring_harian.tanggal) as tanggal_only'), 
                DB::raw("COUNT(monitoring_harian.id) as frekuensi_harian"),
                DB::raw("$sqlTotalScore as calculated_score") 
            );

        // 4. Filtering (WHERE)
        if ($request->filled('search')) {
            $search = $request->search;
            $query->where(function($q) use ($search) {
                $q->where('lokasi.blok', 'like', "%{$search}%")
                  ->orWhere('lokasi.afdeling', 'like', "%{$search}%");
            });
        }
        
        if ($request->filled('id_lokasi')) {
            $query->where('monitoring_harian.id_lokasi', $request->id_lokasi);
        }

        // 5. GROUPING
        // Group by Tanggal (DATE only) agar jam input yang berbeda tetap masuk satu grup
        $query->groupBy(
            'monitoring_harian.id_lokasi',
            'lokasi.afdeling',
            'lokasi.blok',
            DB::raw('DATE(monitoring_harian.tanggal)')
        );

        // 6. Filtering (HAVING) berdasarkan Skor Hasil Hitungan
        if ($request->filled('status')) {
            $status = strtolower($request->status);
            
            if ($status === 'kritis') {
                $query->having('calculated_score', '>=', 40);
            } elseif ($status === 'tinggi') {
                $query->havingBetween('calculated_score', [30, 39.99]);
            } elseif ($status === 'sedang') {
                $query->havingBetween('calculated_score', [20, 29.99]);
            } elseif ($status === 'rendah') {
                $query->havingBetween('calculated_score', [10, 19.99]);
            } elseif ($status === 'minimal') {
                $query->havingBetween('calculated_score', [0.1, 10]);
            }
        }

        // 7. Sorting
        // Sort by tanggal terbaru, lalu by skor tertinggi (paling parah)
        $query->orderBy('tanggal_only', 'desc');
        $query->orderBy('calculated_score', 'desc'); 

        // 8. Pagination & Transform Data
        $rekapData = $query->paginate(10); 

        $rekapData->getCollection()->transform(function ($item) {
            
            $finalScore = (float) $item->calculated_score;
            $statusInfo = SkoringHarian::checkStatus($finalScore); // Pastikan static method ini ada di Model
            
            return [
                'periode' => [
                    'tanggal_raw'  => $item->tanggal_only,
                    'tanggal_indo' => date('d-m-Y', strtotime($item->tanggal_only)),
                    'hari'         => date('l', strtotime($item->tanggal_only)),
                ],
                'lokasi' => [
                    'id'       => $item->id_lokasi,
                    'afdeling' => $item->afdeling,
                    'blok'     => $item->blok,
                ],
                'data' => [
                    'jumlah_laporan' => $item->frekuensi_harian,
                    'total_skor'     => number_format($finalScore, 2), 
                ],
                'analisa' => [
                    'status'      => $statusInfo['kategori'] ?? 'Unknown',
                    'rekomendasi' => $statusInfo['tindakan'] ?? '-',
                ]
            ];
        });

        return response()->json([
            'status' => true,
            'message' => 'Rekapitulasi skor harian berhasil diambil',
            'data' => $rekapData
        ]);
    }

    /**
     * Menampilkan Detail Laporan per Lokasi & Tanggal
     */
    public function detail(Request $request)
    {
        // 1. Validasi
        $validator = Validator::make($request->all(), [
            'id_lokasi' => 'required|exists:lokasi,id',
            'tanggal'   => 'required|date',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'errors' => $validator->errors()], 422);
        }

        // 2. Ambil Data Lokasi
        $lokasi = Lokasi::find($request->id_lokasi);

        // 3. Ambil Data Harian (FIXED LOGIC)
        $dataHarian = MonitoringHarian::query()
            ->with(['skoring', 'karyawan'])
            ->where('id_lokasi', $request->id_lokasi)
            ->whereDate('tanggal', $request->tanggal)
            ->whereIn('tipe_objek', ['Parit', 'Genangan']) 
            ->orderBy('created_at', 'desc')
            ->get();

        $dataParit    = $dataHarian->where('tipe_objek', 'Parit');
        $dataGenangan = $dataHarian->where('tipe_objek', 'Genangan');

        $countParit    = $dataParit->count();
        $countGenangan = $dataGenangan->count();

        // Gunakan optional() untuk menghindari error jika relasi skoring null
        $sumParit    = $dataParit->sum(fn($i) => optional($i->skoring)->total_skor ?? 0);
        $sumGenangan = $dataGenangan->sum(fn($i) => optional($i->skoring)->total_skor ?? 0);

        // 5. Hitung Skor Rata-rata per Tipe
        $skorAkhirParit    = $countParit > 0 ? ($sumParit / $countParit) : 0;
        $skorAkhirGenangan = $countGenangan > 0 ? ($sumGenangan / $countGenangan) : 0;

        // TOTAL SCORE (Rumus Penjumlahan untuk Status Bahaya)
        $totalSkorFinal = ($skorAkhirParit + $skorAkhirGenangan)/2;
$totalSkorSementara = 0;
$jumlahData = $dataHarian->count(); // Menghitung total item (pengganti .length)

foreach ($dataHarian as $item) {
    // Ambil nilai total_skor dari relasi, jika null anggap 0
    $skor = optional($item->skoring)->total_skor ?? 0;
    
    // Tambahkan ke penampung
    $totalSkorSementara += $skor; // sama dengan: $totalSkorSementara = $totalSkorSementara + $skor;
}

if ($jumlahData > 0) {
    $totalRataRata = $totalSkorSementara / $jumlahData;
} else {
    $totalRataRata = 0;
}
        $statusHarian = SkoringHarian::checkStatus($totalSkorFinal);

        $detailList = $dataHarian->map(function ($item) {
            $s = $item->skoring; 
            
            return [
                'id_monitoring'   => $item->id,
                'waktu_input'     => date('H:i', strtotime($item->created_at)),
                'pengamat'        => $item->karyawan ? $item->karyawan->nama : '-',
                'tipe_objek'      => $item->tipe_objek,
                'kedalaman'       => $item->kedalaman_cm . ' cm',
                'kondisi_aliran'  => $item->kondisi_aliran,
                'foto'            => $item->foto_path ? url('storage/'.$item->foto_path) : null,
                'foto_after'      => $item->foto_after ? url('storage/'.$item->foto_after) : null,
                'keterangan'      => $item->keterangan,
                'rincian_skor'    => [
                    'subtotal'       => $s ? (float) $s->total_skor : 0,
                    'skor_kedalaman' => $s ? (float) $s->skor_kedalaman : 0,
                    'skor_pokok'     => $s ? (float) $s->skor_jumlah_pokok : 0,   
                    'skor_durasi'    => $s ? (float) $s->skor_durasi : 0,
                    'skor_aliran'    => $s ? (float) $s->skor_aliran : 0,
                    'skor_penyebab'  => $s ? (float) $s->skor_penyebab : 0,      
                ],
            ];
        });

        // 7. Return Response
        return response()->json([
            'status' => true,
            'header' => [
                'lokasi' => [
                    'afdeling' => $lokasi->afdeling,
                    'blok'     => $lokasi->blok,
                ],
                'periode' => [
                    'tanggal_raw'  => $request->tanggal,
                    'tanggal_indo' => date('d-m-Y', strtotime($request->tanggal)),
                    'hari'         => date('l', strtotime($request->tanggal)),
                ],
                'statistik_harian' => [
                    'jumlah_laporan' => $detailList->count(),
                    'skor_parit'     => (float) number_format($skorAkhirParit, 2),
                    'skor_genangan'  => (float) number_format($skorAkhirGenangan, 2),
                    'total_skor'     => (float) number_format($totalSkorFinal, 2),
                    'total_ratarata' => (float) number_format($totalRataRata, 2),
                ],
                'analisa_harian' => [
                    'status_bahaya' => $statusHarian['kategori'] ?? 'Unknown',
                    'rekomendasi'   => $statusHarian['tindakan'] ?? '-',
                ]
            ],
            'list_laporan' => $detailList
        ]);
    }
}