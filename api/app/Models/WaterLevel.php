<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WaterLevel extends Model
{
    protected $table = 'water_levels';

    protected $fillable = [
        'tanggal',
        'id_lokasi',
        'id_karyawan',
        'lat_aktual',
        'long_aktual',
        'no_water_level',
        'tinggi_level_air',
        'jarak_ke_bibir',
        'kondisi_aliran',
        'risiko',
        'kapasitas_drainase',
        'skor_ketinggian',
        'skor_jarak',
        'skor_aliran',
        'skor_risiko',
        'skor_drainase',
        'rata_rata_skor',
        'foto_path',
        'keterangan'
    ];
    
    public function lokasi()
    {
        return $this->belongsTo(Lokasi::class, 'id_lokasi', 'id');
    }

    public function karyawan()
    {
        return $this->belongsTo(Karyawan::class, 'id_karyawan', 'id');
    }
}