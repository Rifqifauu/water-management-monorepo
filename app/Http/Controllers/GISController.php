<?php

namespace App\Http\Controllers;

use App\Helpers\StatusHelper;
use App\Models\Lokasi;
use App\Models\MonitoringHarian;
use App\Models\MonitoringMingguan;
use App\Models\WaterLevel;
use App\Traits\PerformanceTrait;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class GISController extends Controller
{
    use PerformanceTrait;

    /**
     * Get Data Monitoring Harian (Blok)
     * Filter: month & year
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        $month = $request->query('month', now()->month);
        $year  = $request->query('year', now()->year);

        $locations = Lokasi::all();

        $dailyData = MonitoringHarian::whereMonth('tanggal', $month)
            ->whereYear('tanggal', $year)
            ->get()
            ->groupBy('id_lokasi');

            $result = $locations->map(function ($lokasi) use ($dailyData, $month, $year) {
            $dataMonitoring = $dailyData->get($lokasi->id, collect([]));
            $rerataSkorBulanan = $dataMonitoring->count() > 0 ? $dataMonitoring->avg('rata_rata_skor') : 0;
            $statusInfo = StatusHelper::determineStatus($rerataSkorBulanan);

            $formattedCoords = $dataMonitoring->filter(function ($item) {
                return !is_null($item->lat_aktual) && !is_null($item->long_aktual);
            })->map(function ($item) {
                return [
                    'id_monitoring_harian' => $item->id,
                    'tipe_objek'           => $item->tipe_objek,
                    'tindakan'             => $item->tindakan,
                    'lat'                  => (float) $item->lat_aktual,
                    'long'                 => (float) $item->long_aktual,
                    'skor_titik'           => $item->rata_rata_skor,
                    'tanggal'              => Carbon::parse($item->tanggal)->format('d-m-Y'),
                    'foto_path'            => $item->foto_path,
                ];
            });

            return [
                'id'             => $lokasi->id,
                'afdeling'       => $lokasi->afdeling,
                'blok'           => $lokasi->blok,
                'status_terkini' => [
                    'skoring_harian' => [
                        'skor'            => number_format($rerataSkorBulanan, 2),
                        'status'          => $dataMonitoring->count() > 0 ? $statusInfo['kategori'] : 'Tanpa Data',
                        'periode'         => "{$month}-{$year}",
                        'total_laporan'   => $dataMonitoring->count(),
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
     * Get Detail Monitoring Harian
     *
     * @param int $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function getDetailMonitoring($id)
    {
        $item = MonitoringHarian::find($id);

        if (!$item) {
            return response()->json([
                'status'  => false,
                'message' => 'Data tidak ditemukan',
                'data'    => null
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

    /**
     * Get Data Kondisi Infrastruktur (Mingguan)
     * Filter: month & year (Opsional, jika kosong ambil data terbaru)
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function cekInfraStatus(Request $request)
    {
        $month = $request->query('month');
        $year  = $request->query('year');

        $subQuery = MonitoringMingguan::select('id_objek', DB::raw('MAX(id) as latest_id'))
            ->whereNotNull('id_objek')
            ->when($month && $year, function ($query) use ($month, $year) {
                $query->whereMonth('tanggal', $month)->whereYear('tanggal', $year);
            })
            ->groupBy('id_objek');

        $infraStatus = MonitoringMingguan::joinSub($subQuery, 'latest_records', function ($join) {
            $join->on('monitoring_mingguan.id', '=', 'latest_records.latest_id');
        })
            ->get()
            ->map(function ($item) {
                return [
                    'id_lokasi' => $item->id_lokasi,
                    'id_objek'  => $item->id_objek,
                    'jenis'     => $item->jenis_infrastruktur,
                    'status'    => StatusHelper::determineStatus($item->rata_rata_skor)['kategori'],
                    'skor'      => number_format($item->rata_rata_skor, 2),
                    'tanggal'   => Carbon::parse($item->tanggal)->format('d-m-Y'),
                    'lat'       => (float) $item->lat_aktual,
                    'long'      => (float) $item->long_aktual,
                    'foto_path' => $item->foto_path,
                ];
            });

        return response()->json([
            'status'  => 'success',
            'message' => ($month && $year) ? "Data infra bulan $month-$year" : "Data infra terbaru berhasil diambil",
            'data'    => $infraStatus
        ]);
    }

    /**
     * Get Data Water Level
     * Filter: month & year (Opsional, jika kosong ambil data terbaru)
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function cekWaterLevelStatus(Request $request)
    {
        $month = $request->query('month');
        $year  = $request->query('year');

        $latestWLIds = WaterLevel::selectRaw('MAX(id) as id')
            ->whereNotNull('no_water_level')
            ->when($month && $year, function ($query) use ($month, $year) {
                $query->whereMonth('tanggal', $month)->whereYear('tanggal', $year);
            })
            ->groupBy('no_water_level')
            ->pluck('id');

        $WLStatus = WaterLevel::whereIn('id', $latestWLIds)
            ->get()
            ->map(function ($item) {
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
            'status'  => 'success',
            'message' => ($month && $year) ? "Data water level bulan $month-$year" : "Data water level terbaru berhasil diambil",
            'data'    => $WLStatus
        ]);
    }
}