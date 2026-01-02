<?php
// database/migrations/xxxx_xx_xx_create_mst_lokasi_table.php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('lokasi', function (Blueprint $table) {
            $table->id('id');
            $table->string('afdeling', 50);
            $table->string('blok', 20);
            $table->decimal('luas_ha', 10, 2)->nullable();
            $table->decimal('latitude', 10, 8)->nullable()->comment('Titik tengah X');
            $table->decimal('longitude', 11, 8)->nullable()->comment('Titik tengah Y');
            $table->json('batas_area')->nullable()->comment('Menyimpan GeoJSON Polygon jika perlu');
            $table->timestamps();
            $table->unique(['afdeling', 'blok']);
        });
    }

    public function down()
    {
        Schema::dropIfExists('lokasi');
    }
};