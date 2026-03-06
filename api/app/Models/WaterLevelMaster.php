<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WaterLevelMaster extends Model
{
    protected $fillable = [
        'no_wl',
        'id_lokasi',
        'latitude',
        'longitude',
    ];
    public function lokasi()
    {
        return $this->belongsTo(Lokasi::class, 'id_lokasi');
    }
}
