<?php
// database/migrations/xxxx_xx_xx_create_master_referensi_tables.php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
      

        Schema::create('skoring', function (Blueprint $table) {
            $table->id('id');
            $table->string('kategori_parameter', 50);
            $table->string('label_kondisi', 100);     
            $table->string('keterangan', 100)->nullable();
            $table->decimal('min_value', 10, 2)->nullable(); 
            $table->decimal('max_value', 10, 2)->nullable();
            $table->integer('skor'); 

            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('skoring');
    }
};
