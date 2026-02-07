import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart'; 

import '../../../models/monitoring_model.dart';
import '../../../services/api_service.dart';
import '../../../services/queue_service.dart';

import '../water_level/sections/info_card.dart';
import '../water_level/sections/gps_card.dart';
import '../water_level/sections/detail_form.dart';
import '../water_level/sections/photo_section.dart';


class WaterLevelForm extends StatefulWidget {
  final List<SkoringConfig> skoringData;
  final List<KaryawanModel> listKaryawan;
  final List<LokasiModel> listLokasi;

  const WaterLevelForm({
    super.key,
    required this.skoringData,
    required this.listKaryawan,
    required this.listLokasi,
  });

  @override
  State<WaterLevelForm> createState() => _WaterLevelFormState();
}

class _WaterLevelFormState extends State<WaterLevelForm> {
  final ApiService _apiService = ApiService();
  final QueueService _queueService = QueueService();
  final _formKey = GlobalKey<FormState>();

  bool isSubmitting = false;
  bool isGettingGps = false;

  KaryawanModel? selectedKaryawan;
  String? selectedAfdeling;
  LokasiModel? selectedLokasi;
  File? photoBefore, photoAfter;

  Map<String, dynamic> form = {
    'tanggal': DateFormat('yyyy-MM-dd').format(DateTime.now()),
    'no_water_level': '',
    'tinggi_level_air': null,
    'kondisi_aliran': null,
    'jarak_ke_bibir': null,
    'kapasitas_drainase': null,
    'risiko': null,
    'lat_aktual': '',
    'long_aktual': '',
  };

  Map<String, int> scores = {
  'kondisi_aliran': 0, 
  'tinggi_level_air': 0, 
  'jarak_ke_bibir': 0, 
  'risiko': 0, 
  'kapasitas_drainase': 0, 
  };

void _calcScore() {
    print("\n=== MULAI HITUNG SKOR ===");

    int getSkor(String parameter, dynamic value, {bool isNumeric = false}) {
      if (value == null || value.toString().isEmpty) {
        return 0;
      }
      final criteriaList = widget.skoringData.where((s) =>
          s.unit == 'Water Level' && s.parameter.trim() == parameter.trim()
      ).toList();

      if (criteriaList.isEmpty) {
        print("❌ ERROR NAMA: Parameter '$parameter' TIDAK DITEMUKAN di database skoringData!");
        print("   -> Coba cek database, mungkin namanya beda? (misal: 'Tinggi Muka Air')");
        return 0;
      }
      try {
        if (isNumeric) {
          String cleanValue = value.toString().replaceAll(',', '.');
          double val = double.tryParse(cleanValue) ?? -9999;
          
          print("🔍 Cek Numeric '$parameter': Input User = $val");

          for (var c in criteriaList) {
            double min = c.minValue ?? -999999;
            double max = c.maxValue ?? 999999;
                 bool isMatch = val >= min && val <= max;
            print("   -> Bandingkan dengan Range DB: $min s/d $max (Skor: ${c.skor}) => ${isMatch ? 'MATCH! ✅' : 'Gagal ❌'}");   
            if (isMatch) return c.skor;
          }
          print("⚠️ TIDAK ADA RANGE COCOK: Angka $val tidak masuk range manapun.");
          return 0;
        } else {
          var match = criteriaList.firstWhere(
            (c) => c.labelKondisi?.trim().toLowerCase() == value.toString().trim().toLowerCase(),
            orElse: () => SkoringConfig(unit: '', parameter: '', skor: 0),
          );
          return match.skor;
        }
      } catch (e) {
        print("Error calc: $e");
        return 0;
      }
    }

    setState(() {
      scores['tinggi_level_air'] = getSkor('Ketinggian Air', form['tinggi_level_air'], isNumeric: true);
      scores['jarak_ke_bibir'] = getSkor('Jarak ke Bibir', form['jarak_ke_bibir'], isNumeric: true);
      scores['kondisi_aliran'] = getSkor('Kondisi Aliran', form['kondisi_aliran']);
      scores['risiko'] = getSkor('Risiko', form['risiko']);
      scores['kapasitas_drainase'] = getSkor('Kapasitas Drainase', form['kapasitas_drainase']);
    });
    print("=== SELESAI HITUNG SKOR ===\n");
  }
  String get averageScore {
    List<int> activeScores = scores.values.where((s) => s > 0).toList();
    if (activeScores.isEmpty) return "0.00";
    double sum = activeScores.fold(0, (prev, curr) => prev + curr);
    return (sum / activeScores.length).toStringAsFixed(2);
  }

