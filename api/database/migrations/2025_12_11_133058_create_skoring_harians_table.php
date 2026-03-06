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
        Schema::create('skoring_harians', function (Blueprint $table) {
            $table->id();
            
            // 1. FOREIGN KEY (Penghubung ke Monitoring)
            // Menggunakan unsignedBigInteger agar tipe datanya sama persis dengan id di tabel monitoring
            $table->unsignedBigInteger('id_monitoring_harian');
            
            // Membuat relasi: Jika data di monitoring_harians dihapus, data skoring ini ikut terhapus (cascade)
            $table->foreign('id_monitoring_harian')
                  ->references('id')
                  ->on('monitoring_harian')
                  ->onDelete('cascade');

            // 2. DATA SKOR
            // Saran: Gunakan 'integer' (atau 'float'), JANGAN 'string' agar bisa dijumlahkan secara matematika.
            // Gunakan default(0) agar tidak error jika kosong.
            $table->integer('skor_kedalaman')->default(0);
            $table->integer('skor_jumlah_pokok')->default(0);
            $table->integer('skor_durasi')->default(0);
            $table->integer('skor_aliran')->default(0);
            $table->integer('skor_penyebab')->default(0);
            
            // Total skor juga integer
            $table->integer('total_skor')->default(0);

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('skoring_harians');
    }
};