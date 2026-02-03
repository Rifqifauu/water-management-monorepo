import 'package:flutter/material.dart';
import '../../models/monitoring_model.dart'; 
import 'form/daily_form.dart'; 
import 'form/weekly_form.dart'; 
import 'form/wl_form.dart';

class ObservationEntryPage extends StatefulWidget {
  final List<KaryawanModel> listKaryawan;
  final List<LokasiModel> listLokasi;
  final List<SkoringConfig> skoringData;

  const ObservationEntryPage({
    super.key,
    required this.listKaryawan,
    required this.listLokasi,
    required this.skoringData,
  });

  @override
  State<ObservationEntryPage> createState() => _ObservationEntryPageState();
}

class _ObservationEntryPageState extends State<ObservationEntryPage> {
  String activeTab = 'daily'; 
  
  List<SkoringConfig> get filteredSkoringData {
    if (widget.skoringData.isEmpty) return [];

    var result = widget.skoringData.where((item) {
      final unitName = item.unit.toUpperCase().trim();
      
      if (activeTab == 'daily') {
        return unitName == 'GENANGAN' || unitName == 'PARIT';
      }
      if (activeTab == 'weekly') {
        return unitName == 'INFRASTRUKTUR';
      }
      if (activeTab == 'water_level') {
        return unitName == 'WATER LEVEL';
      }
      return false;
    }).toList();

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 10),
                    Center(
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[200]!)
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTabButton("Daily", 'daily', Colors.blue),
                    _buildTabButton("Weekly", 'weekly', Colors.indigo),
                    _buildTabButton("WL", 'water_level', Colors.cyan),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // --- CONTENT AREA ---
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _buildActiveForm(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActiveForm() {
    // Cek jika data master kosong (User belum pernah sync)
    if (widget.listKaryawan.isEmpty || widget.listLokasi.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cloud_off, size: 60, color: Colors.grey[400]),
            const SizedBox(height: 16),
            const Text("Data Master Kosong", style: TextStyle(fontWeight: FontWeight.bold)),
            const Text("Silakan kembali ke Home dan tekan 'Update Data'", style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }
    switch (activeTab) {
      case 'daily':
        return DailyForm(
          key: const ValueKey('daily'),
          skoringData: filteredSkoringData, // Kirim data yang sudah difilter
          listKaryawan: widget.listKaryawan, // Ambil dari Parent
          listLokasi: widget.listLokasi,     // Ambil dari Parent
        );
      case 'weekly':
          return WeeklyForm(
          key: const ValueKey('weekly'),
          skoringData: filteredSkoringData, // Kirim data yang sudah difilter
          listKaryawan: widget.listKaryawan, // Ambil dari Parent
          listLokasi: widget.listLokasi,     // Ambil dari Parent
        );
      case 'water_level':
          return WaterLevelForm(
          key: const ValueKey('weekly'),
          skoringData: filteredSkoringData, // Kirim data yang sudah difilter
          listKaryawan: widget.listKaryawan, // Ambil dari Parent
          listLokasi: widget.listLokasi,     // Ambil dari Parent
        );
      default:
        return const SizedBox();
    }
  }

  Widget _buildTabButton(String label, String tabKey, Color activeColor) {
    bool isActive = activeTab == tabKey;
    return GestureDetector(
      onTap: () => setState(() => activeTab = tabKey),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isActive ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))] : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: isActive ? activeColor : Colors.grey[500],
          ),
        ),
      ),
    );
  }
}