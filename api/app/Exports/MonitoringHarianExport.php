<?php

namespace App\Exports;

use App\Models\Skoring; // Pastikan Model Skoring di-import
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Events\AfterSheet;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use App\Models\SkoringHarian;

class MonitoringHarianExport implements FromCollection, WithHeadings, WithMapping, WithStyles, WithEvents, ShouldAutoSize
{
    protected $data;
    protected $rules; // Menyimpan aturan skor dari database
    protected $rowNumber = 0;

    public function __construct($data)
    {
        $this->data = $data;
        
        // AMBIL MASTER SKOR DARI DATABASE
        // Kita load sekali saja di sini agar export cepat
        $this->rules = Skoring::all()->groupBy('kategori_parameter');
    }

    public function collection()
    {
        return $this->data;
    }

    /**
     * DISINI LOGIKA PERHITUNGAN SKORNYA (Sama seperti di Preview)
     */
    public function map($row): array
    {
        $this->rowNumber++;

        // 1. Tentukan Kategori Kedalaman (Parit vs Genangan)
        $kategoriKedalaman = 'Kedalaman Genangan'; 
        if (stripos($row->tipe_objek, 'Parit') !== false) {
            $kategoriKedalaman = 'Kedalaman Parit';
        }

        // 2. Hitung Skor pakai Helper Function
        $skorKedalaman = SkoringHarian::getScore($kategoriKedalaman, $row->kedalaman_cm);
        $skorPokok     = SkoringHarian::getScore('Jumlah Pokok Terdampak', $row->jumlah_pokok);
        $skorDurasi    = SkoringHarian::getScore('Durasi', $row->durasi_genangan);
        $skorAliran    = SkoringHarian::getScore('Kondisi Aliran', $row->kondisi_aliran);
        $skorPenyebab  = SkoringHarian::getScore('Penyebab Masalah', $row->penyebab);

        // 3. Hitung Total
        $totalSkor = $skorKedalaman + $skorPokok + $skorDurasi + $skorAliran + $skorPenyebab;
        
        return [
            $this->rowNumber,           // No
            $row->nomor_jalur,          // Jalur
            $row->tipe_objek,           // Jenis
            $row->kedalaman_cm,         // Kedalaman
            $row->jumlah_pokok,         // Jumlah Pokok
            $row->durasi_genangan,      // Durasi
            $row->kondisi_aliran,       // Kondisi Aliran
            $row->penyebab,             // Penyebab
            
            // Masukkan Hasil Hitungan ke Kolom Excel
            $skorKedalaman,             
            $skorPokok,                 
            $skorDurasi,                
            $skorAliran,                
            $skorPenyebab,              
            $totalSkor,                 
        ];
    }

   

    public function headings(): array
    {
        return [
            'No', 'Jalur', 'Jenis', 'Kedalaman (cm)', 'Jumlah Pokok', 'Durasi (hari)', 
            'Kondisi Aliran', 'Penyebab', 'Skor Kedalaman', 'Skor Jumlah Pokok', 
            'Skor Durasi', 'Skor Aliran', 'Skor Penyebab', 'Total Skor'
        ];
    }

    // --- Styling Header & Judul ---
    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function(AfterSheet $event) {
                $sheet = $event->sheet;
                
                // Header Judul & Info
                $sheet->insertNewRowBefore(1, 5);
                $sheet->mergeCells('A1:N1');
                $sheet->setCellValue('A1', 'FORM SCORING - CHECKLIST HARIAN GENANGAN DAN PARIT');

                // Info Data (Ambil dari baris pertama)
                $firstData = $this->data->first();
                $tanggal = $firstData ? $firstData->tanggal : '-';
                $blok = $firstData && $firstData->lokasi ? $firstData->lokasi->blok : '-';
                $afdeling = $firstData && $firstData->lokasi ? $firstData->lokasi->afdeling : '-';
                $mandau = $firstData && $firstData->karyawan ? $firstData->karyawan->nama : '-';

                $sheet->setCellValue('A2', 'Tanggal:'); $sheet->mergeCells('B2:C2'); $sheet->setCellValue('B2', $tanggal);
                $sheet->setCellValue('D2', 'Blok:');    $sheet->mergeCells('E2:G2'); $sheet->setCellValue('E2', $blok);
                $sheet->setCellValue('A3', 'Afdeling:');$sheet->mergeCells('B3:C3'); $sheet->setCellValue('B3', $afdeling);
                $sheet->setCellValue('D3', 'Nama Mandau Air:'); $sheet->mergeCells('E3:G3'); $sheet->setCellValue('E3', $mandau);

                // Styling Warna
                $sheet->getStyle('A1:N1')->applyFromArray([
                    'font' => ['bold' => true, 'color' => ['rgb' => 'FFFFFF'], 'size' => 14],
                    'fill' => ['fillType' => Fill::FILL_SOLID, 'startColor' => ['rgb' => '1F4E78']],
                    'alignment' => ['horizontal' => Alignment::HORIZONTAL_CENTER],
                ]);

                $yellowStyle = ['fill' => ['fillType' => Fill::FILL_SOLID, 'startColor' => ['rgb' => 'FFEB9C']], 'borders' => ['allBorders' => ['borderStyle' => Border::BORDER_THIN]]];
                $sheet->getStyle('B2:C2')->applyFromArray($yellowStyle);
                $sheet->getStyle('E2:G2')->applyFromArray($yellowStyle);
                $sheet->getStyle('B3:C3')->applyFromArray($yellowStyle);
                $sheet->getStyle('E3:G3')->applyFromArray($yellowStyle);

                // Header Tabel
                $sheet->getStyle('A6:N6')->applyFromArray([
                    'font' => ['bold' => true, 'color' => ['rgb' => 'FFFFFF']],
                    'fill' => ['fillType' => Fill::FILL_SOLID, 'startColor' => ['rgb' => '5B9BD5']],
                    'alignment' => ['horizontal' => Alignment::HORIZONTAL_CENTER, 'vertical' => Alignment::VERTICAL_CENTER],
                    'borders' => ['allBorders' => ['borderStyle' => Border::BORDER_THIN]]
                ]);

                // Border Data
                $lastRow = $this->data->count() + 6;
                $sheet->getStyle('A6:N' . $lastRow)->applyFromArray([
                    'borders' => ['allBorders' => ['borderStyle' => Border::BORDER_THIN]],
                    'alignment' => ['horizontal' => Alignment::HORIZONTAL_CENTER]
                ]);
            },
        ];
    }

    public function styles(Worksheet $sheet) { return []; }
}