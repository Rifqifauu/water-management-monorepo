<?php

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\ShouldAutoSize; // 1. Import ini
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\WithColumnWidths; // 2. Import ini
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class DetailExport implements FromView, ShouldAutoSize, WithStyles, WithColumnWidths
{
    protected $data;
    protected $header;

    public function __construct($data, $header)
    {
        $this->data = $data;
        $this->header = $header;
    }

    public function view(): View
    {
        return view('exports.laporan_harian', [
            'laporan' => $this->data,
            'header' => $this->header
        ]);
    }

    // FITUR 1: ATUR LEBAR KOLOM MANUAL
    // Sesuaikan huruf kolom (A, B, C) dengan urutan <th> di blade Anda
    public function columnWidths(): array
    {
        return [
            'A' => 5,  // No (Kecil aja)
            'B' => 12, // Tanggal
            'C' => 8,  // Afdeling
            'D' => 8,  // Blok
            'E' => 25, // Nama Mandau Air (Agak lebar)
            'F' => 8,  // Jalur
            'G' => 12, // WM
            'H' => 12, // Kedalaman
            'I' => 10, // Jml Pokok
            'J' => 15, // Durasi
            'K' => 15, // Aliran
            'L' => 15, // Penyebab
            'M' => 15, // Tindakan
            'N' => 10, // Foto
            'O' => 40, // Keterangan (Paling lebar)
        ];
    }

    // FITUR 2: STYLING (WRAP TEXT & ALIGNMENT)
    public function styles(Worksheet $sheet)
    {
        // 1. Agar tulisan panjang di kolom Keterangan (O) turun ke bawah (Wrap Text)
        $sheet->getStyle('O')->getAlignment()->setWrapText(true);
        
        // 2. Agar Judul Header Tabel (Baris ke-18 estimasi) text-nya di tengah vertikal
        // Sesuaikan range 'A18:O18' dengan posisi baris header tabel di Blade Anda
        // Kalau header tabel mulai baris 19, ganti jadi A19:O19
        $sheet->getStyle('A18:O18')->getAlignment()->setVertical('center');
        $sheet->getStyle('A18:O18')->getAlignment()->setHorizontal('center');

        return [
            // Tambahan style global jika perlu
             1    => ['font' => ['bold' => true]],
        ];
    }
}