  // --- LOGIC 2: GPS HANDLER ---
  Future<void> _getGeoLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showMessage("GPS mati. Mohon aktifkan di pengaturan HP.", isError: true);
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    setState(() => isGettingGps = true);

    try {
      Position pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true, 
        timeLimit: const Duration(seconds: 25),
      );

      setState(() {
        form['lat_aktual'] = pos.latitude.toString();
        form['long_aktual'] = pos.longitude.toString();
      });
      _showMessage("Lokasi terkunci.", isError: false);
    } catch (e) {
      Position? lastPos = await Geolocator.getLastKnownPosition();
      if (lastPos != null) {
        setState(() {
          form['lat_aktual'] = lastPos.latitude.toString();
          form['long_aktual'] = lastPos.longitude.toString();
        });
        _showMessage("Sinyal lemah, menggunakan lokasi terakhir.", isError: false, color: Colors.orange);
      } else {
        _showMessage("Gagal mendapatkan lokasi GPS.", isError: true);
      }
    } finally {
      setState(() => isGettingGps = false);
    }
  }

Future<void> _pickImage(bool isBefore, ImageSource source) async {
  final f = await ImagePicker().pickImage(
    source: source, 
    imageQuality: 40,
  );
  
  if (f != null) {
    setState(() =>
        isBefore ? photoBefore = File(f.path) : photoAfter = File(f.path));
  }
}
void _showPickerOptions(bool isBefore) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => SafeArea(
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt, color: Color(0xFF1E88E5)),
            title: const Text('Ambil dari Kamera'),
            onTap: () {
              Navigator.pop(context);
              _pickImage(isBefore, ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library, color: Color(0xFF1E88E5)),
            title: const Text('Pilih dari Galeri'),
            onTap: () {
              Navigator.pop(context);
              _pickImage(isBefore, ImageSource.gallery);
            },
          ),
        ],
      ),
    ),
  );
}


