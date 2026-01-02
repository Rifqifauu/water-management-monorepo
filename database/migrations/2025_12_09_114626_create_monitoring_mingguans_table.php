<?php
// database/migrations/xxxx_xx_xx_create_trn_monitoring_mingguan_table.php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('monitoring_mingguan', function (Blueprint $table) {
            $table->id('id');
            $table->date('tanggal');
            // Foreign Keys
            $table->foreignId('id_lokasi')->constrained('lokasi', 'id')->onDelete('cascade');
            $table->foreignId('id_karyawan')->nullable()->constrained('karyawan', 'id');
            // Data GIS Aktual (Lokasi Petugas saat input)
            $table->decimal('lat_aktual', 10, 8)->nullable()->comment('Lokasi GPS HP Petugas');
            $table->decimal('long_aktual', 11, 8)->nullable();
            // Detail Monitoring
            $table->string('jenis_infrastruktur', 50);
            $table->string('kondisi_aliran', 50)->nullable();  // e.g., 'Tidak Mengalir'
            $table->string('penyebab', 50)->nullable();  // e.g., 'Sampah', 'Penuh'
            $table->string('tindakan')->nullable();
            $table->string('foto_path')->nullable();
            $table->string('foto_after')->nullable();
            
            // Path file upload
            $table->text('keterangan')->nullable();

            $table->timestamps(); // created_at, updated_at
            
            $table->index(['lat_aktual', 'long_aktual']);
        });
    }

    public function down()
    {
        Schema::dropIfExists('monitoring_mingguan');
    }
};