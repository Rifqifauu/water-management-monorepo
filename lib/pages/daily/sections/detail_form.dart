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

  // --- Logic Helpers ---

  List<String> _getOptions(String param) {
    return skoringData
        .where((s) =>
            s.unit == form['tipe_objek'] &&
            s.parameter == param &&
            s.labelKondisi != null)
        .map((s) => s.labelKondisi!)
        .toSet()
        .toList();
  }

  bool _hasParam(String param) =>
      skoringData.any((s) => s.unit == form['tipe_objek'] && s.parameter == param);

  String? _getValidValue(String? value, List<String> options) {
    return (value != null && options.contains(value)) ? value : null;
  }

  @override
  Widget build(BuildContext context) {
    final availableUnits = skoringData.map((e) => e.unit).toSet().toList();

    final inputDecor = InputDecoration(
      filled: true,
      fillColor: const Color(0xFFF9FAFB),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey[200]!),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return SectionCard(
      title: "Detail Lapangan",
      icon: Icons.grid_view,
      color: Colors.indigo,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TIPE OBJEK
          SearchableSelect<String>(
            label: "Tipe Objek",
            items: availableUnits,
            value: form['tipe_objek'],
            hint: "Pilih Tipe Objek",
            itemLabel: (item) => item,
            onChanged: (val) {
              form['tipe_objek'] = val;
              _resetFormValues();
              onUpdate();
            },
          ),
          const SizedBox(height: 16),

          // ROW 1: NOMOR JALUR & KEDALAMAN
          _buildFormRow([
            _buildTextField(
              label: "NOMOR JALUR",
              initialValue: form['nomor_jalur'],
              decoration: inputDecor,
              onChanged: (v) => form['nomor_jalur'] = v,
            ),
            if (_hasParam('Kedalaman'))
              _buildScoredTextField(
                label: "Kedalaman",
                score: scores['kedalaman'] ?? 0,
                initialValue: form['kedalaman_cm'],
                decoration: inputDecor,
                onChanged: (v) {
                  form['kedalaman_cm'] = v;
                  onUpdate();
                },
              ),
          ]),

          // ROW 2: JML POKOK & DURASI
          if (_hasParam('Jumlah Pokok Terdampak') || _hasParam('Durasi')) ...[
            const SizedBox(height: 16),
            _buildFormRow([
              if (_hasParam('Jumlah Pokok Terdampak'))
                _buildScoredTextField(
                  label: "Jml Pokok",
                  score: scores['jumlah_pokok'] ?? 0,
                  initialValue: form['jumlah_pokok'],
                  isNumber: true,
                  decoration: inputDecor,
                  onChanged: (v) {
                    form['jumlah_pokok'] = v;
                    onUpdate();
                  },
                )
              else
                const SizedBox.shrink(),
              if (_hasParam('Durasi'))
                _buildScoredDropdown(
                  label: "Durasi",
                  score: scores['durasi'] ?? 0,
                  value: _getValidValue(form['durasi_genangan'], _getOptions('Durasi')),
                  options: _getOptions('Durasi'),
                  decoration: inputDecor,
                  onChanged: (val) {
                    form['durasi_genangan'] = val;
                    onUpdate();
                  },
                )
              else
                const SizedBox.shrink(),
            ]),
          ],

          // ROW 3: ALIRAN & PENYEBAB
          if (_hasParam('Aliran') || _hasParam('Penyebab')) ...[
            const SizedBox(height: 16),
            _buildFormRow([
              if (_hasParam('Aliran'))
                _buildScoredDropdown(
                  label: "Aliran",
                  score: scores['aliran'] ?? 0,
                  value: _getValidValue(form['kondisi_aliran'], _getOptions('Aliran')),
                  options: _getOptions('Aliran'),
                  decoration: inputDecor,
                  onChanged: (val) {
                    form['kondisi_aliran'] = val;
                    onUpdate();
                  },
                )
              else
                const SizedBox.shrink(),
              if (_hasParam('Penyebab'))
                _buildScoredDropdown(
                  label: "Penyebab",
                  score: scores['penyebab'] ?? 0,
                  value: _getValidValue(form['penyebab'], _getOptions('Penyebab')),
                  options: _getOptions('Penyebab'),
                  decoration: inputDecor,
                  onChanged: (val) {
                    form['penyebab'] = val;
                    onUpdate();
                  },
                )
              else
                const SizedBox.shrink(),
            ]),
          ],

          // ROW 4: TINDAKAN
          if (_hasParam('Tindakan')) ...[
            const SizedBox(height: 16),
            _buildFormRow([
              _buildScoredDropdown(
                label: "Tindakan",
                score: scores['tindakan'] ?? 0,
                value: _getValidValue(form['tindakan'], _getOptions('Tindakan')),
                options: _getOptions('Tindakan'),
                decoration: inputDecor,
                onChanged: onTindakanChanged,
              ),
              const SizedBox.shrink(), // Spacer agar tetap 50% lebar
            ]),
          ],
        ],
      ),
    );
  }

  // --- UI Components ---

  Widget _buildFormRow(List<Widget> children) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children
          .map((child) => Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: child is SizedBox ? 0 : 6),
                  child: child,
                ),
              ))
          .toList(),
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
          padding: const EdgeInsets.only(bottom: 8, left: 4),
          child: Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
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
      children: [
        LabelWithScore(label: label, score: score),
        DropdownButtonFormField<String>(
          isExpanded: true,
          value: value,
          decoration: decoration,
          items: options
              .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12))))
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  void _resetFormValues() {
    form['kedalaman_cm'] = '';
    form['jumlah_pokok'] = '';
    form['kondisi_aliran'] = null;
    form['durasi_genangan'] = null;
    form['penyebab'] = null;
    form['tindakan'] = null;
  }
}