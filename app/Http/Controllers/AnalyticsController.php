<?php

namespace App\Http\Controllers;

use App\Models\Lokasi;
use App\Models\MonitoringHarian;
use App\Models\MonitoringMingguan;
use App\Models\WaterLevel;
use App\Helpers\StatusHelper;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;

class AnalyticsController extends Controller
{
    /**
     * Tampilan Table Utama (Index)
     * Tetap menggunakan key 'data' agar tidak error 'reading breakdown'
     */
    public function index(Request $request)
    {
        $month = $request->query('month', now()->month);
        $year = $request->query('year', now()->year);

        $activeIds = $this->getActiveLokasiIds($month, $year);
        
        $query = Lokasi::query()->whereIn('id', $activeIds);

        if ($request->filled('search')) {
            $query->where(fn($q) => $q->where('blok', 'like', "%{$request->search}%")
                  ->orWhere('afdeling', 'like', "%{$request->search}%"));
        }

        $paginator = $query->paginate(10);

        $transformedData = collect($paginator->items())->map(function ($lokasi) use ($month, $year) {
            $perf = $this->calculateWeightedPerformance($lokasi->id, $month, $year);

            return [
                'periode' => [
                    'tanggal_raw'  => Carbon::create($year, $month, 1)->format('Y-m-d'),
                    'tanggal_indo' => Carbon::create($year, $month, 1)->translatedFormat('F Y'),
                ],
                'lokasi' => [
                    'id'       => $lokasi->id,
                    'afdeling' => $lokasi->afdeling,
                    'blok'     => $lokasi->blok,
                ],
                // Tetap gunakan 'data' dan 'breakdown' agar Vue tidak error
                'data' => [
                    'jumlah_laporan' => $perf['metadata']['total_laporan_harian'],
                    'total_skor'     => $perf['scores']['final_weighted'],
                    'breakdown'      => $perf['scores'], 
                ],
                'analisa' => [
                    'status'      => $perf['analisa']['kategori'],
                    'rekomendasi' => $perf['analisa']['tindakan'],
                    'color'       => $perf['analisa']['label_color'] ?? 'gray',
                ]
            ];
        });

        return response()->json([
            'status' => true,
            'message' => 'Data analytics berhasil dimuat',
            'data' => [
                'current_page' => $paginator->currentPage(),
                'data'         => $transformedData,
                'total'        => $paginator->total(),
                'last_page'    => $paginator->lastPage(),
            ]
        ]);
    }
    /**
 * Menampilkan detail laporan per lokasi dalam satu bulan
 * URL: /api/analytics/detail/{id_lokasi}
 */
public function show(Request $request, $id_lokasi)
{
    $month = $request->query('month', now()->month);
    $year = $request->query('year', now()->year);

    $lokasi = Lokasi::findOrFail($id_lokasi);

    // 1. Fetch data dengan Eager Loading (Relasi karyawan)
    $harian = MonitoringHarian::with('karyawan')
        ->where('id_lokasi', $id_lokasi)
        ->whereMonth('tanggal', $month)
        ->whereYear('tanggal', $year)
        ->orderBy('tanggal', 'desc')->get();

    $mingguan = MonitoringMingguan::with('karyawan')
        ->where('id_lokasi', $id_lokasi)
        ->whereMonth('tanggal', $month)
        ->whereYear('tanggal', $year)
        ->orderBy('tanggal', 'desc')->get();

    $waterLevel = WaterLevel::with('karyawan')
        ->where('id_lokasi', $id_lokasi)
        ->whereMonth('tanggal', $month)
        ->whereYear('tanggal', $year)
        ->orderBy('tanggal', 'desc')->get();

    // 2. Hitung performa lokasi tersebut di periode ini
    $performance = $this->calculateWeightedPerformance($id_lokasi, $month, $year);

    return response()->json([
        'status' => true,
        'message' => 'Detail analytics berhasil diambil',
        'data' => [
            'header' => [
                'lokasi' => $lokasi,
                'periode' => Carbon::create($year, $month, 1)->translatedFormat('F Y'),
                'performance' => $performance
            ],
            'details' => [
                'monitoring_harian' => $harian->map(fn($item) => $this->formatHarianDetail($item)),
                'monitoring_mingguan' => $mingguan->map(fn($item) => $this->formatMingguanDetail($item)),
                'water_level' => $waterLevel->map(fn($item) => $this->formatWaterLevelDetail($item)),
            ]
        ]
    ]);
}

// --- PRIVATE FORMATTERS (Agar fungsi show tetap clean) ---

private function formatHarianDetail($item) {
    return [
        'id'            => $item->id,
        'tanggal'       => $this->safeDateFormat($item->tanggal),
        'pengamat'      => $item->karyawan->nama ?? '-',
        'objek'         => "Jalur {$item->nomor_jalur} ({$item->tipe_objek})",
        'kondisi_riil'  => [
            'kedalaman'      => $item->kedalaman_cm . ' cm',
            'jumlah_pokok'   => $item->jumlah_pokok . ' pokok',
            'aliran'         => $item->kondisi_aliran,
            'tindakan'         => $item->tindakan,
        ],
        'skor' => $item->rata_rata_skor,
        'dokumentasi' => $item->foto_path ? url('storage/'.$item->foto_path) : null,
    ];
}

private function formatMingguanDetail($item) {
    return [
        'id'            => $item->id,
        'tanggal'       => $this->safeDateFormat($item->tanggal),
        'pengamat'      => $item->karyawan->nama ?? '-',
        'infra'         => $item->jenis_infrastruktur,
        'skor'          => $item->rata_rata_skor,
        'dokumentasi'   => $item->foto_path ? url('storage/'.$item->foto_path) : null,
    ];
}

private function formatWaterLevelDetail($item) {
    return [
        'id'            => $item->id,
        'tanggal'       => $this->safeDateFormat($item->tanggal),
        'pengamat'      => $item->karyawan->nama ?? '-',
        'tinggi_air'    => $item->tinggi_level_air . ' cm',
        'skor'          => $item->rata_rata_skor,
        'foto'          => $item->foto_path ? url('storage/'.$item->foto_path) : null,
    ];
}
/**
 * Helper: Jaring Pengaman Format Tanggal
 * Mencegah error "Call to a member function format() on string"
 */
private function safeDateFormat($date)
{
    if (!$date) return '-';
    
    try {
        if ($date instanceof \Carbon\Carbon) {
            return $date->format('d-m-Y');
        }
        
        return \Carbon\Carbon::parse($date)->format('d-m-Y');
    } catch (\Exception $e) {
        return '-';
    }
}

