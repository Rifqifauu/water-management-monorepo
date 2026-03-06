<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Preview Form Scoring</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .th-blue { background-color: #5B9BD5; color: white; }
        .bg-score { background-color: #e0f2fe; } /* Warna biru muda untuk kolom skor */
    </style>
</head>
<body class="p-8 bg-gray-100">

    <div class="bg-white p-6 rounded shadow">
        
        <div class="flex justify-between items-center mb-6">
            <h1 class="text-2xl font-bold text-gray-700">Preview Data Scoring</h1>
            

        </div>

        <div class="overflow-x-auto">
            <table class="min-w-full border border-gray-300 text-sm">
                <thead>
                    <tr>
                        <th class="border p-2 th-blue">No</th>
                        <th class="border p-2 th-blue">Jalur</th>
                        <th class="border p-2 th-blue">Jenis</th>
                        <th class="border p-2 th-blue">Kedalaman (cm)</th>
                        <th class="border p-2 th-blue">Jml Pokok</th>
                        <th class="border p-2 th-blue">Durasi</th>
                        <th class="border p-2 th-blue">Kondisi Aliran</th>
                        <th class="border p-2 th-blue">Penyebab</th>
                        
                        <th class="border p-2 bg-blue-800 text-white">Skor Kedalaman</th>
                        <th class="border p-2 bg-blue-800 text-white">Skor Pokok</th>
                        <th class="border p-2 bg-blue-800 text-white">Skor Durasi</th>
                        <th class="border p-2 bg-blue-800 text-white">Skor Aliran</th>
                        <th class="border p-2 bg-blue-800 text-white">Skor Penyebab</th>
                        <th class="border p-2 bg-green-700 text-white">TOTAL SKOR</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($laporan as $index => $row)
                    <tr class="text-center hover:bg-gray-50">
                        <td class="border p-2">{{ $index + 1 }}</td>
                        <td class="border p-2">{{ $row->nomor_jalur }}</td>
                        <td class="border p-2">{{ $row->tipe_objek }}</td>
                        <td class="border p-2">{{ $row->kedalaman_cm }}</td>
                        <td class="border p-2">{{ $row->jumlah_pokok }}</td>
                        <td class="border p-2">{{ $row->durasi_genangan }}</td>
                        <td class="border p-2">{{ $row->kondisi_aliran }}</td>
                        <td class="border p-2">{{ $row->penyebab }}</td>

                        <td class="border p-2 bg-score font-semibold">{{ $row->skor_kedalaman }}</td>
                        <td class="border p-2 bg-score font-semibold">{{ $row->skor_pokok }}</td>
                        <td class="border p-2 bg-score font-semibold">{{ $row->skor_durasi }}</td>
                        <td class="border p-2 bg-score font-semibold">{{ $row->skor_aliran }}</td>
                        <td class="border p-2 bg-score font-semibold">{{ $row->skor_penyebab }}</td>
                        
                        <td class="border p-2 bg-green-100 font-bold text-green-800">{{ $row->total_skor }}</td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="14" class="p-4 text-center text-gray-500">Belum ada data laporan.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>

</body>
</html>