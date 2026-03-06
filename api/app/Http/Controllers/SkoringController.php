<?php

namespace App\Http\Controllers;

use App\Models\Skoring;
use Illuminate\Http\Request;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Validator;

class SkoringController extends Controller
{
    public function listKategori($kategori = null){
        $skoring = Skoring::where('kategori_parameter', $kategori)->get();
        return response()->json($skoring);
    }
    public function index()
    {
        $data = Skoring::all();
        return response()->json($data);
    }

    public function store(Request $request)
    {
        // Custom message bahasa Indonesia (Opsional, biar makin jelas)
        $messages = [
            'required' => ':attribute wajib diisi.',
            'numeric'  => ':attribute harus berupa angka.',
        ];

        $validator = Validator::make($request->all(), [
            'unit' => 'required',
            'kategori_parameter' => 'required|string|max:255',
            'label_kondisi'      => 'nullable|string|max:255', // JADI NULLABLE
            'min_value'          => 'nullable|numeric',
            'max_value'          => 'nullable|numeric',
            'skor'               => 'required|numeric', // Skor biasanya wajib
            'keterangan'         => 'nullable|string',
        ], $messages);

        // FORMAT ERROR YANG LEBIH JELAS
        if ($validator->fails()) {
            return response()->json([
                'status'  => false,
                'message' => 'Gagal menyimpan data. Periksa inputan anda.',
                'errors'  => $validator->errors() // Detail error per field
            ], 422);
        }

        try {
            $skoring = Skoring::create($validator->validated());

            return response()->json([
                'status'  => true,
                'message' => 'Data berhasil disimpan',
                'data'    => $skoring
            ], 201);

        } catch (QueryException $e) {
            return response()->json([
                'status'  => false,
                'message' => 'Terjadi kesalahan database: ' . $e->getMessage()
            ], 500);
        }
    }

    public function update(Request $request, $id)
    {
        $skoring = Skoring::find($id);

        if (!$skoring) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        }

        $validator = Validator::make($request->all(), [
            'unit' => 'required',
            'kategori_parameter' => 'required|string|max:255',
            'label_kondisi'      => 'nullable|string|max:255', // JADI NULLABLE
            'min_value'          => 'nullable|numeric',
            'max_value'          => 'nullable|numeric',
            'skor'               => 'required|numeric',
            'keterangan'         => 'nullable|string',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status'  => false,
                'message' => 'Gagal update data. Periksa inputan anda.',
                'errors'  => $validator->errors()
            ], 422);
        }

        try {
            $skoring->update($validator->validated());

            return response()->json([
                'status'  => true,
                'message' => 'Data berhasil diupdate',
                'data'    => $skoring
            ], 200);

        } catch (QueryException $e) {
            return response()->json([
                'status'  => false,
                'message' => 'Gagal mengupdate data'
            ], 500);
        }
    }

    public function destroy($id)
    {
        $skoring = Skoring::find($id);

        if (!$skoring) {
            return response()->json(['message' => 'Data tidak ditemukan'], 404);
        }

        $skoring->delete();

        return response()->json(['message' => 'Data berhasil dihapus'], 200);
    }
}