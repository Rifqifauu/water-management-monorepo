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
import '../weekly/sections/info_card.dart';
import '../weekly/sections/gps_card.dart';
import '../weekly/sections/detail_form.dart';
import '../weekly/sections/photo_section.dart';

class WeeklyForm extends StatefulWidget {
  final List<SkoringConfig> skoringData;
  final List<KaryawanModel> listKaryawan;
  final List<LokasiModel> listLokasi;
  final List<InfrastructureMaster> infrastructureMasterData;
  final InfrastructureMaster? initialInfrastructure;
  const WeeklyForm({
    super.key,
    required this.skoringData,
    required this.listKaryawan,
    required this.listLokasi,
    required this.infrastructureMasterData,
    this.initialInfrastructure,
  });

  @override
  State<WeeklyForm> createState() => _WeeklyFormState();
}

class _WeeklyFormState extends State<WeeklyForm> {
  final ApiService _apiService = ApiService();
  final QueueService _queueService = QueueService();
  final _formKey = GlobalKey<FormState>();
  bool isSubmitting = false;
  bool isGettingGps = false;
  KaryawanModel? selectedKaryawan;
  String? selectedAfdeling;
  LokasiModel? selectedLokasi;
  InfrastructureMaster? selectedInfrastructureMaster;

  File? photoBefore, photoAfter;

  Map<String, dynamic> form = {
    'tanggal': DateFormat('yyyy-MM-dd').format(DateTime.now()),
    'jenis_infrastruktur': null,
    'nomor_jalur': '', // Jika tidak dipakai, biarkan kosong
    'id_objek': null, // ID Infrastruktur
    'kondisi_aliran': null,
    'penyebab': null,
    'tindakan': null,
    'lat_aktual': '',
    'long_aktual': '',
  };

  Map<String, double> distanceMap = {};

  List<InfrastructureMaster> get filteredInfrastructures {
    List<InfrastructureMaster> data =
        List.from(widget.infrastructureMasterData);

    if (selectedLokasi != null) {
      data = data.where((item) {
        return item.id_lokasi.toString() == selectedLokasi!.id.toString();
      }).toList();
    }

    if (form['lat_aktual'] != null &&
        form['lat_aktual'].toString().isNotEmpty &&
        form['long_aktual'] != null &&
        form['long_aktual'].toString().isNotEmpty) {
      try {
        double userLat = double.parse(
            form['lat_aktual'].toString().replaceAll(',', '.').trim());
        double userLong = double.parse(
            form['long_aktual'].toString().replaceAll(',', '.').trim());

        debugPrint("\n=== 📍 MULAI KALKULASI & SORTING JARAK ===");
        debugPrint("Koordinat User Aktual: Lat $userLat, Long $userLong");

        distanceMap.clear();

        for (var item in data) {
          double dist = _calculateDistance(
              userLat, userLong, item.latitude, item.longitude);

          distanceMap[item.id.toString()] = dist;

          String distanceText = dist == 999999999.0
              ? 'Tidak valid/Kosong'
              : '${dist.toStringAsFixed(2)} meter';

          debugPrint(
              "🚗 ID: ${item.id} | Kat: ${item.category} | Lat: ${item.latitude}, Long: ${item.longitude} | Jarak: $distanceText");
        }

        data.sort((a, b) {
          double distA = distanceMap[a.id.toString()] ?? 999999999.0;
          double distB = distanceMap[b.id.toString()] ?? 999999999.0;
          return distA.compareTo(distB);
        });

        debugPrint("=== ✅ SORTING LOKASI SELESAI ===\n");
      } catch (e) {
        debugPrint("❌ Error saat sorting distance: $e");
      }
    }

    return data;
  }

  double _calculateDistance(
      double startLat, double startLng, String? endLatStr, String? endLngStr) {
    if (endLatStr == null ||
        endLngStr == null ||
        endLatStr.trim().isEmpty ||
        endLngStr.trim().isEmpty) {
      return 999999999.0;
    }
    try {
      double endLat = double.parse(endLatStr.replaceAll(',', '.').trim());
      double endLng = double.parse(endLngStr.replaceAll(',', '.').trim());
      return Geolocator.distanceBetween(startLat, startLng, endLat, endLng);
    } catch (e) {
      // Tambahkan info titik koordinat mana yang bikin error
      debugPrint(
          "⚠️ Error parsing koordinat infrastruktur (Lat: $endLatStr, Long: $endLngStr): $e");
      return 999999999.0;
    }
  }

  Map<String, int> scores = {'aliran': 0, 'penyebab': 0, 'tindakan': 0};
  @override
  void initState() {
    super.initState();
    if (widget.initialInfrastructure != null) {
      selectedInfrastructureMaster = widget.initialInfrastructure;
    }
  }

  void _calcScore() {
    int getSkor(String parameter, dynamic value) {
      if (value == null || value.toString().isEmpty) return 0;
      final criteria = widget.skoringData.where((s) =>
          (s.unit == 'Infrastruktur' ||
              s.unit == form['jenis_infrastruktur']) &&
          s.parameter == parameter);
      if (criteria.isEmpty) return 0;
      try {
        var match = criteria.firstWhere(
          (c) =>
              c.labelKondisi?.trim().toLowerCase() ==
              value.toString().trim().toLowerCase(),
          orElse: () => SkoringConfig(unit: '', parameter: '', skor: 0),
        );
        return match.skor;
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
        timeLimit: const Duration(seconds: 15),
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
        _showMessage("Gagal lock GPS akurat. Menggunakan lokasi terakhir.",
            isError: false, color: Colors.orange);
      } else {
        _showMessage("Gagal mendapatkan lokasi GPS.", isError: true);
      }
    } finally {
      setState(() => isGettingGps = false);
    }
  }

