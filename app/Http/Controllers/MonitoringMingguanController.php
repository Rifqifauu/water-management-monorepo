<?php

namespace App\Http\Controllers;

use App\Models\MonitoringMingguan;
use Illuminate\Http\Request;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;

class MonitoringMingguanController extends Controller
{
    public function index(Request $request)
    {
        $query = MonitoringMingguan::query();
        $query->with(['karyawan', 'lokasi']);

        if ($request->filled('search')) {
            $search = $request->search;
            $query->where(function($q) use ($search) {
                $q->where('keterangan', 'like', "%{$search}%")
                  ->orWhereHas('lokasi', function($loc) use ($search) {
                      $loc->where('blok', 'like', "%{$search}%")
                          ->orWhere('afdeling', 'like', "%{$search}%");
                  });
            });
        }

        if ($request->filled('date')) {
            $query->whereDate('tanggal', $request->date);
        }

        if ($request->filled('id_karyawan')) {
            $query->where('id_karyawan', $request->id_karyawan);
        }

        if ($request->filled('id_lokasi')) {
            $query->where('id_lokasi', $request->id_lokasi);
        }

        $query->orderBy('tanggal', 'desc');
        return response()->json($query->paginate(10));
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'tanggal'             => 'required|date',
            'id_lokasi'           => 'required',
            'id_karyawan'         => 'required',
            'id_objek'            => 'required',
            'lat_aktual'          => 'nullable|numeric',
            'long_aktual'         => 'nullable|numeric',
            'jenis_infrastruktur' => 'nullable|string|max:255',
            'kondisi_aliran'      => 'nullable|string|max:255',
            'penyebab'            => 'nullable|string',
            'tindakan'            => 'nullable|string',
            'keterangan'          => 'nullable|string',
            
            // VALIDASI FIELD SKOR BARU
            'skor_aliran'         => 'nullable|numeric',
            'skor_penyebab'       => 'nullable|numeric',
            'skor_tindakan'       => 'nullable|numeric',
            'rata_rata_skor'      => 'nullable|numeric',
            
            // FOTO
            'foto_path'           => 'nullable|image|mimes:jpeg,png,jpg|max:5120',
            'foto_after'          => 'nullable|image|mimes:jpeg,png,jpg|max:5120',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status'  => false,
                'message' => 'Validasi Gagal',
                'errors'  => $validator->errors()
            ], 422);
        }

        try {
            $input = $validator->validated();

            // Upload Foto Before
            if ($request->hasFile('foto_path')) {
                $input['foto_path'] = $request->file('foto_path')->store('monitoring_mingguan', 'public');
            }
            
            // Upload Foto After
            if ($request->hasFile('foto_after')) {
                $input['foto_after'] = $request->file('foto_after')->store('monitoring_mingguan', 'public');
            }

            $monitoring = MonitoringMingguan::create($input);

            return response()->json([
                'message' => 'Data berhasil disimpan',
                'data'    => $monitoring
            ], 201);

        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Gagal menyimpan data ke database: ' . $e->getMessage()
            ], 500);
        }
    }

    public function update(Request $request, $id)
    {
        $monitoring = MonitoringMingguan::find($id);
        if (!$monitoring) return response()->json(['message' => 'Data tidak ditemukan'], 404);

        $validator = Validator::make($request->all(), [
            'tanggal'             => 'required|date',
            'id_lokasi'           => 'required',
            'id_objek'            => 'required',
            'id_karyawan'         => 'required',
            'lat_aktual'          => 'nullable|numeric',
            'long_aktual'         => 'nullable|numeric',
            'jenis_infrastruktur' => 'nullable|string|max:255',
            'kondisi_aliran'      => 'nullable|string|max:255',
            'penyebab'            => 'nullable|string',
            'tindakan'            => 'nullable|string',
            'keterangan'          => 'nullable|string',
            
            'skor_aliran'         => 'nullable|numeric',
            'skor_penyebab'       => 'nullable|numeric',
            'skor_tindakan'       => 'nullable|numeric',
            'rata_rata_skor'      => 'nullable|numeric',

            'foto_path'           => 'nullable|image|mimes:jpeg,png,jpg|max:5120',
            'foto_after'          => 'nullable|image|mimes:jpeg,png,jpg|max:5120',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'errors' => $validator->errors()], 422);
        }

        try {
            $input = $validator->validated();

            // Update Foto Before
            if ($request->hasFile('foto_path')) {
                if ($monitoring->foto_path) Storage::disk('public')->delete($monitoring->foto_path);
                $input['foto_path'] = $request->file('foto_path')->store('monitoring_mingguan', 'public');
            }

            // Update Foto After
            if ($request->hasFile('foto_after')) {
                if ($monitoring->foto_after) Storage::disk('public')->delete($monitoring->foto_after);
                $input['foto_after'] = $request->file('foto_after')->store('monitoring_mingguan', 'public');
            }

            $monitoring->update($input);
            return response()->json(['message' => 'Data berhasil diupdate', 'data' => $monitoring], 200);

        } catch (QueryException $e) {
            return response()->json(['message' => 'Gagal mengupdate data: ' . $e->getMessage()], 500);
        }
    }

    public function destroy($id)
    {
        $monitoring = MonitoringMingguan::find($id);
        if (!$monitoring) return response()->json(['message' => 'Data tidak ditemukan'], 404);

        if ($monitoring->foto_path) Storage::disk('public')->delete($monitoring->foto_path);
        if ($monitoring->foto_after) Storage::disk('public')->delete($monitoring->foto_after);

        $monitoring->delete();
        return response()->json(['message' => 'Data berhasil dihapus'], 200);
    }
}