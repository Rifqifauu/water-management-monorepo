<?php

namespace App\Http\Controllers;

use App\Models\MonitoringHarian;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

class MonitoringHarianController extends Controller
{
    /**
     * Helper untuk aturan validasi
     * Sekarang mencakup kolom skor dan rata-rata
     */
    private function getValidationRules()
    {
        return [
            'tanggal'         => 'required|date',
            'id_lokasi'       => 'required|exists:lokasi,id',
            'id_karyawan'     => 'required|exists:karyawan,id',
            'lat_aktual'      => 'nullable|numeric',
            'long_aktual'     => 'nullable|numeric',
            'tipe_objek'      => 'nullable|string|max:255',
            'nomor_jalur'     => 'nullable|string|max:255',
            'kedalaman_cm'    => 'nullable|numeric',
            'jumlah_pokok'    => 'nullable|integer',
            'durasi_genangan' => 'nullable|string|max:255',
            'kondisi_aliran'  => 'nullable|string|max:255',
            'penyebab'        => 'nullable|string',
            'tindakan'        => 'nullable|string',
            'foto_path'       => 'nullable|image|mimes:jpeg,png,jpg|max:10240',
            'foto_after'      => 'nullable|image|mimes:jpeg,png,jpg|max:10240',
            'keterangan'      => 'nullable|string',
            'skor_kedalaman'    => 'nullable|numeric',
            'skor_jumlah_pokok' => 'nullable|numeric',
            'skor_durasi'       => 'nullable|numeric',
            'skor_aliran'       => 'nullable|numeric',
            'skor_penyebab'     => 'nullable|numeric',
            'skor_tindakan'     => 'nullable|numeric',
            'rata_rata_skor'    => 'nullable|numeric',
        ];
    }

    private function uploadAndVerify($file, $directory = 'monitoring')
    {
        if (!$file->isValid()) {
            throw new \Exception("File rusak/corrupt saat upload (Error Code: " . $file->getError() . ")");
        }
        $path = $file->store($directory, 'public');
        if (!$path || !Storage::disk('public')->exists($path) || Storage::disk('public')->size($path) === 0) {
            if ($path) Storage::disk('public')->delete($path); 
            throw new \Exception("Gagal menulis file ke storage server.");
        }
        return $path;
    }

public function index(Request $request)
{
    $query = MonitoringHarian::query()->with(['karyawan', 'lokasi']);

    // 1. Logika Search (Sudah ada, saya tambahkan pencarian nama karyawan agar lebih sakti)
    $query->when($request->filled('search'), function ($q) use ($request) {
        $search = $request->search;
        $q->where(function ($subQ) use ($search) {
            $subQ->where('keterangan', 'like', "%{$search}%")
                  ->orWhereHas('lokasi', function ($loc) use ($search) {
                      $loc->where('blok', 'like', "%{$search}%")
                          ->orWhere('afdeling', 'like', "%{$search}%");
                  })
                  ->orWhereHas('karyawan', function ($kar) use ($search) {
                      $kar->where('nama', 'like', "%{$search}%");
                  });
        });
    });

    // 2. Filter Tanggal (Wajib pakai whereDate agar jam tidak mengganggu)
    $query->when($request->filled('date'), function ($q) use ($request) {
        $q->whereDate('tanggal', $request->date);
    });

    // 3. Filter Karyawan
    $query->when($request->filled('id_karyawan'), function ($q) use ($request) {
        // Pastikan nama kolom di database sesuai, apakah 'id_karyawan' atau 'karyawan_id'
        $q->where('id_karyawan', $request->id_karyawan);
    });

    // 4. Filter Lokasi
    $query->when($request->filled('id_lokasi'), function ($q) use ($request) {
        $q->where('id_lokasi', $request->id_lokasi);
    });

    $query->orderBy('tanggal', 'desc');

    return response()->json($query->paginate( 10));
}
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), $this->getValidationRules());

        if ($validator->fails()) {
            return response()->json([
                'status'  => false,
                'message' => 'Validasi Gagal',
                'errors'  => $validator->errors()
            ], 422);
        }

        DB::beginTransaction();
        $uploadedPaths = []; 

        try {
            $data = $validator->validated();

            if ($request->hasFile('foto_path')) {
                $path = $this->uploadAndVerify($request->file('foto_path'));
                $data['foto_path'] = $path;
                $uploadedPaths[] = $path;
            }

            if ($request->hasFile('foto_after')) {
                $path = $this->uploadAndVerify($request->file('foto_after'));
                $data['foto_after'] = $path;
                $uploadedPaths[] = $path; 
            }

            // Data skor otomatis masuk ke create karena sudah ada di $data hasil validasi
            $monitoringharian = MonitoringHarian::create($data);
            
            DB::commit();

            return response()->json([
                'status'  => true,
                'message' => 'Data dan Skor berhasil disimpan',
                'data'    => $monitoringharian
            ], 201);

        } catch (\Exception $e) {
            DB::rollBack();
            foreach ($uploadedPaths as $path) {
                if (Storage::disk('public')->exists($path)) Storage::disk('public')->delete($path);
            }
            return response()->json(['status' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function update(Request $request, $id)
    {
        $monitoringharian = MonitoringHarian::findOrFail($id);
        $validator = Validator::make($request->all(), $this->getValidationRules());

        if ($validator->fails()) {
            return response()->json(['status' => false, 'errors' => $validator->errors()], 422);
        }

        DB::beginTransaction();
        $newUploadedPaths = []; 

        try {
            $data = $validator->validated();

            if ($request->hasFile('foto_path')) {
                $newPath = $this->uploadAndVerify($request->file('foto_path'));
                $newUploadedPaths[] = $newPath;
                $oldFotoPath = $monitoringharian->foto_path;
                $data['foto_path'] = $newPath;
            }

            if ($request->hasFile('foto_after')) {
                $newPath = $this->uploadAndVerify($request->file('foto_after'));
                $newUploadedPaths[] = $newPath;
                $oldFotoAfter = $monitoringharian->foto_after;
                $data['foto_after'] = $newPath;
            }

            $monitoringharian->update($data);
            DB::commit();

            // Cleanup file lama
            if (isset($oldFotoPath) && $oldFotoPath) Storage::disk('public')->delete($oldFotoPath);
            if (isset($oldFotoAfter) && $oldFotoAfter) Storage::disk('public')->delete($oldFotoAfter);

            return response()->json(['status' => true, 'message' => 'Data diupdate', 'data' => $monitoringharian], 200);

        } catch (\Exception $e) {
            DB::rollBack();
            foreach ($newUploadedPaths as $path) {
                if (Storage::disk('public')->exists($path)) Storage::disk('public')->delete($path);
            }
            return response()->json(['status' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function destroy($id)
    {
        $monitoringharian = MonitoringHarian::findOrFail($id);

        try {
            if ($monitoringharian->foto_path) Storage::disk('public')->delete($monitoringharian->foto_path);
            if ($monitoringharian->foto_after) Storage::disk('public')->delete($monitoringharian->foto_after);
            
            $monitoringharian->delete();
            return response()->json(['message' => 'Data berhasil dihapus'], 200);
        } catch (\Exception $e) {
            return response()->json(['message' => 'Gagal menghapus: ' . $e->getMessage()], 500);
        }
    }
}