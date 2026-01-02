<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Lokasi;
use App\Models\MonitoringHarian;
use App\Models\WaterLevel;
use App\Models\MonitoringMingguan;
use App\Helpers\StatusHelper;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    /**
     * Helper untuk mendapatkan bulan dan tahun saat ini.
     */
    private function getCurrentPeriod()
    {
        return [
            'month' => now()->month,
            'year' => now()->year
        ];
    }

    /**
     * Ringkasan Statistik Utama (Filtered by This Month)
     */
    public function index()
    {
        $period = $this->getCurrentPeriod();

        // 1. Ambil lokasi yang hanya memiliki aktivitas di bulan ini
        $lokasiList = Lokasi::where(function($query) use ($period) {
                $query->whereHas('monitoringHarian', fn($q) => $q->whereMonth('tanggal', $period['month'])->whereYear('tanggal', $period['year']))
                      ->orWhereHas('monitoringMingguan', fn($q) => $q->whereMonth('tanggal', $period['month'])->whereYear('tanggal', $period['year']))
                      ->orWhereHas('waterLevel', fn($q) => $q->whereMonth('tanggal', $period['month'])->whereYear('tanggal', $period['year']));
            })
            // 2. Hitung rata-rata skor per kategori di bulan ini
            ->withAvg(['monitoringHarian as avg_harian' => fn($q) => $q->whereMonth('tanggal', $period['month'])->whereYear('tanggal', $period['year'])], 'rata_rata_skor')
            ->withAvg(['monitoringMingguan as avg_mingguan' => fn($q) => $q->whereMonth('tanggal', $period['month'])->whereYear('tanggal', $period['year'])], 'rata_rata_skor')
            ->withAvg(['waterLevel as avg_water' => fn($q) => $q->whereMonth('tanggal', $period['month'])->whereYear('tanggal', $period['year'])], 'rata_rata_skor')
            ->get();

        $stats = [
            'Kelas 1' => 0,
            'Kelas 2' => 0,
            'Kelas 3' => 0,
            'total_lokasi_aktif' => $lokasiList->count(),
            'rata_rata_keseluruhan' => 0,
        ];

        $totalScoreSum = 0;

        foreach ($lokasiList as $lokasi) {
            $score = 0; 
            $weight = 0;

            // Bobot: Harian (40%), Mingguan (30%), Water Level (30%)
            if (!is_null($lokasi->avg_harian)) { 
                $score += ($lokasi->avg_harian * 0.4); 
                $weight += 0.4; 
            }
            if (!is_null($lokasi->avg_mingguan)) { 
                $score += ($lokasi->avg_mingguan * 0.3); 
                $weight += 0.3; 
            }
            if (!is_null($lokasi->avg_water)) { 
                $score += ($lokasi->avg_water * 0.3); 
                $weight += 0.3; 
            }

            $finalScore = $weight > 0 ? ($score / $weight) : 0;
            $totalScoreSum += $finalScore;

            $analisa = StatusHelper::determineStatus($finalScore);
            $kategori = $analisa['kategori'] ?? 'Kelas 3';

            if (isset($stats[$kategori])) {
                $stats[$kategori]++;
            }
        }

        if ($stats['total_lokasi_aktif'] > 0) {
            $stats['rata_rata_keseluruhan'] = round($totalScoreSum / $stats['total_lokasi_aktif'], 2);
        }

        return response()->json([
            'status' => true,
            'data'   => $stats,
            'periode' => now()->translatedFormat('F Y')
        ]);
    }

    /**
     * Aktivitas Terbaru (Global - Tidak Difilter Bulan)
     */
    public function recentActivities() 
    {
        $harian = MonitoringHarian::with(['lokasi', 'karyawan'])
            ->latest()
            ->take(5)
            ->get()
            ->map(fn($item) => $this->formatLog($item, 'Daily'));

        $mingguan = MonitoringMingguan::with(['lokasi', 'karyawan'])
            ->latest()
            ->take(5)
            ->get()
            ->map(fn($item) => $this->formatLog($item, 'Infrastructure'));

        $water = WaterLevel::with(['lokasi', 'karyawan'])
            ->latest()
            ->take(5)
            ->get()
            ->map(fn($item) => $this->formatLog($item, 'Water Level'));

        $recentRecords = $harian->concat($mingguan)->concat($water)
            ->sortByDesc('created_at')
            ->take(8)
            ->values();

        return response()->json($recentRecords);
    }

    /**
     * Status Infrastruktur (Filtered by This Month)
     */
    public function infrastructureStatus()
    {
        $period = $this->getCurrentPeriod();

        $latestIds = DB::table('monitoring_mingguan')
            ->select(DB::raw('MAX(id) as latest_id'))
            ->whereMonth('tanggal', $period['month'])
            ->whereYear('tanggal', $period['year'])
            ->groupBy('id_lokasi', 'jenis_infrastruktur')
            ->pluck('latest_id');

        $data = DB::table('monitoring_mingguan')
            ->whereIn('id', $latestIds)
            ->get();

        $totalLocationsChecked = $data->unique('id_lokasi')->count();
        $categories = ['Jembatan', 'Pipa (PVC)', 'Gorong-Gorong Baja (NF)'];
        
        $details = collect($categories)->map(function ($kind) use ($data) {
            $items = $data->where('jenis_infrastruktur', $kind);
            
            $kelas1 = 0; $kelas2 = 0; $kelas3 = 0;

            foreach ($items as $item) {
                $analisa = StatusHelper::determineStatus($item->rata_rata_skor);
                $status = $analisa['kategori']; 

                if ($status === 'Kelas 1') $kelas1++;
                elseif ($status === 'Kelas 2') $kelas2++;
                elseif ($status === 'Kelas 3') $kelas3++;
            }

            return [
                'jenis' => $kind,
                'Kelas 1' => $kelas1,
                'Kelas 2' => $kelas2,
                'Kelas 3' => $kelas3,
                'total' => $items->count(),
            ];
        });

        return response()->json([
            'status' => true,
            'total_locations_checked' => $totalLocationsChecked,
            'details' => $details
        ]);
    }

    /**
     * Status Water Level (Filtered by This Month)
     */
    public function waterLevelStatus()
    {
        $period = $this->getCurrentPeriod();

        $latestIds = DB::table('water_levels')
            ->select(DB::raw('MAX(id) as latest_id'))
            ->whereMonth('tanggal', $period['month'])
            ->whereYear('tanggal', $period['year'])
            ->groupBy('id_lokasi')
            ->pluck('latest_id');

        $data = DB::table('water_levels')
            ->whereIn('id', $latestIds)
            ->get();

        $kelas1 = 0; $kelas2 = 0; $kelas3 = 0;

        foreach ($data as $item) {
            $analisa = StatusHelper::determineStatus($item->rata_rata_skor);
            $status = $analisa['kategori'];

            if ($status === 'Kelas 1') $kelas1++;
            elseif ($status === 'Kelas 2') $kelas2++;
            elseif ($status === 'Kelas 3') $kelas3++;
        }

        return response()->json([
            'status' => true,
            'data' => [
                'Kelas 1' => $kelas1,
                'Kelas 2' => $kelas2,
                'Kelas 3' => $kelas3,
                'total_lokasi' => $data->count()
            ]
        ]);
    }

    /**
     * Formatter Log untuk Recent Activities
     */
    private function formatLog($item, $type)
    {
        try {
            $tglDisplay = $item->tanggal ? Carbon::parse($item->tanggal)->diffForHumans() : '-';
        } catch (\Exception $e) {
            $tglDisplay = '-';
        }

        return [
            'id' => $item->id,
            'type' => $type,
            'lokasi' => $item->lokasi ? "Blok {$item->lokasi->blok} - Afdeling {$item->lokasi->afdeling}" : 'Unknown',
            'karyawan' => $item->karyawan->nama ?? 'System',
            'skor' => round($item->rata_rata_skor, 2),
            'tanggal' => $tglDisplay,
            'created_at' => $item->created_at
        ];
    }
}