    /**
     * Dashboard Summary (Chart Tren & Top Locations)
     */
    public function stats(Request $request)
    {
        $days = 7;
        $id_lokasi = $request->id_lokasi;
        $month = $request->query('month', now()->month);

        return response()->json([
            'status' => true,
            'data' => [
                'harian' => [
                    'chart' => $this->getTrendData($days, $id_lokasi),
                    'top_locations' => $this->getWorstLocations($month)
                ]
            ]
        ]);
    }

    /**
     * Statistik Counter (Total Laporan)
     */
    public function countMonitoring(Request $request)
    {
        $month = $request->query('month', now()->month);
        $year = $request->query('year', now()->year);

        return response()->json([
            'status' => true,
            'data' => [
                'periode' => Carbon::create($year, $month, 1)->translatedFormat('F Y'),
                'stats'   => [
                    'harian'      => MonitoringHarian::whereMonth('tanggal', $month)->whereYear('tanggal', $year)->count(),
                    'mingguan'    => MonitoringMingguan::whereMonth('tanggal', $month)->whereYear('tanggal', $year)->count(),
                    'water_level' => WaterLevel::whereMonth('tanggal', $month)->whereYear('tanggal', $year)->count(),
                ]
            ]
        ]);
    }

    // --- PRIVATE HELPERS (Fungsi Pendukung) ---

    private function getActiveLokasiIds($month, $year)
    {
        return DB::table('monitoring_harian')
            ->whereMonth('tanggal', $month)->whereYear('tanggal', $year)->select('id_lokasi')
            ->union(DB::table('monitoring_mingguan')->whereMonth('tanggal', $month)->whereYear('tanggal', $year)->select('id_lokasi'))
            ->union(DB::table('water_levels')->whereMonth('tanggal', $month)->whereYear('tanggal', $year)->select('id_lokasi'))
            ->pluck('id_lokasi');
    }

