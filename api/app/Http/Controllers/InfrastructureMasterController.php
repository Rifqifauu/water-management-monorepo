<?php

namespace App\Http\Controllers;

use App\Models\InfrastructureMaster;
use Illuminate\Http\Request;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Validator;

class InfrastructureMasterController extends Controller
{
    public function listInfrastructureMaster()
    {
        $infrastructureMaster = InfrastructureMaster::select('id', 'id_lokasi', 'id_object', 'category','latitude','longitude')
            ->get();
        return response()->json($infrastructureMaster);
    }

    public function index(Request $request)
    {
        $query = InfrastructureMaster::with('lokasi');

        if ($request->filled('search')) {
            $query->where(function($q) use ($request) {
                $q->where('id_object', 'like', '%' . $request->search . '%')
                  ->orWhereHas('lokasi', function($l) use ($request) {
                      $l->where('afdeling', 'like', '%' . $request->search . '%')
                        ->orWhere('blok', 'like', '%' . $request->search . '%');
                  });
            });
        }
        if ($request->filled('category')) {
            $query->where('category', $request->category);
        }

        $data = $query->paginate(10); 
        return response()->json($data);
    }
    public function show($id)
    {
        $infrastructureMaster = InfrastructureMaster::with('lokasi')->find($id);
        if (!$infrastructureMaster) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        }
        return response()->json($infrastructureMaster);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'id_lokasi' => 'required|exists:lokasi,id',
            'id_object' => 'required|string|unique:infrastructure_masters,id_object',
            'category'  => 'required|string|max:255',
            'latitude'  => 'nullable',
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
            $infrastructureMaster = InfrastructureMaster::create($validator->validated());
            
            // Memuat data lokasi setelah berhasil simpan
            $infrastructureMaster->load('lokasi');

            return response()->json([
                'message' => 'Data berhasil disimpan',
                'data'    => $infrastructureMaster
            ], 201);
        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Gagal menyimpan data ' . $e->getMessage()
            ], 500);
        }
    }

    public function update(Request $request, $id)
    {
        $infrastructureMaster = InfrastructureMaster::find($id);

        if (!$infrastructureMaster) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        }

        $validator = Validator::make($request->all(), [
            'id_lokasi' => 'required|exists:lokasi,id',
            'id_object' => 'required|string|unique:infrastructure_masters,id_object,' . $id,
            'category'  => 'required|string|max:255',
            'latitude'  => 'nullable',
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
            $infrastructureMaster->update($validator->validated());
                        $infrastructureMaster->load('lokasi');

            return response()->json([
                'message' => 'Data berhasil diupdate',
                'data'    => $infrastructureMaster
            ], 200);
        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Gagal mengupdate data'
            ], 500);
        }
    }

    public function destroy($id)
    {
        $infrastructureMaster = InfrastructureMaster::find($id);
        if (!$infrastructureMaster) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        }
        $infrastructureMaster->delete();
        return response()->json(['message' => 'Data berhasil dihapus'], 200);
    }
}