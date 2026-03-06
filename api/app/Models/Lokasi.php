<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Lokasi extends Model
{
    protected $table = 'lokasi';
    protected $fillable = [
        'afdeling',
        'blok',
        'luas_ha',
        'latitude',
        'longitude',
        'batas_area',
    ];
    // App\Models\Lokasi.php

public function latestWaterLevel()
{
    return $this->hasOne(WaterLevel::class, 'id_lokasi')->latestOfMany();
}

public function latestInfra()
{
    return $this->hasOne(MonitoringMingguan::class, 'id_lokasi')->latestOfMany();
}
// App\Models\Lokasi.php
public function monitoringHarian() {
    return $this->hasMany(MonitoringHarian::class, 'id_lokasi');
}
public function monitoringMingguan() {
    return $this->hasMany(MonitoringMingguan::class, 'id_lokasi');
}
public function waterLevel() {
    return $this->hasMany(WaterLevel::class, 'id_lokasi');
}
}
