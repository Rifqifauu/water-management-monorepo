<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Skoring extends Model
{
    protected $table = 'skoring';
    
    protected $fillable = [
        'unit',
        'kategori_parameter',
        'label_kondisi',
        'min_value',
        'max_value',
        'skor',
        'keterangan',
    ];

    protected $casts = [
        // Pastikan kolom ini dikonversi ke tipe data yang benar
        'min_value' => 'float',
        'max_value' => 'float',
        'skor'      => 'integer',
    ];
}