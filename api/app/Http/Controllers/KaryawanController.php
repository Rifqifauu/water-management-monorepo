<?php

namespace App\Http\Controllers;

use App\Models\Karyawan; 
use Illuminate\Http\Request;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Validator;

class KaryawanController extends Controller
{
   public function listKaryawan()
{
    $karyawan = Karyawan::select('id', 'nama')->get();
    
    return response()->json($karyawan);
}

    public function index(Request $request)
{
    $query = Karyawan::query();


    if ($request->filled('search')) {
        $query->where('nama', 'like', '%' . $request->search . '%');
        $query->orWhere('jabatan', 'like', '%' . $request->search . '%');
    }
    if ($request->filled('jabatan')) {
        $query->where('jabatan', $request->jabatan);
    }

    $data = $query->paginate(10); // sesuaikan pagination

    return response()->json($data);
}
public function show($id)
    {
        $karyawan = Karyawan::find($id);

        if (!$karyawan) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        }

        return response()->json([
            'message' => 'Detail Data Karyawan',
            'data'    => $karyawan
        ], 200);
    }
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'nama'   => 'required|string|max:255',
            'jabatan'       => 'required|string|max:255',

        ]);
      if ($validator->fails()) {
    return response()->json([
        'status'  => false,
        'message' => 'Validasi Gagal', // Pesan umum
        'errors'  => $validator->errors() // Detail field mana yang salah
    ], 422);
}

        try {
            $karyawan = Karyawan::create($validator->validated());

            return response()->json([
                'message' => 'Data berhasil disimpan',
                'data'    => $karyawan
            ], 201);

        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Gagal menyimpan data ' . $e->getMessage()
            ], 500);
        }
    }

    public function update(Request $request, $id)
    {
        $karyawan = Karyawan::find($id);

        if (!$karyawan) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        }

        $validator = Validator::make($request->all(), [
            'nama'   => 'required|string|max:255',
            'jabatan'  => 'required|string|max:255',
        ]);

      if ($validator->fails()) {
    return response()->json([
        'status'  => false,
        'message' => 'Validasi Gagal', // Pesan umum
        'errors'  => $validator->errors() // Detail field mana yang salah
    ], 422);
}

        try {
            $karyawan->update($validator->validated());

            return response()->json([
                'message' => 'Data berhasil diupdate',
                'data'    => $karyawan
            ], 200);

        } catch (QueryException $e) {
            return response()->json([
                'message' => 'Gagal mengupdate data'
            ], 500);
        }
    }

    public function destroy($id)
    {
        $karyawan = Karyawan::find($id);

        if (!$karyawan) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        }

        $karyawan->delete();

        return response()->json(['message' => 'Data berhasil dihapus'], 200);
    }
}