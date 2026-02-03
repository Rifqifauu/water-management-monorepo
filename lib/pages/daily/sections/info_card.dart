import 'package:flutter/material.dart';
// Import model dan widget umum Anda
import '../../../../models/monitoring_model.dart';
import '../../../../widgets/searchable_select.dart';
import '../../../../widgets/common_widgets.dart'; // Asumsi SectionCard ada di sini

class InfoCard extends StatelessWidget {
  final Map<String, dynamic> form;
  final List<KaryawanModel> listKaryawan;
  final List<LokasiModel> listLokasi;
  
  final KaryawanModel? selectedKaryawan;
  final String? selectedAfdeling;
  final LokasiModel? selectedLokasi;

  final Function(KaryawanModel?) onKaryawanChanged;
  final Function(String?) onAfdelingChanged;
  final Function(LokasiModel?) onLokasiChanged;
  
  // Parameter baru wajib ditambahkan agar sinkron dengan DailyForm
  final Function(String?) onTipeObjekChanged; 

  const InfoCard({
    super.key,
    required this.form,
    required this.listKaryawan,
    required this.listLokasi,
    required this.selectedKaryawan,
    required this.selectedAfdeling,
    required this.selectedLokasi,
    required this.onKaryawanChanged,
    required this.onAfdelingChanged,
    required this.onLokasiChanged,
    required this.onTipeObjekChanged, // Tambahkan di constructor
  });

  @override
  Widget build(BuildContext context) {
    List<String> uniqueAfdelings = listLokasi.map((e) => e.afdeling).toSet().toList()..sort();
    
    List<LokasiModel> filteredBloks = listLokasi
        .where((e) => e.afdeling == selectedAfdeling)
        .toList()
        ..sort((a, b) => a.blok.compareTo(b.blok));

    final inputDecor = InputDecoration(
      filled: true,
      fillColor: const Color(0xFFF9FAFB),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey[300]!)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey[300]!)),
    );

    return SectionCard(
      title: "Informasi Dasar",
      icon: Icons.person,
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TANGGAL
          _label("TANGGAL"),
          TextFormField(
            initialValue: form['tanggal'],
            readOnly: true,
            decoration: inputDecor.copyWith(suffixIcon: const Icon(Icons.calendar_today, size: 18)),
          ),
          
          const SizedBox(height: 16),

          // NAMA OBSERVER
          SearchableSelect<KaryawanModel>(
            label: "Nama Observer",
            items: listKaryawan,
            value: selectedKaryawan,
            hint: "Cari Nama Karyawan...",
            itemLabel: (item) => item.nama,
            onChanged: onKaryawanChanged,
          ),

          const SizedBox(height: 16),

          // LOKASI (AFDELING & BLOK)
          Row(
            children: [
              Expanded(
                child: SearchableSelect<String>(
                  label: "Afdeling",
                  items: uniqueAfdelings,
                  value: selectedAfdeling,
                  hint: "Pilih...",
                  itemLabel: (item) => item,
                  onChanged: onAfdelingChanged,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SearchableSelect<LokasiModel>(
                  label: "Blok",
                  items: filteredBloks,
                  value: selectedLokasi,
                  hint: "Pilih...",
                  itemLabel: (item) => item.blok,
                  onChanged: onLokasiChanged,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

         
        ],
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(text, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black54)),
    );
  }
}