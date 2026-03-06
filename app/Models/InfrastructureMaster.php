<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class InfrastructureMaster extends Model
{
    protected $fillable = [
        'id_lokasi',
        'id_object',
        'category',
        'latitude',
        'longitude',
    ];
    public function lokasi()
    {
        return $this->belongsTo(Lokasi::class, 'id_lokasi');
    }
}
