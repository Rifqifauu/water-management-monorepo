<?php

namespace App\Exports;

use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\WithTitle;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class MonitoringExport implements FromView, WithTitle, WithStyles, WithColumnWidths
{
    protected $data;
    protected $title;

    public function __construct(array $data, string $title)
    {
        $this->data  = $data;
        $this->title = $title;
    }

    public function title(): string
    {
        // Judul tab (misal: "Blok A1")
        return $this->title;
    }

    public function columnWidths(): array
    {
        return [
            'A' => 6, 'B' => 15, 'C' => 25, 'D' => 12, 'E' => 20,
            'F' => 18, 'G' => 15, 'H' => 10, 'I' => 45,
        ];
    }

    public function view(): View
    {
        return view('exports.detail-monitoring', [
            'data' => $this->data,
            'date' => now()->translatedFormat('d F Y')
        ]);
    }

    public function styles(Worksheet $sheet)
    {
        $sheet->getStyle('A1:I500')->getAlignment()->setWrapText(true);
        $sheet->getStyle('A1:I500')->getAlignment()->setVertical('center');
        $sheet->getStyle('A15:I500')->getAlignment()->setVertical('top');
        
        return [
            1 => ['font' => ['bold' => true, 'size' => 16]],
        ];
    }
}