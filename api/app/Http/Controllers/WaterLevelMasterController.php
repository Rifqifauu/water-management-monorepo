<?php

namespace App\Http\Controllers;

use App\Models\WaterLevelMaster;
use Illuminate\Http\Request;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Validator;

class WaterLevelMasterController extends Controller
{
    public function listWaterLevelMaster()
    {
        $waterLevelMaster = WaterLevelMaster::with('lokasi')
            ->select('id', 'id_lokasi', 'no_wl', 'latitude', 'longitude')
            ->get();
        return response()->json($waterLevelMaster);
    }

    public function index(Request $request)
    {
        $query = WaterLevelMaster::with('lokasi');

        if ($request->filled('search')) {
            $query->where('no_wl', 'like', '%' . $request->search . '%')
                  ->orWhereHas('lokasi', function($q) use ($request) {
                      $q->where('afdeling', 'like', '%' . $request->search . '%')
                        ->orWhere('blok', 'like', '%' . $request->search . '%');
                  });
        }

        $data = $query->paginate(10); 
        return response()->json($data);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id_lokasi' => 'required|exists:lokasi,id',
            'no_wl' => 'required|string|unique:water_level_masters,no_wl',
            'latitude' => 'nullable',
            'longitude' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status'  => false,
                'message' => 'Validasi Gagal', 
                'errors'  => $validator->errors() 
            ], 422);
        }

        try {
            $waterLevelMaster = WaterLevelMaster::create($validator->validated());
            // Load relasi setelah create agar response lengkap
            $waterLevelMaster->load('lokasi');

            return response()->json([
                'message' => 'Data berhasil disimpan',
                'data'    => $waterLevelMaster
            ], 201);
        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Gagal menyimpan data ' . $e->getMessage()
            ], 500);
        }
    }

    public function update(Request $request, $id)
    {
        $waterLevelMaster = WaterLevelMaster::find($id);

        if (!$waterLevelMaster) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        }

        $validator = Validator::make($request->all(), [
            'id_lokasi' => 'required|exists:lokasi,id',
            'no_wl' => 'required|string|unique:water_level_masters,no_wl,' . $id,
            'latitude' => 'nullable',
            'longitude' => 'nullable',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status'  => false,
                'message' => 'Validasi Gagal',
                'errors'  => $validator->errors()
            ], 422);
        }

        try {
            $waterLevelMaster->update($validator->validated());
            // Load relasi setelah update
            $waterLevelMaster->load('lokasi');

            return response()->json([
                'message' => 'Data berhasil diupdate',
                'data'    => $waterLevelMaster
            ], 200);
        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Gagal mengupdate data'
            ], 500);
        }
    }

    public function show($id)
    {
        $waterLevelMaster = WaterLevelMaster::with('lokasi')->find($id);
        if (!$waterLevelMaster) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        }
        return response()->json($waterLevelMaster);
    }
    public function destroy($id)
    {
        $waterLevelMaster = WaterLevelMaster::find($id);
        if (!$waterLevelMaster) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        }
        $waterLevelMaster->delete();
        return response()->json(['message' => 'Data berhasil dihapus'], 200);
    }
}