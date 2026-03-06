<?php

use App\Http\Controllers\AnalyticsController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\GISController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\WaterLevelController;
use App\Http\Controllers\TideScrapeController;
Route::apiResource('lokasi', App\Http\Controllers\LokasiController::class);
Route::apiResource('skoring', App\Http\Controllers\SkoringController::class);
Route::apiResource('karyawan', App\Http\Controllers\KaryawanController::class);
Route::apiResource('infrastructure-master', App\Http\Controllers\InfrastructureMasterController::class);
Route::apiResource('water-level-master', App\Http\Controllers\WaterLevelMasterController::class);
Route::apiResource('monitoring-harian', App\Http\Controllers\MonitoringHarianController::class);
Route::apiResource('monitoring-mingguan', App\Http\Controllers\MonitoringMingguanController::class);
Route::apiResource('water-level', WaterLevelController::class);
Route::prefix('list')->group(function () {
    Route::get('karyawan', [App\Http\Controllers\KaryawanController::class, 'listKaryawan']);
    Route::get('lokasi', [App\Http\Controllers\LokasiController::class, 'listLokasi']);
    Route::get('skoring/{kategori?}', [App\Http\Controllers\SkoringController::class, 'listKategori']);
    Route::get('infrastructure-master', [App\Http\Controllers\InfrastructureMasterController::class, 'listInfrastructureMaster']);
    Route::get('water-level-master', [App\Http\Controllers\WaterLevelMasterController::class, 'listWaterLevelMaster']);
});
Route::prefix('export')->group(function () {
    Route::get('monitoring-all', [App\Http\Controllers\XlsController::class, 'exportAll']);
    Route::get('monitoring-detail/{id}', [App\Http\Controllers\XlsController::class, 'exportDetail']);
});
Route::get('dashboard', [DashboardController::class, 'index']);
Route::get('water-level-status', [DashboardController::class, 'waterLevelStatus']);
Route::get('recent-activities', [DashboardController::class, 'recentActivities'] );
Route::get('infrastructure-status', [DashboardController::class,'infrastructureStatus']);
Route::get('/gis/all-status', [GISController::class, 'index']); // Ambil semua untuk warnai map
Route::get('/gis/status', [GISController::class, 'getStatusByBlok']); // Detail saat diklik
Route::get('gis/cek-infra',[GISController::class, 'cekInfraStatus']);
Route::get('gis/detail-monitoring/{id_monitoring}',[GISController::class, 'getDetailMonitoring']);
Route::get('gis/cek-water-level',[GISController::class, 'cekWaterLevelStatus']);
Route::get('gis/cek-infra/{id_objek}',[GISController::class, 'cekInfraDetail']);
Route::get('gis/tide-samarinda', [TideScrapeController::class, 'getTideData']);
Route::prefix('analytics')->group(function () {
    Route::get('/performance', [AnalyticsController::class, 'index']);
    Route::get('/stats', [AnalyticsController::class, 'stats']);
    Route::get('/counts', [AnalyticsController::class, 'countMonitoring']);
    Route::get('/detail/{id_lokasi}', [AnalyticsController::class, 'show']);
    Route::get('/water-level-trend', [AnalyticsController::class, 'waterLevelChart']);
    Route::get('/infra-breakdown', [AnalyticsController::class, 'infraBreakdown']);
    Route::get('/infra-vs-wl', [AnalyticsController::class, 'analyticsStatus']);
});