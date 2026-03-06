import 'package:flutter/material.dart';
import '../../../../models/monitoring_model.dart';
import '../../../../widgets/searchable_select.dart';
import '../../../../widgets/common_widgets.dart';

class DetailForm extends StatelessWidget {
  final Map<String, dynamic> form;
  final Map<String, int> scores;
  final List<WaterLevelMaster> waterLevelMasterData;
  final List<SkoringConfig> skoringData;
  final VoidCallback onUpdate;
  final Function(String?) onTindakanChanged;
  final WaterLevelMaster? selectedWaterLevelMaster;
  final Function(WaterLevelMaster?) onWaterLevelMasterChanged;
    final Map<String, double>? distanceMap;


  const DetailForm({
    super.key,
    required this.form,
    required this.scores,
    required this.skoringData,
    required this.waterLevelMasterData,
    required this.onUpdate,
    required this.onTindakanChanged,
    this.selectedWaterLevelMaster,
    required this.onWaterLevelMasterChanged,
    this.distanceMap,
  });

  // --- Helpers ---

  List<String> _getOptions(String param) {
    return skoringData
        .where((s) =>
            s.unit == 'Water Level' &&
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
    final optionsAliran = _getOptions('Kondisi Aliran');
    final optionsRisiko = _getOptions('Risiko');
    final optionsKapasitas = _getOptions('Kapasitas Drainase');

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
            child: SearchableSelect<WaterLevelMaster>(
              label: "No Water Level",
              items: waterLevelMasterData,
              value: selectedWaterLevelMaster,
              hint: "Cari No Water Level...",
              itemLabel: (item) {
                String distanceText = "";
                if (distanceMap != null) {
                  double? dist = distanceMap![item.id.toString()];
                  if (dist != null && dist != 999999999.0) {
                    if (dist > 1000) {
                      distanceText = " - ${(dist / 1000).toStringAsFixed(2)} km";
                    } else {
                      distanceText = " - ${dist.toStringAsFixed(0)} m";
                    }
                  }
                }
                return "${item.no_wl}$distanceText";
              },
              onChanged: onWaterLevelMasterChanged,
            ),
          ),
              const SizedBox(width: 16),
               Expanded(
                child: _buildScoredTextField(
                  label: "Ketinggian Air",
                  score: scores['tinggi_level_air'] ?? 0,
                  initialValue: form['tinggi_level_air'],
                  decoration: inputDecor,
                  onChanged: (val) {
                    form['tinggi_level_air'] = val;
                    onUpdate();
                  },
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Expanded(
                child: _buildScoredTextField(
                  score: scores['jarak_ke_bibir'] ?? 0,
                  label: "Jarak ke Bibir",
                  initialValue: form['jarak_ke_bibir'],
                  decoration: inputDecor,
                  onChanged: (val) {
                    form['jarak_ke_bibir'] = val;
                    onUpdate();
                  },
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
              child: _buildScoredDropdown(
                  label: "Kondisi Aliran",
                  score: scores['kondisi_aliran'] ?? 0,
                  value: _getValidValue(form['kondisi_aliran'], optionsAliran),
                  options: optionsAliran,
                  decoration: inputDecor,
                  onChanged: (val) {
                    form['kondisi_aliran'] = val;
                    onUpdate();
                  },                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildScoredDropdown(
                  label: "Risiko",
                  score: scores['risiko'] ?? 0,
                  value: _getValidValue(form['risiko'], optionsRisiko),
                  options: optionsRisiko,
                  decoration: inputDecor,
                  onChanged: (val) {
                    form['risiko'] = val;
                    onUpdate();
                  },
                                  ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildScoredDropdown(
                  label: "Kapasitas Drainase",
                  score: scores['kapasitas_drainase'] ?? 0,
                  value: _getValidValue(form['kapasitas_drainase'], optionsKapasitas),
                  options: optionsKapasitas,
                  decoration: inputDecor,
                  onChanged: (val) {
                    form['kapasitas_drainase'] = val;
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

  Widget _buildScoredTextField({
    required String label,
    required int score,
    required String? initialValue,
    required InputDecoration decoration,
    bool isNumber = false,
    required Function(String) onChanged,
  }) {
    return Column(
      children: [
        LabelWithScore(label: label, score: score),
        TextFormField(
          initialValue: initialValue,
          decoration: decoration,
          style: const TextStyle(fontSize: 13),
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
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