    private function getTrendData($days, $id_lokasi)
    {
        $startDate = now()->subDays($days - 1)->startOfDay();
        $raw = MonitoringHarian::whereBetween('tanggal', [$startDate, now()])
            ->when($id_lokasi, fn($q) => $q->where('id_lokasi', $id_lokasi))
            ->select(DB::raw('DATE(tanggal) as date'), DB::raw('AVG(rata_rata_skor) as avg_score'))
            ->groupBy('date')->orderBy('date', 'asc')->get();

        $labels = []; $values = [];
        for ($i = $days - 1; $i >= 0; $i--) {
            $d = now()->subDays($i);
            $labels[] = $d->translatedFormat('d M');
            $match = $raw->firstWhere('date', $d->format('Y-m-d'));
            $values[] = $match ? round($match->avg_score, 2) : 0;
        }
        return ['labels' => $labels, 'values' => $values];
    }

    private function getWorstLocations($month)
    {
        return MonitoringHarian::join('lokasi', 'monitoring_harian.id_lokasi', '=', 'lokasi.id')
            ->whereMonth('monitoring_harian.tanggal', $month)
            ->select('lokasi.blok', 'lokasi.afdeling', DB::raw('ROUND(AVG(monitoring_harian.rata_rata_skor), 2) as skor'))
            ->groupBy('lokasi.id', 'lokasi.blok', 'lokasi.afdeling')
            ->orderBy('skor', 'asc')->limit(5)->get();
    }

