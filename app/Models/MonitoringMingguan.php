<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MonitoringMingguan extends Model
{
    protected $table = 'monitoring_mingguan';
  protected $fillable = [
    'tanggal', 'id_lokasi', 'id_karyawan', 'id_objek', 'lat_aktual', 'long_aktual',
    'jenis_infrastruktur', 'kondisi_aliran', 'penyebab', 'tindakan', 'keterangan', 
    'skor_aliran', 'skor_penyebab', 'skor_tindakan', 'rata_rata_skor', 'foto_path', 'foto_after'
];
protected $casts = [
    'tanggal' => 'date',
];
    public function lokasi()
    {
        return $this->belongsTo(Lokasi::class, 'id_lokasi', 'id');
    }
    public function karyawan(){
        return $this->belongsTo(Karyawan::class, 'id_karyawan', 'id');
    }
}

