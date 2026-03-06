<?php

namespace App\Helpers;

class StatusHelper
{
    /**
     * Menentukan kategori status dan rekomendasi berdasarkan skor terbobot (1.0 - 3.0)
     * * @param float $score
     * @return array
     */
    public static function determineStatus($score)
    {

        if ($score >= 2.5) {
            return [
                'kategori'    => 'Kelas 1',
                'label_color' => 'green',
                'tindakan'    => 'Kondisi sangat baik, Maintenance Rutin Cukup'
            ];
        } 
        elseif ($score >= 1.5) {
            return [
                'kategori'    => 'Kelas 2',
                'label_color' => 'yellow',
                'tindakan'    => 'Kondisi sedang, perlu peningkatan perawatan'
            ];
        } 
        elseif ($score >= 1.0) {
            return [
                'kategori'    => 'Kelas 3',
                'label_color' => 'red',
                'tindakan'    => 'Kondisi buruk, perlu tindakan perbaikan segera'
            ];
        }

        // Default jika data di bawah 1.0 atau tidak valid
        return [
            'kategori'    => 'Belum Ada',
            'label_color' => 'gray',
            'tindakan'    => 'Data laporan belum mencukupi untuk penilaian'
        ];
    }

    /**
     * * @param string|null $status
     * @return int
     */
    public static function statusToScore($status)
    {
        return match ($status) {
            'Good Condition'     => 3,
            'Need Maintenance'   => 2,
            'Urgent Condition'   => 1,
            default              => 0,
        };
    }
    
}