    public function calculateWeightedPerformance($id_lokasi, $month, $year)
    {
        $harian = MonitoringHarian::where('id_lokasi', $id_lokasi)->whereMonth('tanggal', $month)->whereYear('tanggal', $year)->avg('rata_rata_skor');
        $mingguan = MonitoringMingguan::where('id_lokasi', $id_lokasi)->whereMonth('tanggal', $month)->whereYear('tanggal', $year)->avg('rata_rata_skor');
        $water = WaterLevel::where('id_lokasi', $id_lokasi)->whereMonth('tanggal', $month)->whereYear('tanggal', $year)->avg('rata_rata_skor');

        $totalWeighted = 0; $activeWeight = 0;
        $map = [['val' => $harian, 'w' => 0.4], ['val' => $mingguan, 'w' => 0.3], ['val' => $water, 'w' => 0.3]];

        foreach ($map as $m) {
            if (!is_null($m['val'])) {
                $totalWeighted += ($m['val'] * $m['w']);
                $activeWeight += $m['w'];
            }
        }

        $final = $activeWeight > 0 ? ($totalWeighted / $activeWeight) : 0;

        return [
            'scores' => [
                'harian'         => round($harian ?? 0, 2),
                'mingguan'       => round($mingguan ?? 0, 2),
                'water_level'    => round($water ?? 0, 2),
                'final_weighted' => round($final, 2),
            ],
            'analisa' => StatusHelper::determineStatus($final),
            'metadata' => [
                'total_laporan_harian' => MonitoringHarian::where('id_lokasi', $id_lokasi)->whereMonth('tanggal', $month)->whereYear('tanggal', $year)->count(),
            ]
        ];
    }
    public function waterLevelChart(Request $request)
{
    try {
        $days = $request->query('days', 7);
        $startDate = now()->subDays($days - 1)->startOfDay();

        $data = WaterLevel::where('tanggal', '>=', $startDate)
            ->when($request->id_lokasi, fn($q) => $q->where('id_lokasi', $request->id_lokasi))
            ->select(
                DB::raw('DATE(tanggal) as date'),
                DB::raw('AVG(tinggi_level_air) as val')
            )
            ->groupBy('date')
            ->orderBy('date', 'asc')
            ->get();

        return response()->json($this->formatTrendData($data, $days));
    } catch (\Exception $e) {
        // Ini akan membantu Anda melihat error aslinya di log Laravel
        return response()->json(['status' => false, 'message' => $e->getMessage()], 500);
    }
}

private function formatTrendData($collection, $days)
{
    $labels = []; 
    $values = [];
    for ($i = $days - 1; $i >= 0; $i--) {
        $d = now()->subDays($i);
        $labels[] = $d->translatedFormat('d M');
        $dateStr = $d->format('Y-m-d');
        
        $match = $collection->firstWhere('date', $dateStr);
        $values[] = $match ? round($match->val, 2) : 0;
    }
    return ['labels' => $labels, 'values' => $values];
}

/**
 * Fungsi untuk mengambil breakdown status infrastruktur spesifik
 */
public function infraBreakdown(Request $request)
{
    $month = $request->query('month', now()->month);
    $year = $request->query('year', now()->year);

    // Filter jenis infrastruktur sesuai permintaan Anda
    $allowedTypes = ['Jembatan', 'Pipa (PVC)', 'Gorong-Gorong Baja (NF)'];

    $raw = MonitoringMingguan::whereMonth('tanggal', $month)
        ->whereYear('tanggal', $year)
        ->whereIn('jenis_infrastruktur', $allowedTypes)
        ->select(
            'jenis_infrastruktur', 
            DB::raw('ROUND(rata_rata_skor) as skor_bulat'), 
            DB::raw('count(*) as jumlah')
        )
        ->groupBy('jenis_infrastruktur', 'skor_bulat')
        ->get();

    $breakdown = [];

    foreach ($allowedTypes as $type) {
        $breakdown[$type] = [
            // Skor 3 = Kelas 1 (Bagus)
            ['status' => 'Kelas 1', 'jumlah' => $raw->where('jenis_infrastruktur', $type)->where('skor_bulat', 3)->first()->jumlah ?? 0],
            // Skor 2 = Kelas 2 (Waspada)
            ['status' => 'Kelas 2', 'jumlah' => $raw->where('jenis_infrastruktur', $type)->where('skor_bulat', 2)->first()->jumlah ?? 0],
            // Skor 1 = Kelas 3 (Rusak)
            ['status' => 'Kelas 3', 'jumlah' => $raw->where('jenis_infrastruktur', $type)->where('skor_bulat', 1)->first()->jumlah ?? 0],
        ];
    }

    return response()->json([
        'status' => true,
        'data' => [
            'mingguan' => [
                'breakdown' => $breakdown
            ]
        ]
    ]);
}
/**
 * Mendapatkan perbandingan jumlah unit berdasarkan status (Kelas 1-3)
 * Antara modul Infrastruktur (Mingguan) dan Water Level
 */
public function analyticsStatus(Request $request)
{
    $month = $request->query('month', now()->month);
    $year = $request->query('year', now()->year);

    // 1. Ambil data count dari Monitoring Mingguan (Infrastruktur)
    // Kelas 1 (Skor 3), Kelas 2 (Skor 2), Kelas 3 (Skor 1)
    $infraData = MonitoringMingguan::whereMonth('tanggal', $month)
        ->whereYear('tanggal', $year)
        ->select(DB::raw('ROUND(rata_rata_skor) as skor_bulat'), DB::raw('count(*) as total'))
        ->groupBy('skor_bulat')
        ->pluck('total', 'skor_bulat');

    // 2. Ambil data count dari Water Level
    $waterData = WaterLevel::whereMonth('tanggal', $month)
        ->whereYear('tanggal', $year)
        ->select(DB::raw('ROUND(rata_rata_skor) as skor_bulat'), DB::raw('count(*) as total'))
        ->groupBy('skor_bulat')
        ->pluck('total', 'skor_bulat');

    // 3. Susun Labels & Dataset agar sinkron
    // Urutan: Kelas 1 (Skor 3), Kelas 2 (Skor 2), Kelas 3 (Skor 1)
    $labels = ['Kelas 1', 'Kelas 2', 'Kelas 3'];
    
    $datasetInfra = [
        $infraData->get(3, 0), // Kelas 1 (Bagus)
        $infraData->get(2, 0), // Kelas 2 (Waspada)
        $infraData->get(1, 0), // Kelas 3 (Buruk)
    ];

    $datasetWater = [
        $waterData->get(3, 0), // Kelas 1
        $waterData->get(2, 0), // Kelas 2
        $waterData->get(1, 0), // Kelas 3
    ];

    return response()->json([
        'status' => true,
        'data' => [
            'labels' => $labels,
            'datasets' => [
                'infrastruktur' => $datasetInfra,
                'water_level'   => $datasetWater
            ]
        ]
    ]);
}
}