<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Http;
use Carbon\Carbon;

class TideScrapeController extends Controller
{
    /**
     * Ambil Data Pasut Samarinda
     * Prioritas Data: MSL (Mean Sea Level) agar sesuai grafik BMKG
     */
    public function getTideData()
    {
        // ID Stasiun Samarinda (4000000017)
        $stationId = '4000000017'; 

        // Cache 3 jam
        return Cache::remember("tide_samarinda_msl_v1", 60 * 60 * 3, function () use ($stationId) {
            
            // Format Tanggal API (Ymd)
            $startDate = now()->format('Ymd');
            $endDate = now()->addDays(3)->format('Ymd');
            
            // URL API (UTC)
            $url = "https://maritim.bmkg.go.id/pasut/data/UTC/{$stationId}/{$startDate}/{$endDate}";

            try {
                $response = Http::withHeaders([
                    'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)',
                    'Referer' => 'https://maritim.bmkg.go.id/cuaca/pasut'
                ])->get($url);

                if ($response->successful()) {
                    $rawData = $response->json();
                    $cleanData = [];
                    
                    if (is_array($rawData)) {
                        foreach ($rawData as $item) {
                            // 1. LOGIKA UTAMA: Pilih MSL dulu, kalau tidak ada baru EST
                            // 'msl' = nilai relatif terhadap rata-rata laut (bisa negatif)
                            // 'est' = nilai absolut (selalu positif tinggi)
                            $tinggi = $item['msl'] ?? $item['est'] ?? 0;

                            // 2. Format Waktu (UTC ke WITA)
                            $rawTime = $item['t'] ?? null;
                            $waktuDisplay = '-';
                            
                            if ($rawTime) {
                                // Parse format ISO: "2026-01-02T00:00+00:00"
                                $date = Carbon::parse($rawTime);
                                
                                // Ubah ke Timezone WITA (Samarinda)
                                $date->setTimezone('Asia/Makassar');
                                
                                // Format tampilan: 02 Jan 08:00
                                $waktuDisplay = $date->format('d M Y H:i') . ' WITA';
                            }

                            $cleanData[] = [
                                'waktu' => $waktuDisplay,
                                'tinggi' => $tinggi . ' m' // Output contoh: "-0.10 m"
                            ];
                        }
                    }
                    return $cleanData;
                }
                
                return [];
            } catch (\Exception $e) {
                return [];
            }
        });
    }
}