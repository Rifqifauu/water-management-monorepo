<?php

namespace App\Http\Controllers;

use App\Models\Lokasi; 
use Illuminate\Http\Request;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Validator;

class LokasiController extends Controller
{

    public function listLokasi()
{
    $lokasi = Lokasi::select('id', 'afdeling', 'blok')->get();  
    return response()->json($lokasi);
}
   public function index(Request $request)
{
    $query = Lokasi::query();


    if ($request->filled('search')) {
        $query->where('blok', 'like', '%' . $request->search . '%');
        $query->orWhere('afdeling', 'like', '%' . $request->search . '%');
    }

    $data = $query->paginate(10); // sesuaikan pagination

    return response()->json($data);
}

    public function show($id)
    {
        $lokasi = Lokasi::find($id);

        if (!$lokasi) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        }

        return response()->json([
            'message' => 'Detail Data Lokasi',
            'data'    => $lokasi
        ], 200);
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'afdeling'   => 'required|string|max:255',
            'blok'       => 'required|string|max:255',
            'luas_ha'    => 'nullable|numeric',
            'latitude'   => 'nullable|numeric',
            'longitude'  => 'nullable|numeric',
            'batas_area' => 'nullable|json',
        ]);
        if ($validator->fails()) {
    return response()->json([
        'status'  => false,
        'message' => 'Validasi Gagal', // Pesan umum
        'errors'  => $validator->errors() // Detail field mana yang salah
    ], 422);
}

        try {
            $lokasi = Lokasi::create($validator->validated());

            return response()->json([
                'message' => 'Data berhasil disimpan',
                'data'    => $lokasi
            ], 201);

        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Gagal menyimpan data ' . $e->getMessage()
            ], 500);
        }
    }

    public function update(Request $request, $id)
    {
        $lokasi = Lokasi::find($id);

        if (!$lokasi) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        }

        $validator = Validator::make($request->all(), [
            'afdeling'   => 'required|string|max:255',
            'blok'       => 'required|string|max:255',
            'luas_ha'    => 'nullable|numeric',
            'latitude'   => 'nullable|numeric',
            'longitude'  => 'nullable|numeric',
            'batas_area' => 'nullable|json',
        ]);

     if ($validator->fails()) {
    return response()->json([
        'status'  => false,
        'message' => 'Validasi Gagal', // Pesan umum
        'errors'  => $validator->errors() // Detail field mana yang salah
    ], 422);
}

        try {
            $lokasi->update($validator->validated());

            return response()->json([
                'message' => 'Data berhasil diupdate',
                'data'    => $lokasi
            ], 200);

        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Gagal mengupdate data'
            ], 500);
        }
    }

    public function destroy($id)
    {
        $lokasi = Lokasi::find($id);

        if (!$lokasi) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        }

        $lokasi->delete();

        return response()->json(['message' => 'Data berhasil dihapus'], 200);
    }
}