<table>
    <thead>
        <tr>
            <th colspan="9" style="text-align: center; font-weight: bold; font-size: 16px;">LAPORAN MONITORING</th>
        </tr>
        <tr>
            <th colspan="9" style="text-align: center; font-weight: bold;">Form Monitoring Performa Blok</th>
        </tr>
        <tr>
            <th colspan="9" style="text-align: center;">Periode: {{ $date }}</th>
        </tr>
        <tr><th colspan="9"></th></tr>
    </thead>

    <tbody>
        <tr>
            <td colspan="3" style="font-weight: bold; color: #333;">RINGKASAN DASHBOARD</td>
            <td colspan="6"></td>
        </tr>
        <tr>
            <td colspan="3">Total Skor Keseluruhan (Weighted)</td>
            <td colspan="6"></td>
        </tr>
        <tr>
            <td colspan="3" style="font-size: 24px; font-weight: bold; color: #FF0000;">
                {{ number_format($data['summary']['skor_final'] ?? 0, 2, ',', '.') }}
            </td>
            <td colspan="6"></td>
        </tr>
        <tr>
            <td colspan="3">Kategori: <strong>{{ strtoupper($data['summary']['kategori'] ?? 'N/A') }}</strong></td>
            <td colspan="6"></td>
        </tr>
        
        <tr><td colspan="9"></td></tr>

        <tr>
            <td colspan="3" style="font-weight: bold; color: #4472C4;">SKOR PER KATEGORI</td>
            <td colspan="6"></td>
        </tr>
        <tr>
            <td colspan="2">1. Skor Harian</td>
            <td style="font-weight: bold; color: #4472C4;">: {{ number_format($data['summary']['skor_harian'] ?? 0, 2, ',', '.') }}</td>
            <td colspan="6"></td>
        </tr>
        <tr>
            <td colspan="2">2. Skor Infrastruktur</td>
            <td style="font-weight: bold; color: #4472C4;">: {{ number_format($data['summary']['skor_mingguan'] ?? 0, 2, ',', '.') }}</td>
            <td colspan="6"></td>
        </tr>
        <tr>
            <td colspan="2">3. Skor Water Level</td>
            <td style="font-weight: bold; color: #4472C4;">: {{ number_format($data['summary']['skor_water'] ?? 0, 2, ',', '.') }}</td>
            <td colspan="6"></td>
        </tr>
        <tr><td colspan="9"></td></tr>

        <tr>
            <th colspan="9" style="background-color: #4472C4; color: #ffffff; font-weight: bold; border: 1px solid #000000;">&nbsp;I. DETAIL MONITORING HARIAN (GENANGAN & PARIT)</th>
        </tr>
        <tr style="background-color: #d9e1f2; font-weight: bold; text-align: center;">
            <th style="border: 1px solid #000000;">No</th>
            <th style="border: 1px solid #000000;">Tanggal</th>
            <th style="border: 1px solid #000000;">Pengamat</th>
            <th style="border: 1px solid #000000;">Blok</th>
            <th style="border: 1px solid #000000;">Objek</th>
            <th style="border: 1px solid #000000;">Kedalaman</th>
            <th style="border: 1px solid #000000;">Aliran</th>
            <th style="border: 1px solid #000000;">Skor</th>
            <th style="border: 1px solid #000000;">Tindakan</th>
        </tr>
        @forelse($data['harian'] as $row)
        <tr>
            <td style="border: 1px solid #000000; text-align: center;">{{ $row[0] }}</td>
            <td style="border: 1px solid #000000; text-align: center;">{{ $row[1] }}</td>
            <td style="border: 1px solid #000000;">{{ $row[2] }}</td>
            <td style="border: 1px solid #000000; text-align: center;">{{ $row[3] }}</td>
            <td style="border: 1px solid #000000;">{{ $row[4] }}</td>
            <td style="border: 1px solid #000000; text-align: center;">{{ $row[5] }}</td>
            <td style="border: 1px solid #000000;">{{ $row[6] }}</td>
            <td style="border: 1px solid #000000; text-align: center; font-weight: bold;">{{ $row[7] }}</td>
            <td style="border: 1px solid #000000;">{{ $row[8] }}</td>
        </tr>
        @empty
        <tr><td colspan="9" style="border: 1px solid #000000; text-align: center;">Tidak ada data harian</td></tr>
        @endforelse
        <tr><td colspan="9"></td></tr>

        <tr>
            <th colspan="9" style="background-color: #4472C4; color: #ffffff; font-weight: bold; border: 1px solid #000000;">&nbsp;II. DETAIL MONITORING MINGGUAN (INFRASTRUKTUR)</th>
        </tr>
        <tr style="background-color: #d9e1f2; font-weight: bold; text-align: center;">
            <th style="border: 1px solid #000000;">No</th>
            <th style="border: 1px solid #000000;">Tanggal</th>
            <th style="border: 1px solid #000000;">Pengamat</th>
            <th style="border: 1px solid #000000;">Blok</th>
            <th style="border: 1px solid #000000;">Infrastruktur</th>
            <th style="border: 1px solid #000000;">Penyebab</th>
            <th style="border: 1px solid #000000;">-</th>
            <th style="border: 1px solid #000000;">Skor</th>
            <th style="border: 1px solid #000000;">Tindakan</th>
        </tr>
        @forelse($data['mingguan'] as $row)
        <tr>
            @foreach($row as $cell) <td style="border: 1px solid #000000;">{{ $cell }}</td> @endforeach
        </tr>
        @empty
        <tr><td colspan="9" style="border: 1px solid #000000; text-align: center;">Tidak ada data mingguan</td></tr>
        @endforelse
        <tr><td colspan="9"></td></tr>

        <tr>
            <th colspan="9" style="background-color: #4472C4; color: #ffffff; font-weight: bold; border: 1px solid #000000;">&nbsp;III. DETAIL MONITORING WATER LEVEL</th>
        </tr>
        <tr style="background-color: #d9e1f2; font-weight: bold; text-align: center;">
            <th style="border: 1px solid #000000;">No</th>
            <th style="border: 1px solid #000000;">Tanggal</th>
            <th style="border: 1px solid #000000;">Pengamat</th>
            <th style="border: 1px solid #000000;">Blok</th>
            <th style="border: 1px solid #000000;">No. WL</th>
            <th style="border: 1px solid #000000;">Tinggi Air</th>
            <th style="border: 1px solid #000000;">-</th>
            <th style="border: 1px solid #000000;">Skor</th>
            <th style="border: 1px solid #000000;">Keterangan</th>
        </tr>
        @forelse($data['water'] as $row)
        <tr>
            @foreach($row as $cell) <td style="border: 1px solid #000000;">{{ $cell }}</td> @endforeach
        </tr>
        @empty
        <tr><td colspan="9" style="border: 1px solid #000000; text-align: center;">Tidak ada data water level</td></tr>
        @endforelse
    </tbody>
</table>