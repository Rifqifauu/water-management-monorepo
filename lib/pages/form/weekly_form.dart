import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart'; // Pastikan import Dio

// Sesuaikan path import ini dengan struktur project Anda
import '../../../models/monitoring_model.dart';
import '../../../services/api_service.dart';
import '../../../services/queue_service.dart';

import '../weekly/sections/info_card.dart';
import '../weekly/sections/gps_card.dart';
import '../weekly/sections/detail_form.dart';
import '../weekly/sections/photo_section.dart';

class WeeklyForm extends StatefulWidget {
  final List<SkoringConfig> skoringData;
  final List<KaryawanModel> listKaryawan;
  final List<LokasiModel> listLokasi;

  const WeeklyForm({
    super.key,
    required this.skoringData,
    required this.listKaryawan,
    required this.listLokasi,
  });

  @override
  State<WeeklyForm> createState() => _WeeklyFormState();
}

class _WeeklyFormState extends State<WeeklyForm> {
  final ApiService _apiService = ApiService();
  final QueueService _queueService = QueueService();
  final _formKey = GlobalKey<FormState>();

  // STATE VARIABLES
  bool isSubmitting = false;
  bool isGettingGps = false;

  // DATA SELECTIONS
  KaryawanModel? selectedKaryawan;
  String? selectedAfdeling;
  LokasiModel? selectedLokasi;
  File? photoBefore, photoAfter;

  // FORM DATA (INPUT MENTAH)
  Map<String, dynamic> form = {
    'tanggal': DateFormat('yyyy-MM-dd').format(DateTime.now()),
    'jenis_infrastruktur': null,
    'nomor_jalur': '',
    'id_objek': null,
    'kondisi_aliran': null,
    'penyebab': null,
    'tindakan': null,
    'lat_aktual': '',
    'long_aktual': '',
  };

  Map<String, int> scores = {'aliran': 0, 'penyebab': 0, 'tindakan': 0};

  void _calcScore() {
    int getSkor(String parameter, dynamic value, {bool isNumeric = false}) {
      if (value == null || value.toString().isEmpty) {
        return 0;
      }

      final criteria = widget.skoringData
          .where((s) => s.unit == 'Infrastruktur' && s.parameter == parameter);

      try {
        if (isNumeric) {
          double val = double.tryParse(value.toString()) ?? -1;
          var match = criteria.firstWhere(
            (c) {
              double min = c.minValue ?? -999999;
              double max = c.maxValue ?? 999999;
              return val >= min && val <= max;
            },
            orElse: () => SkoringConfig(unit: '', parameter: '', skor: 0),
          );
          return match.skor;
        } else {
          var match = criteria.firstWhere(
            (c) =>
                c.labelKondisi?.trim().toLowerCase() ==
                value.toString().trim().toLowerCase(),
            orElse: () => SkoringConfig(unit: '', parameter: '', skor: 0),
          );
          return match.skor;
        }
      } catch (e) {
        return 0;
      }
    }

    setState(() {
      scores['aliran'] = getSkor('Aliran', form['kondisi_aliran']);
      scores['penyebab'] = getSkor('Penyebab', form['penyebab']);
      scores['tindakan'] = getSkor('Tindakan', form['tindakan']);
    });
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
        _showMessage("Sinyal lemah, menggunakan lokasi terakhir.",
            isError: false, color: Colors.orange);
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
              leading:
                  const Icon(Icons.photo_library, color: Color(0xFF1E88E5)),
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
    if (selectedLokasi == null) {
      _showMessage("Pilih Lokasi terlebih dahulu!", isError: true);
      return;
    }
    if (photoBefore == null) {
      _showMessage("Foto Before wajib diunggah!", isError: true);
      return;
    }

    setState(() => isSubmitting = true);

    late Map<String, dynamic> submissionData;

    try {
      submissionData = {
        ...form,
        'id_lokasi': selectedLokasi!.id,
        'id_karyawan': selectedKaryawan?.id,
        'skor_aliran': scores['aliran'],
        'skor_penyebab': scores['penyebab'],
        'skor_tindakan': scores['tindakan'],
        'rata_rata_skor': averageScore,
      };

      final connectivityResult = await Connectivity().checkConnectivity();
      final bool isOnline =
          !connectivityResult.contains(ConnectivityResult.none);

      if (isOnline) {
        await _apiService.submitMingguan(
            submissionData, photoBefore, photoAfter);
        _showMessage("Data Berhasil Terkirim Online!", isError: false);
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

  Future<void> _saveToOfflineQueue(
      Map<String, dynamic> dataPayload, String message) async {
    await _queueService.addToQueue(
      type: 'weekly_monitoring',
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
      form['penyebab'] = '';
      form['tindakan'] = '';
      form['jenis_infrastruktur'] = null;
      scores.updateAll((key, value) => 0);
    });
    _formKey.currentState?.reset();
  }

  void _showMessage(String msg, {required bool isError, Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(msg),
          backgroundColor: color ?? (isError ? Colors.red : Colors.green)),
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
              // HEADER SKOR
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue.shade800, Colors.blue.shade500]),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Rata-rata Skor",
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                    Text(averageScore,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold)),
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
                onKaryawanChanged: (val) =>
                    setState(() => selectedKaryawan = val),
                onAfdelingChanged: (val) => setState(() {
                  selectedAfdeling = val;
                  selectedLokasi = null;
                }),
                onLokasiChanged: (val) => setState(() => selectedLokasi = val),
                onTipeObjekChanged: (val) => setState(() {
                  form['jenis_infrastruktur'] = val;
                  _calcScore();
                }),
              ),

              const SizedBox(height: 20),

              // GPS CARD
              GpsCard(
                lat: form['lat_aktual'],
                long: form['long_aktual'],
                onTap: isGettingGps ? null : _getGeoLocation,
                isLoading: isGettingGps,
              ),

              const SizedBox(height: 20),

              // DETAIL FORM
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
