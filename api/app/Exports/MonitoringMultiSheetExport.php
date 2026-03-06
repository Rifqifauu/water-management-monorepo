<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\WithMultipleSheets;

class MonitoringMultiSheetExport implements WithMultipleSheets
{
    protected $allData;

    public function __construct(array $allData)
    {
        $this->allData = $allData;
    }

    public function sheets(): array
    {
        $sheets = [];

        foreach ($this->allData as $item) {
            // $item['title'] adalah nama Blok, $item['payload'] adalah datanya
            $sheets[] = new MonitoringExport($item['payload'], $item['title']);
        }

        return $sheets;
    }
}