Future<void> _submit() async {
  if (!_formKey.currentState!.validate()) return;
  if (selectedLokasi == null) return _showMessage("Pilih Lokasi!", isError: true);
  if (photoBefore == null) return _showMessage("Foto Before wajib!", isError: true);

  setState(() => isSubmitting = true);

  late Map<String, dynamic> submissionData;

  try {
    submissionData = {
      ...form,
      'id_lokasi': selectedLokasi!.id,
      'id_karyawan': selectedKaryawan?.id,
      'skor_ketinggian': scores['tinggi_level_air'],
      'skor_jarak': scores['jarak_ke_bibir'],
      'skor_aliran': scores['kondisi_aliran'],
      'skor_drainase': scores['kapasitas_drainase'],
      'skor_risiko': scores['risiko'],
      'rata_rata_skor': averageScore,
    };

    final connectivityResult = await Connectivity().checkConnectivity();
    final bool isOnline = !connectivityResult.contains(ConnectivityResult.none);

    if (isOnline) {
      await _apiService.submitWL(submissionData, photoBefore, photoAfter);
      _showMessage("Data Berhasil Terkirim Online!", isError: false);
      await _saveToHistory(submissionData, "Data disimpan di history.");
      _resetForm();
    } else {
      await _saveToOfflineQueue(submissionData, "Data disimpan Offline.");
      _showMessage("Offline: Data disimpan di antrean.", isError: false);
      _resetForm(); 
    }

  } catch (e) {
    String errorMessage = "Terjadi Kesalahan";
    if (e is DioException) {
      final serverMessage = e.response?.data?['message'] ?? e.message;
      errorMessage = "Server Error: $serverMessage";
    } else {
      errorMessage = e.toString();
    }
    _showMessage(errorMessage, isError: true);
    await _saveToOfflineQueue(submissionData, "Gagal kirim, masuk antrean.");
  } finally {
    if (mounted) setState(() => isSubmitting = false);
  }
}
  Future<void> _saveToHistory(Map<String, dynamic> dataPayload, String message) async {
    await _queueService.addToHistory(
      type: 'wl_monitoring',
      data: dataPayload, 
      photoBefore: photoBefore?.path,
      photoAfter: photoAfter?.path,
    );
    _showMessage(message, isError: false);
    _resetForm();
  }
  Future<void> _saveToOfflineQueue(Map<String, dynamic> dataPayload, String message) async {
    await _queueService.addToQueue(
      type: 'wl_monitoring',
      data: dataPayload, 
      photoBefore: photoBefore?.path,
      photoAfter: photoAfter?.path,
    );
    _showMessage(message, isError: false, color: Colors.orange);
    _resetForm();
  }
  void _resetForm() {
    setState(() {
      photoBefore = null;
      photoAfter = null;
      form['nomor_jalur'] = '';
      form['kedalaman_cm'] = '';
      form['jumlah_pokok'] = '';
      form['tipe_objek'] = null; 
      scores.updateAll((key, value) => 0);
    });
    _formKey.currentState?.reset();
  }

  void _showMessage(String msg, {required bool isError, Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: color ?? (isError ? Colors.red : Colors.green)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.blue.shade800, Colors.blue.shade500]),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Rata-rata Skor", style: TextStyle(color: Colors.white, fontSize: 16)),
                    Text(averageScore, style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              
              InfoCard(
                form: form,
                listKaryawan: widget.listKaryawan,
                listLokasi: widget.listLokasi,
                selectedKaryawan: selectedKaryawan,
                selectedAfdeling: selectedAfdeling,
                selectedLokasi: selectedLokasi,
                onKaryawanChanged: (val) => setState(() => selectedKaryawan = val),
                onAfdelingChanged: (val) => setState(() { selectedAfdeling = val; selectedLokasi = null; }),
                onLokasiChanged: (val) => setState(() => selectedLokasi = val),
                onTipeObjekChanged: (val) => setState(() { 
                  form['tipe_objek'] = val; 
                  _calcScore(); 
                }),
              ),
              
              const SizedBox(height: 20),
              
              GpsCard(
                lat: form['lat_aktual'],
                long: form['long_aktual'],
                onTap: isGettingGps ? null : _getGeoLocation,
                isLoading: isGettingGps,
              ),
              
              const SizedBox(height: 20),
              
              DetailForm(
                form: form,
                scores: scores,
                skoringData: widget.skoringData,
                onUpdate: _calcScore,
                onTindakanChanged: (val) => setState(() {
                  form['tindakan'] = val;
                  if (val != 'Eksekusi Rutin') photoAfter = null;
                  _calcScore();
                }),
              ),
              
              const SizedBox(height: 20),
              
              // PHOTO SECTION
              PhotoSection(
                photoBefore: photoBefore,
                photoAfter: photoAfter,
                showAfter: form['tindakan'] == 'Eksekusi Rutin',
             onPickBefore: () => _showPickerOptions(true),
onPickAfter: () => _showPickerOptions(false),
                onClearBefore: () => setState(() => photoBefore = null),
                onClearAfter: () => setState(() => photoAfter = null),
              ),
              
              const SizedBox(height: 30),
                            SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isSubmitting ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    foregroundColor: Colors.white,
                  ),
                  child: isSubmitting
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("SIMPAN OBSERVASI"),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}