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
  final List<InfrastructureMaster> infrastructureMasterData;
  final InfrastructureMaster? selectedInfrastructureMaster;
  final Function(InfrastructureMaster?) onInfrastructureMasterChanged;
  final Map<String, double>? distanceMap;

  const DetailForm({
    super.key,
    required this.form,
    required this.scores,
    required this.skoringData,
    required this.onUpdate,
    required this.onTindakanChanged,
    required this.infrastructureMasterData,
    this.selectedInfrastructureMaster,
    required this.onInfrastructureMasterChanged,
    this.distanceMap,
  });
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SearchableSelect<InfrastructureMaster>(
                  label: "No Infrastructure",
                  items: infrastructureMasterData,
                  value: selectedInfrastructureMaster,
                  hint: "Cari No Infrastructure...",
                  itemLabel: (item) {
                    String distanceText = "";
                    if (distanceMap != null) {
                      double? dist = distanceMap![item.id.toString()];
                      if (dist != null && dist != 999999999.0) {
                        if (dist > 1000) {
                          distanceText =
                              " - ${(dist / 1000).toStringAsFixed(2)} km";
                        } else {
                          distanceText = " - ${dist.toStringAsFixed(0)} m";
                        }
                      }
                    }
                    return "${item.id_object}$distanceText";
                  },
                  onChanged: (master) {
                    form['jenis_infrastruktur'] = master?.category ?? '-';
                    onInfrastructureMasterChanged(master);
                    onUpdate();
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildTextField(
                  label: "Jenis Infrastruktur",
                  initialValue: form['jenis_infrastruktur'] ?? '-',
                  decoration: inputDecor.copyWith(
                    fillColor: Colors
                        .grey[200], // Gelapkan sedikit agar terlihat readonly
                  ),
                  readOnly: true,
                  onChanged: (_) {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
          const SizedBox(height: 16),

          // Baris 3: Tindakan (Full Width atau Row)
          _buildScoredDropdown(
            label: "Tindakan",
            score: scores['tindakan'] ?? 0,
            value: _getValidValue(form['tindakan'], optionsTindakan),
            options: optionsTindakan,
            decoration: inputDecor,
            onChanged: onTindakanChanged,
          ),
        ],
      ),
    );
  }

  // --- Update Helper Widget ---

  Widget _buildTextField({
    required String label,
    required String? initialValue,
    required InputDecoration decoration,
    required Function(String) onChanged,
    bool readOnly = false, // Tambahkan parameter ini
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
          key: Key(initialValue ??
              ''), // Penting agar text terupdate saat state berubah
          initialValue: initialValue,
          decoration: decoration,
          readOnly: readOnly,
          style: TextStyle(
            fontSize: 13,
            color: readOnly ? Colors.grey[700] : Colors.black,
          ),
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
