import 'package:flutter/material.dart';
import '../../../../models/monitoring_model.dart';
import '../../../../widgets/searchable_select.dart';
import '../../../../widgets/common_widgets.dart';

class DetailForm extends StatelessWidget {
  final Map<String, dynamic> form;
  final Map<String, int> scores;
  final List<SkoringConfig> skoringData;
  final VoidCallback onUpdate;
  final Function(String?) onTindakanChanged;

  const DetailForm({
    super.key,
    required this.form,
    required this.scores,
    required this.skoringData,
    required this.onUpdate,
    required this.onTindakanChanged,
  });

  // --- Helpers ---

  List<String> _getOptions(String param) {
    return skoringData
        .where((s) =>
            s.unit == 'Infrastruktur' &&
            s.parameter == param &&
            s.labelKondisi != null)
        .map((s) => s.labelKondisi!)
        .toSet()
        .toList();
  }

  String? _getValidValue(String? currentValue, List<String> options) {
    if (currentValue == null || !options.contains(currentValue)) return null;
    return currentValue;
  }

  @override
  Widget build(BuildContext context) {
    final availableUnits = skoringData.map((e) => e.unit).toSet().toList();

    final inputDecor = InputDecoration(
      filled: true,
      fillColor: const Color(0xFFF9FAFB),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey[200]!),
      ),
    );

    // Persiapkan Opsi
    final optionsAliran = _getOptions('Aliran');
    final optionsPenyebab = _getOptions('Penyebab');
    final optionsTindakan = _getOptions('Tindakan');

    return SectionCard(
      title: "Detail Lapangan",
      icon: Icons.grid_view,
      color: Colors.indigo,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Jenis Infrastruktur
          SearchableSelect<String>(
            label: "Jenis Infrastruktur",
            items: const ['Jembatan', 'Pipa (PVC)', 'Gorong-Gorong Baja (NF)'],
            value: form['jenis_infrastruktur'],
            hint: availableUnits.isEmpty ? "Data Kosong" : "Pilih Jenis...",
            itemLabel: (item) => item,
            onChanged: (val) {
              form['jenis_infrastruktur'] = val;
              onUpdate();
            },
          ),
          const SizedBox(height: 20),

          // Baris 1: ID Objek & Aliran
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildTextField(
                  label: "ID Objek",
                  initialValue: form['id_objek'],
                  decoration: inputDecor,
                  onChanged: (val) {
                    form['id_objek'] = val;
                    onUpdate();
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildScoredDropdown(
                  label: "Kondisi Aliran",
                  score: scores['aliran'] ?? 0,
                  value: _getValidValue(form['kondisi_aliran'], optionsAliran),
                  options: optionsAliran,
                  decoration: inputDecor,
                  onChanged: (val) {
                    form['kondisi_aliran'] = val;
                    onUpdate();
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Baris 2: Tindakan & Penyebab
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildScoredDropdown(
                  label: "Tindakan",
                  score: scores['tindakan'] ?? 0,
                  value: _getValidValue(form['tindakan'], optionsTindakan),
                  options: optionsTindakan,
                  decoration: inputDecor,
                  onChanged: onTindakanChanged,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildScoredDropdown(
                  label: "Penyebab",
                  score: scores['penyebab'] ?? 0,
                  value: _getValidValue(form['penyebab'], optionsPenyebab),
                  options: optionsPenyebab,
                  decoration: inputDecor,
                  onChanged: (val) {
                    form['penyebab'] = val;
                    onUpdate();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --- Widget Components ---

  Widget _buildTextField({
    required String label,
    required String? initialValue,
    required InputDecoration decoration,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          initialValue: initialValue,
          decoration: decoration,
          style: const TextStyle(fontSize: 13),
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildScoredDropdown({
    required String label,
    required int score,
    required String? value,
    required List<String> options,
    required InputDecoration decoration,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelWithScore(label: label, score: score),
        DropdownButtonFormField<String>(
          isExpanded: true,
          value: value,
          decoration: decoration,
          icon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
          items: options.map((e) {
            return DropdownMenuItem(
              value: e,
              child: Text(
                e,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 13),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}