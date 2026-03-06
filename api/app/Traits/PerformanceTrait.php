<?php

namespace App\Traits;

use App\Models\MonitoringHarian;
use App\Models\MonitoringMingguan;
use App\Models\WaterLevel;
use App\Helpers\StatusHelper;

trait PerformanceTrait
{
    public function calculateWeightedPerformance($id_lokasi, $month, $year)
    {
        // Ambil rata-rata skor satu bulan penuh (Logika Analytics)
        $harian = MonitoringHarian::where('id_lokasi', $id_lokasi)->whereMonth('tanggal', $month)->whereYear('tanggal', $year)->avg('rata_rata_skor');
        $mingguan = MonitoringMingguan::where('id_lokasi', $id_lokasi)->whereMonth('tanggal', $month)->whereYear('tanggal', $year)->avg('rata_rata_skor');
        $water = WaterLevel::where('id_lokasi', $id_lokasi)->whereMonth('tanggal', $month)->whereYear('tanggal', $year)->avg('rata_rata_skor');

        $totalWeighted = 0; $activeWeight = 0;
        $map = [['val' => $harian, 'w' => 0.4], ['val' => $mingguan, 'w' => 0.3], ['val' => $water, 'w' => 0.3]];

        foreach ($map as $m) {
            if (!is_null($m['val'])) {
                $totalWeighted += ($m['val'] * $m['w']);
                $activeWeight += $m['w'];
            }
        }

        $final = $activeWeight > 0 ? ($totalWeighted / $activeWeight) : 0;

        return [
            'scores' => [
                'harian'         => round($harian ?? 0, 2),
                'mingguan'       => round($mingguan ?? 0, 2),
                'water_level'    => round($water ?? 0, 2),
                'final_weighted' => round($final, 2),
            ],
            'analisa' => StatusHelper::determineStatus($final),
            'metadata' => [
                'total_laporan_harian' => MonitoringHarian::where('id_lokasi', $id_lokasi)->whereMonth('tanggal', $month)->whereYear('tanggal', $year)->count(),
            ]
        ];
    }
}