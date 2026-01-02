<?php

namespace App\Http\Controllers;

use App\Models\Lokasi;
use App\Models\WaterLevel;
use App\Models\MonitoringMingguan;
use App\Models\MonitoringHarian;
use App\Helpers\StatusHelper;
use App\Traits\PerformanceTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class GISController extends Controller
{
    use PerformanceTrait;

    /**
     * Get Data Monitoring Harian (Blok)
     * Filter: Bisa per Bulan & Tahun
     */
    public function index(Request $request)
    {
        // 1. Ambil parameter dari Frontend (Vue mengirim 'bulan' & 'tahun')
        // Jika tidak ada, default ke bulan/tahun saat ini
        $month = $request->query('bulan', $request->query('month', now()->month));
        $year  = $request->query('tahun', $request->query('year', now()->year));

        $locations = Lokasi::all();

        // 2. Ambil data Harian sesuai filter bulan & tahun
        $dailyData = MonitoringHarian::whereMonth('tanggal', $month)
            ->whereYear('tanggal', $year)
            ->get()
            ->groupBy('id_lokasi');

        // 3. Mapping data lokasi dengan rata-rata skor bulanan
        $result = $locations->map(function ($lokasi) use ($dailyData, $month, $year) {
            $dataMonitoring = $dailyData->get($lokasi->id, collect([]));

            // Hitung rata-rata skor dalam bulan tersebut
            $rerataSkorBulanan = $dataMonitoring->count() > 0 
                                ? $dataMonitoring->avg('rata_rata_skor') 
                                : 0;

            // Tentukan status blok berdasarkan rata-rata sebulan
            $statusInfo = StatusHelper::determineStatus($rerataSkorBulanan);

            $formattedCoords = $dataMonitoring->filter(function($item) {
                return !is_null($item->lat_aktual) && !is_null($item->long_aktual);
            })->map(function($item) {
                return [
                    'id_monitoring_harian' => $item->id, 
                    'tipe_objek' => $item->tipe_objek,
                    'tindakan'   => $item->tindakan, 
                    'lat'        => (float) $item->lat_aktual,
                    'long'       => (float) $item->long_aktual,
                    'skor_titik' => $item->rata_rata_skor,
                    'tanggal'    => Carbon::parse($item->tanggal)->format('d-m-Y'),
                    'foto_path'  => $item->foto_path,
                ];
            });

            return [
                'id'       => $lokasi->id,
                'afdeling' => $lokasi->afdeling,
                'blok'     => $lokasi->blok,
                'status_terkini' => [
                    'skoring_harian' => [
                        'skor'    => number_format($rerataSkorBulanan, 2),
                        'status'  => $dataMonitoring->count() > 0 ? $statusInfo['kategori'] : 'Tanpa Data',
                        'periode' => "$month-$year", 
                        'total_laporan' => $dataMonitoring->count(),
                        'titik_koordinat' => $formattedCoords->values()->toArray()
                    ]
                ]
            ];
        });

        return response()->json([
            'status'  => true,
            'message' => "Berhasil mengambil status lokasi untuk bulan $month tahun $year",
            'data'    => $result
        ]);
    }

    /**
     * Get Detail Satu Titik Monitoring
     */
    public function getDetailMonitoring($id)
    {
        $item = MonitoringHarian::find($id); 

        if (!$item) {
            return response()->json([
                'status'  => false, 'message' => 'Data tidak ditemukan', 'data' => null
            ], 404);
        }

        return response()->json([
            'status'  => true,
            'message' => 'Berhasil mengambil detail monitoring',
            'data'    => [
                'foto_path'  => $item->foto_path,
                'foto_after' => $item->foto_after,
                'tanggal'    => Carbon::parse($item->tanggal)->format('d-m-Y'),
                'tipe_objek' => $item->tipe_objek,
                'tindakan'   => $item->tindakan,
                'skor'       => $item->rata_rata_skor
            ]
        ]);
    }


    public function cekInfraStatus() 
    {
       
        $subQuery = MonitoringMingguan::select('id_objek', DB::raw('MAX(id) as latest_id'))
            ->whereNotNull('id_objek') // Pastikan id_objek tidak null
            ->groupBy('id_objek');

        $infraStatus = MonitoringMingguan::joinSub($subQuery, 'latest_records', function ($join) {
                $join->on('monitoring_mingguan.id', '=', 'latest_records.latest_id');
            })
            ->get()
            ->map(function($item) {
                return [
                    'id_lokasi' => $item->id_lokasi,
                    'id_objek'  => $item->id_objek,
                    'jenis'     => $item->jenis_infrastruktur,
                    'status'    => StatusHelper::determineStatus($item->rata_rata_skor)['kategori'],
                    'skor'      => number_format($item->rata_rata_skor, 2),
                    'tanggal'   => Carbon::parse($item->tanggal)->format('d-m-Y'), // Tgl aktual laporan terbaru
                    'lat'       => (float) $item->lat_aktual,
                    'long'      => (float) $item->long_aktual,
                    'foto_path' => $item->foto_path,
                ];
            });

        return response()->json([
            'status' => 'success', 
            'message' => 'Data kondisi infrastruktur terbaru berhasil diambil',
            'data' => $infraStatus
        ]);
    }

    /**
     * Get Data Water Level
     * Logic: SELALU AMBIL DATA TERBARU (Latest Record per No WL)
     * Tidak dipengaruhi filter bulan/tahun
     */
    public function cekWaterLevelStatus() 
    {
        // 1. Cari ID tertinggi (terbaru) untuk setiap no_water_level unik
        $latestWLIds = WaterLevel::selectRaw('MAX(id) as id')
            ->whereNotNull('no_water_level')
            ->groupBy('no_water_level')
            ->pluck('id');

        // 2. Ambil detail data berdasarkan ID tersebut
        $WLStatus = WaterLevel::whereIn('id', $latestWLIds)
            ->get()
            ->map(function($item) {
                return [
                    'no_water_level' => $item->no_water_level,
                    'status'         => StatusHelper::determineStatus($item->rata_rata_skor)['kategori'],
                    'skor'           => number_format($item->rata_rata_skor, 2),
                    'tanggal'        => Carbon::parse($item->tanggal)->format('d-m-Y'),
                    'lat'            => (float) $item->lat_aktual,
                    'long'           => (float) $item->long_aktual,
                    'foto_path'      => $item->foto_path,
                ];
            });

        return response()->json([
            'status' => 'success', 
            'message' => 'Data water level terbaru berhasil diambil',
            'data' => $WLStatus
        ]);
    }
}