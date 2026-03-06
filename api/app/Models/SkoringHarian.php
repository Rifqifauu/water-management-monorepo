<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
// Pastikan model master Skoring di-import atau dipanggil dengan namespace lengkap
use App\Models\Skoring; 

class SkoringHarian extends Model
{
    protected $table = 'skoring_harians';

    protected $fillable = [
        'id_monitoring_harian', 
        'skor_kedalaman',
        'skor_jumlah_pokok',
        'skor_durasi',
        'skor_aliran',
        'skor_penyebab',
        'total_skor',
    ];


    protected static $cachedRules = null;

    public static function getScore($kategori, $value)
    {
        
        if (self::$cachedRules === null) {
            self::$cachedRules = Skoring::all()->groupBy('kategori_parameter');
        }

        if (is_null($value) || $value === '') return 0;

   
        $categoryRules = self::$cachedRules->get($kategori);
        
        if (!$categoryRules) return 0;

        // 4. Loop Logic Penilaian
        foreach ($categoryRules as $rule) {
            // Cek Pencocokan String (Label)
            if (!empty($rule->label_kondisi)) {
                if (strcasecmp($rule->label_kondisi, $value) == 0) return $rule->skor;
                // Handle kasus angka yang dianggap string
                if (is_numeric($value) && (string)$value === (string)$rule->label_kondisi) return $rule->skor;
            }
            
            // Cek Pencocokan Angka (Range)
            if (is_numeric($value)) {
                $val = (float) $value;
                $min = $rule->min_value !== null ? (float) $rule->min_value : null;
                $max = $rule->max_value !== null ? (float) $rule->max_value : null;

                if ($min !== null && $max !== null) { // Range Tengah (Antara X dan Y)
                    if ($val >= $min && $val <= $max) return $rule->skor;
                } elseif ($min !== null && $max === null) { // Range Atas (Lebih dari X)
                    if ($val >= $min) return $rule->skor;
                } elseif ($min === null && $max !== null) { // Range Bawah (Kurang dari Y)
                    if ($val <= $max) return $rule->skor;
                }
            }
        }
        
        return 0; // Default jika tidak masuk range manapun
    }

    public function totalSkor($columns)
    {
        return array_sum(array_map(function ($column) {
            return is_numeric($column) ? (int) $column : 0;
        }, $columns));
    }

    public static function checkStatus($nilai)
    {
        $nilai = is_numeric($nilai) ? (float) $nilai : 0;

        $rules = [
            [
                'kategori' => 'Kritis',
                'min'      => 40,
                'max'      => null, 
                'tindakan' => 'Tindakan segera'
            ],
            [
                'kategori' => 'Tinggi',
                'min'      => 30,
                'max'      => 39.9, // Pakai desimal agar 39.5 tidak lolos
                'tindakan' => 'Tindakan dalam 24 jam'
            ],
            [
                'kategori' => 'Sedang',
                'min'      => 20,
                'max'      => 29.9,
                'tindakan' => 'Tindakan dalam 2-3 hari'
            ],
            [
                'kategori' => 'Rendah',
                'min'      => 10,
                'max'      => 19.9,
                'tindakan' => 'Monitoring rutin'
            ],
            [
                'kategori' => 'Minimal',
                'min'      => 0.1,
                'max'      => 9.9,
                'tindakan' => 'Tidak perlu tindakan'
            ],
        ];

        foreach ($rules as $r) {
            if ($r['min'] !== null && $r['max'] !== null) {
                if ($nilai >= $r['min'] && $nilai <= $r['max']) return $r;
            } elseif ($r['min'] !== null && $r['max'] === null) {
                if ($nilai >= $r['min']) return $r;
            } elseif ($r['min'] === null && $r['max'] !== null) {
                // Range Bawah (ex: <= 9.9)
                if ($nilai <= $r['max']) return $r;
            }
        }

        return [
            'kategori' => 'Tidak Terdefinisi',
            'tindakan' => '-',
        ];
    }
}