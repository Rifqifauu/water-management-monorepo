<table>
    <thead>
    <tr>
        <td colspan="13" style="text-align: center; font-weight: bold; font-size: 16px;">LAPORAN MONITORING GENANGAN DAN PARIT</td>
    </tr>
    <tr>
        <td colspan="13" style="text-align: center;">Form 1 - Checklist Harian Genangan dan Parit</td>
    </tr>
    <tr>
        <td colspan="13" style="text-align: center;">Tanggal Pelaporan: {{ $header['periode']['tanggal_indo'] }}</td>
    </tr>
    <tr><td></td></tr> </thead>

    <tbody>
    <tr>
        <td colspan="3" style="font-weight: bold; color: #333;">RINGKASAN DASHBOARD MONITORING</td>
    </tr>
    <tr>
        <td colspan="3">Total Skor Keseluruhan</td>
    </tr>
    <tr>
        <td colspan="3" style="font-size: 24px; font-weight: bold; color: #FF0000;">
            {{ str_replace('.', ',', $header['statistik_harian']['total_skor']) }}
        </td>
    </tr>
    <tr>
        <td colspan="3">Kategori: <span style="font-weight: bold;">{{ $header['analisa_harian']['status_bahaya'] }}</span></td>
    </tr>
    <tr>
        <td colspan="3">Rata-rata Skor</td>
    </tr>
    <tr>
        <td colspan="3" style="font-size: 20px; font-weight: bold; color: #4472C4;">
            {{ str_replace('.', ',', $header['statistik_harian']['total_ratarata']) }}
        </td>
    </tr>
    <tr>
        <td colspan="3">Total Skor Parit</td>
    </tr>
    <tr>
        <td colspan="3" style="font-size: 20px; font-weight: bold; color: #4472C4;">
            {{ str_replace('.', ',', $header['statistik_harian']['skor_parit']) }}
        </td>
    </tr>
    <tr>
        <td colspan="3">Total Skor Genangan</td>
    </tr>
    <tr>
        <td colspan="3" style="font-size: 20px; font-weight: bold; color: #4472C4;">
            {{ str_replace('.', ',', $header['statistik_harian']['skor_genangan']) }}
        </td>
    </tr>
    <tr>
        <td colspan="13" style="font-weight: bold; color: #ED7D31;">
            ⚠ STATUS: {{ $header['analisa_harian']['rekomendasi'] }}
        </td>
    </tr>
    <tr>
        <td></td>
    </tr>

    <tr style="background-color: #4472C4; color: white; font-weight: bold; text-align: center;">
        <th style="border: 1px solid #000000; width: 5px;">No</th>
        <th style="border: 1px solid #000000; width: 15px;">Tanggal</th>
        <th style="border: 1px solid #000000; width: 10px;">Afdeling</th>
        <th style="border: 1px solid #000000; width: 10px;">Blok</th>
        <th style="border: 1px solid #000000; width: 25px;">Nama Mandau Air</th>
        <th style="border: 1px solid #000000; width: 8px;">Jalur</th>
        <th style="border: 1px solid #000000; width: 15px;">WM</th>
        <th style="border: 1px solid #000000; width: 15px;">Kedalaman</th>
        <th style="border: 1px solid #000000; width: 10px;">Jml Pokok</th>
        <th style="border: 1px solid #000000; width: 15px;">Durasi</th>
        <th style="border: 1px solid #000000; width: 20px;">Aliran</th>
        <th style="border: 1px solid #000000; width: 20px;">Penyebab</th>
        <th style="border: 1px solid #000000; width: 20px;">Tindakan</th>
        <th style="border: 1px solid #000000; width: 10px;">Foto</th>
        <th style="border: 1px solid #000000; width: 30px;">Keterangan</th>
    </tr>

    @foreach($laporan as $index => $item)
    <tr>
        <td style="border: 1px solid #000000; text-align: center;">{{ $index + 1 }}</td>
        <td style="border: 1px solid #000000;">{{ date('d/m/y', strtotime($item->created_at)) }}</td>
        <td style="border: 1px solid #000000; text-align: center;">{{ $header['lokasi']['afdeling'] }}</td>
        <td style="border: 1px solid #000000; text-align: center;">{{ $header['lokasi']['blok'] }}</td>
        <td style="border: 1px solid #000000;">{{ $item->karyawan ? $item->karyawan->nama : '-' }}</td>
        <td style="border: 1px solid #000000; text-align: center;">{{ $item->nomor_jalur }}</td>
        <td style="border: 1px solid #000000;">{{ $item->tipe_objek }}</td>
        <td style="border: 1px solid #000000;">{{ $item->kedalaman_cm }} cm</td>
        <td style="border: 1px solid #000000; text-align: center;">{{ $item->jumlah_pokok }}</td>
        <td style="border: 1px solid #000000;">{{ $item->durasi_genangan }}</td>
        <td style="border: 1px solid #000000;">{{ $item->kondisi_aliran }}</td>
        <td style="border: 1px solid #000000;">{{ $item->penyebab }}</td>
        <td style="border: 1px solid #000000;">{{ $item->tindakan }}</td>
        <td style="border: 1px solid #000000; text-align: center; color: green; font-weight: bold;">
            {{ $item->foto_path ? 'Ada' : '-' }}
        </td>
        <td style="border: 1px solid #000000;">{{ $item->keterangan }}</td>
    </tr>
    @endforeach
    </tbody>
</table>