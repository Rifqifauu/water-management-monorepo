<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('water_levels', function (Blueprint $table) {
            $table->id();
            $table->date('tanggal');
            
            // Foreign Keys
            $table->foreignId('id_lokasi')->constrained('lokasi', 'id')->onDelete('cascade');
            $table->foreignId('id_karyawan')->nullable()->constrained('karyawan', 'id');

            // Data GIS Aktual (Lokasi Petugas saat input)
            $table->decimal('lat_aktual', 10, 8)->nullable()->comment('Lokasi GPS HP Petugas');
            $table->decimal('long_aktual', 11, 8)->nullable();

            $table->integer('no_water_level');
            $table->integer('tinggi_level_air');
            $table->string('foto_path')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('water_levels');
    }
};
