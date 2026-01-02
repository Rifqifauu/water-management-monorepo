<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB; 
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use App\Models\WaterLevel;
use Illuminate\Http\Request;

class WaterLevelController extends Controller
{
    public function index(Request $request)
    {
        $query = WaterLevel::query()->with(['karyawan', 'lokasi']);

        $query->when($request->filled('search'), function ($q) use ($request) {
            $search = $request->search;
            $q->where(function ($subQ) use ($search) {
                $subQ->where('keterangan', 'like', "%{$search}%")
                      ->orWhereHas('lokasi', function ($loc) use ($search) {
                          $loc->where('blok', 'like', "%{$search}%")
                              ->orWhere('afdeling', 'like', "%{$search}%");
                      });
            });
        });

        $query->when($request->filled('date'), function ($q) use ($request) {
            $q->whereDate('tanggal', $request->date);
        });

        $query->when($request->filled('id_karyawan'), fn($q) => $q->where('id_karyawan', $request->id_karyawan));
        $query->when($request->filled('id_lokasi'), fn($q) => $q->where('id_lokasi', $request->id_lokasi));

        $query->orderBy('tanggal', 'desc');

        return response()->json($query->paginate(10));
    }
   
    public function store(Request $request)
    {
        // 1. Validasi Input (Tanpa Status)
        $validator = Validator::make($request->all(), [
            'tanggal'            => 'required|date',
            'id_lokasi'          => 'required|exists:lokasi,id',
            'id_karyawan'        => 'required|exists:karyawan,id',
            'lat_aktual'         => 'nullable|numeric',
            'long_aktual'        => 'nullable|numeric',
            'no_water_level'     => 'required|integer',
            'tinggi_level_air'   => 'required|numeric',
            'jarak_ke_bibir'     => 'required|numeric',
            'kondisi_aliran'     => 'required|string',
            'risiko'             => 'required|string',
            'kapasitas_drainase' => 'required|string',
            'skor_ketinggian'    => 'required|integer',
            'skor_jarak'         => 'required|integer',
            'skor_aliran'        => 'required|integer',
            'skor_risiko'        => 'required|integer',
            'skor_drainase'      => 'required|integer',
            'rata_rata_skor'     => 'required|numeric',
            'foto_path'          => 'nullable|image|mimes:jpeg,png,jpg|max:5120',
            'keterangan'         => 'nullable|string'
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        DB::beginTransaction();

        try {
            $pathFoto = null;

            // 2. Proses Upload File
            if ($request->hasFile('foto_path')) {
                $pathFoto = $request->file('foto_path')->store('water-levels', 'public');

                if (!$pathFoto || !Storage::disk('public')->exists($pathFoto)) {
                    throw new \Exception('Gagal mengupload file gambar.');
                }
            }

            // 3. Simpan ke Database
            $waterLevel = WaterLevel::create([
                'tanggal'            => $request->tanggal,
                'id_lokasi'          => $request->id_lokasi,
                'id_karyawan'        => $request->id_karyawan,
                'lat_aktual'         => $request->lat_aktual,
                'long_aktual'        => $request->long_aktual,
                'no_water_level'     => $request->no_water_level,
                'tinggi_level_air'   => $request->tinggi_level_air,
                'jarak_ke_bibir'     => $request->jarak_ke_bibir,
                'kondisi_aliran'     => $request->kondisi_aliran,
                'risiko'             => $request->risiko,
                'kapasitas_drainase' => $request->kapasitas_drainase,
                'skor_ketinggian'    => $request->skor_ketinggian,
                'skor_jarak'         => $request->skor_jarak,
                'skor_aliran'        => $request->skor_aliran,
                'skor_risiko'        => $request->skor_risiko,
                'skor_drainase'      => $request->skor_drainase,
                'rata_rata_skor'     => $request->rata_rata_skor,
                'foto_path'          => $pathFoto,
                'keterangan'         => $request->keterangan
            ]);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Data observasi berhasil disimpan',
                'data'    => $waterLevel
            ], 201);

        } catch (\Exception $e) {
            DB::rollBack();

            if ($pathFoto && Storage::disk('public')->exists($pathFoto)) {
                Storage::disk('public')->delete($pathFoto);
            }

            return response()->json([
                'success' => false,
                'message' => 'Gagal menyimpan data: ' . $e->getMessage()
            ], 500);
        }
    }
/**
     * Menghapus data observasi dan file foto terkait.
     */
    public function destroy($id)
    {
        DB::beginTransaction();

        try {
            $waterLevel = WaterLevel::findOrFail($id);

            // 1. Hapus file foto dari storage jika ada
            if ($waterLevel->foto_path) {
                // Pastikan menggunakan disk 'public' sesuai saat upload
                if (Storage::disk('public')->exists($waterLevel->foto_path)) {
                    Storage::disk('public')->delete($waterLevel->foto_path);
                }
            }

            // 2. Hapus data dari database
            $waterLevel->delete();

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Data dan file foto berhasil dihapus'
            ], 200);

        } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Data tidak ditemukan'
            ], 404);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => 'Gagal menghapus data: ' . $e->getMessage()
            ], 500);
        }
    }
}