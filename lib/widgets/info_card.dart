import 'package:flutter/material.dart';
import '../../models/monitoring_model.dart';
import '../../widgets/searchable_select.dart';
import '../../widgets/common_widgets.dart'; // Asumsi SectionCard & _label ada disini

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

  const InfoCard({
    super.key, required this.form, required this.listKaryawan, required this.listLokasi,
    required this.selectedKaryawan, required this.selectedAfdeling, required this.selectedLokasi,
    required this.onKaryawanChanged, required this.onAfdelingChanged, required this.onLokasiChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Logic filter blok dipindah kesini atau tetap di parent (disini saya pakai computed lokal sederhana)
    List<String> uniqueAfdelings = listLokasi.map((e) => e.afdeling).toSet().toList()..sort();
    List<LokasiModel> filteredBloks = listLokasi.where((e) => e.afdeling == selectedAfdeling).toList()..sort((a,b) => a.blok.compareTo(b.blok));
    
    // Style input sederhana
    final inputDecor = InputDecoration(
      filled: true, fillColor: const Color(0xFFF9FAFB),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey[300]!)),
    );

    return SectionCard(
      title: "Informasi Dasar", icon: Icons.person, color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.only(bottom:8), child: Text("TANGGAL", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold))),
          TextFormField(initialValue: form['tanggal'], readOnly: true, decoration: inputDecor),
          const SizedBox(height: 16),
          SearchableSelect<KaryawanModel>(
            label: "Nama Observer", items: listKaryawan, value: selectedKaryawan, hint: "Cari...",
            itemLabel: (item) => item.nama,
            onChanged: onKaryawanChanged,
          ),
          const SizedBox(height: 16),
          Row(children: [
            Expanded(child: SearchableSelect<String>(
              label: "Afdeling", items: uniqueAfdelings, value: selectedAfdeling, hint: "Pilih...",
              itemLabel: (item) => item,
              onChanged: onAfdelingChanged,
            )),
            const SizedBox(width: 12),
            Expanded(child: SearchableSelect<LokasiModel>(
              label: "Blok", items: filteredBloks, value: selectedLokasi, hint: "Pilih...",
              itemLabel: (item) => item.blok,
              onChanged: onLokasiChanged,
            )),
          ])
        ],
      ),
    );
  }
}