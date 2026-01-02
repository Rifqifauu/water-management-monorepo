<?php

namespace App\Http\Controllers;

use App\Models\Lokasi;
use App\Models\MonitoringHarian;
use App\Models\MonitoringMingguan;
use App\Models\WaterLevel;
use App\Exports\MonitoringExport;
use App\Exports\MonitoringMultiSheetExport;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel; 
use Carbon\Carbon;

class XlsController extends Controller
{
    /**
     * Export SEMUA BLOK (Multi-Tab)
     */
public function exportAll(Request $request)
{
    // 1. Naikkan limit memori dan waktu karena proses ini tetap berat
    ini_set('memory_limit', '1024M');
    set_time_limit(300);
    libxml_use_internal_errors(true); 

    $month = $request->query('month', now()->month);
    $year  = $request->query('year', now()->year);
    $namaBulan = Carbon::createFromDate($year, $month, 1)->translatedFormat('F');

    // 2. Query Lokasi yang HANYA memiliki laporan di bulan/tahun tersebut
    $lokasis = Lokasi::where(function($query) use ($month, $year) {
        $query->whereHas('monitoringHarian', function($q) use ($month, $year) {
            $q->whereMonth('tanggal', $month)->whereYear('tanggal', $year);
        })
        ->orWhereHas('monitoringMingguan', function($q) use ($month, $year) {
            $q->whereMonth('tanggal', $month)->whereYear('tanggal', $year);
        })
        ->orWhereHas('waterLevel', function($q) use ($month, $year) {
            $q->whereMonth('tanggal', $month)->whereYear('tanggal', $year);
        });
    })->get();

    // Jika tidak ada lokasi yang punya laporan sama sekali
    if ($lokasis->isEmpty()) {
        return response()->json(['message' => 'Tidak ada data laporan untuk periode ini'], 404);
    }

    $allData = [];
    foreach ($lokasis as $lok) {
        $allData[] = [
            'title'   => "Blok " . $lok->blok,
            'payload' => $this->preparePayload($lok, $month, $year)
        ];
    }

    $fileName = "Laporan_Monitoring_Filtered_{$namaBulan}_{$year}.xlsx";

    if (ob_get_contents()) ob_end_clean();

    $export = Excel::download(new MonitoringMultiSheetExport($allData), $fileName);
    
    libxml_clear_errors();
    return $export;
}

    /**
     * Export SATU BLOK Saja
     */
    public function exportDetail(Request $request, $id_lokasi)
    {
        // Tambahkan penanganan error XML
        libxml_use_internal_errors(true); 

        $lokasi = Lokasi::find($id_lokasi);
        if (!$lokasi) return response()->json(['message' => 'Lokasi tidak ditemukan'], 404);

        $month = $request->query('month', now()->month);
        $year  = $request->query('year', now()->year);
        
        $payload = $this->preparePayload($lokasi, $month, $year);
        $fileName = "Laporan_Blok_" . $lokasi->blok . ".xlsx";

        if (ob_get_contents()) ob_end_clean();

        $export = Excel::download(new MonitoringExport($payload, "Blok " . $lokasi->blok), $fileName);
        
        libxml_clear_errors();

        return $export;
    }

    /**
     * Helper: Menyiapkan data payload per lokasi
     */
    private function preparePayload($lokasi, $month, $year)
    {
        $analytics = new AnalyticsController();
        $perf = $analytics->calculateWeightedPerformance($lokasi->id, $month, $year);

        return [
            'summary' => [
                'blok'           => $lokasi->blok,
                'afdeling'       => $lokasi->afdeling,
                'skor_harian'    => $perf['scores']['harian'] ?? 0, 
                'skor_mingguan'  => $perf['scores']['mingguan'] ?? 0, 
                'skor_water'     => $perf['scores']['water_level'] ?? 0,
                'skor_final'     => $perf['scores']['final_weighted'] ?? 0, 
                'kategori'       => $perf['analisa']['kategori'] ?? 'N/A'
            ],
            'harian' => MonitoringHarian::with(['karyawan'])
                ->where('id_lokasi', $lokasi->id)
                ->whereMonth('tanggal', $month)->whereYear('tanggal', $year)
                ->get()->map(fn($item, $i) => [
                    $i + 1, 
                    Carbon::parse($item->tanggal)->format('d/m/Y'), 
                    $item->karyawan->nama ?? '-', 
                    $lokasi->blok, 
                    $item->tipe_objek, 
                    $item->kedalaman_cm . ' cm', 
                    $item->kondisi_aliran, 
                    $item->rata_rata_skor, 
                    $item->tindakan ?? '-'
                ]),
            'mingguan' => MonitoringMingguan::with(['karyawan'])
                ->where('id_lokasi', $lokasi->id)
                ->whereMonth('tanggal', $month)->whereYear('tanggal', $year)
                ->get()->map(fn($item, $i) => [
                    $i + 1, 
                    Carbon::parse($item->tanggal)->format('d/m/Y'), 
                    $item->karyawan->nama ?? '-', 
                    $lokasi->blok, 
                    $item->jenis_infrastruktur, 
                    $item->penyebab, 
                    '-', 
                    $item->rata_rata_skor, 
                    $item->tindakan ?? '-'
                ]),
            'water' => WaterLevel::with(['karyawan'])
                ->where('id_lokasi', $lokasi->id)
                ->whereMonth('tanggal', $month)->whereYear('tanggal', $year)
                ->get()->map(fn($item, $i) => [
                    $i + 1, 
                    Carbon::parse($item->tanggal)->format('d/m/Y'), 
                    $item->karyawan->nama ?? '-', 
                    $lokasi->blok, 
                    $item->no_water_level, 
                    $item->tinggi_level_air . ' cm', 
                    '-', 
                    $item->rata_rata_skor, 
                    'Monitoring Terukur'
                ])
        ];
    }
}