<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class MonitoringHarian extends Model
{
    use HasFactory;

    protected $table = 'monitoring_harian';

    protected $fillable = [
        // Metadata & Lokasi
        'tanggal',
        'id_lokasi',
        'id_karyawan',
        'lat_aktual',
        'long_aktual',
        
        // Data Lapangan (Raw Data)
        'tipe_objek',
        'nomor_jalur',
        'kedalaman_cm',
        'jumlah_pokok',
        'durasi_genangan',
        'kondisi_aliran',
        'penyebab',
        'tindakan',
        'foto_path',
        'foto_after',
        'keterangan',

        'skor_kedalaman',
        'skor_jumlah_pokok',
        'skor_durasi',
        'skor_aliran',
        'skor_penyebab',
        'skor_tindakan',
        
        'rata_rata_skor',
    ];

    /**
     * Casting data agar tipe data otomatis terkonversi saat diakses
     */
    protected $casts = [
        'tanggal' => 'date',
        'lat_aktual' => 'float',
        'long_aktual' => 'float',
        'rata_rata_skor' => 'float',
        'skor_kedalaman' => 'integer',
        'skor_jumlah_pokok' => 'integer',
        'skor_durasi' => 'integer',
        'skor_aliran' => 'integer',
        'skor_penyebab' => 'integer',
        'skor_tindakan' => 'integer',
    ];

    // --- RELASI ---

    public function lokasi()
    {
        return $this->belongsTo(Lokasi::class, 'id_lokasi', 'id');
    }

    public function karyawan()
    {
        return $this->belongsTo(Karyawan::class, 'id_karyawan', 'id');
    }


}