  Future<void> _pickImage(bool isBefore, ImageSource source) async {
    try {
      final f = await ImagePicker().pickImage(
        source: source,
        imageQuality: 30, // Kompresi agar ringan
      );

      if (f != null) {
        setState(() =>
            isBefore ? photoBefore = File(f.path) : photoAfter = File(f.path));
      }
    } catch (e) {
      _showMessage("Gagal mengambil foto: $e", isError: true);
    }
  }

  void _showPickerOptions(bool isBefore) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.blue),
              title: const Text('Ambil dari Kamera'),
              onTap: () {
                Navigator.pop(context);
                _pickImage(isBefore, ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.green),
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
      _showMessage("Pilih Lokasi (Blok) terlebih dahulu!", isError: true);
      return;
    }
    if (selectedInfrastructureMaster == null) {
      _showMessage("Pilih No Infrastructure terlebih dahulu!", isError: true);
      return;
    }
    if (photoBefore == null) {
      _showMessage("Foto Kondisi (Before) wajib diunggah!", isError: true);
      return;
    }
    setState(() => isSubmitting = true);
    Map<String, dynamic> submissionData = {};
    try {
      submissionData = {
        ...form, // Spread form data mentah
        'id_lokasi': selectedLokasi!.id,
        'id_karyawan': selectedKaryawan?.id,
        'id_infrastruktur': selectedInfrastructureMaster?.id, // Kirim ID
        'jenis_infrastruktur': selectedInfrastructureMaster?.category,
        'skor_aliran': scores['aliran'],
        'skor_penyebab': scores['penyebab'],
        'skor_tindakan': scores['tindakan'],
        'rata_rata_skor': averageScore,
        'submitted_at': DateTime.now().toIso8601String(),
      };
      final connectivityResult = await Connectivity().checkConnectivity();
      final bool isOnline =
          !connectivityResult.contains(ConnectivityResult.none);
      if (isOnline) {
        await _apiService.submitMingguan(
            submissionData, photoBefore, photoAfter);
        _showMessage("Data Berhasil Terkirim!", isError: false);
        await _saveToHistory(submissionData);
      } else {
        await _saveToOfflineQueue(submissionData);
        _showMessage("Offline: Data disimpan di antrean.",
            isError: false, color: Colors.orange);
      }
      _resetForm();
    } catch (e) {
      String errorMessage = "Terjadi Kesalahan";
      if (e is DioException) {
        errorMessage =
            "Server Error: ${e.response?.data?['message'] ?? e.message}";
      } else {
        errorMessage = e.toString();
      }
      _showMessage(errorMessage, isError: true);
    } finally {
      if (mounted) setState(() => isSubmitting = false);
    }
  }

  Future<void> _saveToHistory(Map<String, dynamic> dataPayload) async {
    await _queueService.addToHistory(
      type: 'weekly_monitoring',
      data: dataPayload,
      photoBefore: photoBefore?.path,
      photoAfter: photoAfter?.path,
    );
  }

  Future<void> _saveToOfflineQueue(Map<String, dynamic> dataPayload) async {
    await _queueService.addToQueue(
      type: 'weekly_monitoring',
      data: dataPayload,
      photoBefore: photoBefore?.path,
      photoAfter: photoAfter?.path,
    );
  }

  void _resetForm() {
    setState(() {
      photoBefore = null;
      photoAfter = null;
      form['penyebab'] = null;
      form['tindakan'] = null;
      form['kondisi_aliran'] = null;
      scores.updateAll((key, value) => 0);
    });
    _formKey.currentState?.reset();
  }

  void _showMessage(String msg, {required bool isError, Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: color ?? (isError ? Colors.red : Colors.green),
        duration: const Duration(seconds: 3),
      ),
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
              _buildScoreHeader(),
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
                  selectedInfrastructureMaster = null;
                }),
                onLokasiChanged: (val) => setState(() {
                  selectedLokasi = val;
                  selectedInfrastructureMaster = null;
                }),
                onTipeObjekChanged: (_) {},
              ),
              const SizedBox(height: 20),
              GpsCard(
                lat: form['lat_aktual'],
                long: form['long_aktual'],
                isLoading: isGettingGps,
                onTap: isGettingGps ? null : _getGeoLocation,
                onLatChanged: (val) {
                  setState(() {
                    form['lat_aktual'] = val;
                  });
                },
                onLongChanged: (val) {
                  setState(() {
                    form['long_aktual'] = val;
                  });
                },
              ),
              const SizedBox(height: 20),
            DetailForm(
  form: form,
  scores: scores,
  skoringData: widget.skoringData,                
  infrastructureMasterData: filteredInfrastructures, 
  distanceMap: distanceMap, 
  selectedInfrastructureMaster: selectedInfrastructureMaster,
  onInfrastructureMasterChanged: (master) {
                  setState(() {
                    selectedInfrastructureMaster = master;
                    if (master != null) {
                      form['jenis_infrastruktur'] = master.category;
                      form['id_objek'] = master.id_object;
                      form['kondisi_aliran'] = null;
                      form['penyebab'] = null;
                    }
                  });
                  _calcScore();
                },
                onUpdate: _calcScore,
                onTindakanChanged: (val) => setState(() {
                  form['tindakan'] = val;
                  if (val != 'Eksekusi Rutin') {
                    photoAfter = null;
                  }
                  _calcScore();
                }),
              ),
              const SizedBox(height: 20),
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 3,
                  ),
                  child: isSubmitting
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                              color: Colors.white, strokeWidth: 2))
                      : const Text("SIMPAN OBSERVASI",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScoreHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blue.shade800, Colors.blue.shade500]),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.blue.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Rata-rata Skor",
              style: TextStyle(color: Colors.white, fontSize: 16)),
          Text(
            averageScore,
            style: const TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
