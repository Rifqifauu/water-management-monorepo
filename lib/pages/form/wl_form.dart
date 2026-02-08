import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

// --- IMPORT MODELS & SERVICES (Sesuaikan path) ---
import '../../../models/monitoring_model.dart';
// import '../../../models/water_level_master.dart'; // Pastikan WaterLevelMaster diimport
import '../../../services/api_service.dart';
import '../../../services/queue_service.dart';

// --- IMPORT SECTIONS ---
import '../water_level/sections/info_card.dart';
import '../water_level/sections/gps_card.dart';
import '../water_level/sections/detail_form.dart';
import '../water_level/sections/photo_section.dart';

class WaterLevelForm extends StatefulWidget {
  final List<SkoringConfig> skoringData;
  final List<KaryawanModel> listKaryawan;
  final List<LokasiModel> listLokasi;
  final List<WaterLevelMaster> waterLevelMasterData;
  
  // Opsional: Jika ada inisialisasi awal (misal dari draft)
  final WaterLevelMaster? initialWaterLevel;

  const WaterLevelForm({
    super.key,
    required this.skoringData,
    required this.listKaryawan,
    required this.listLokasi,
    required this.waterLevelMasterData,
    this.initialWaterLevel,
  });

  @override
  State<WaterLevelForm> createState() => _WaterLevelFormState();
}

class _WaterLevelFormState extends State<WaterLevelForm> {
  final ApiService _apiService = ApiService();
  final QueueService _queueService = QueueService();
  final _formKey = GlobalKey<FormState>();

  // --- STATE VARIABLES ---
  bool isSubmitting = false;
  bool isGettingGps = false;

  // Dropdown States
  KaryawanModel? selectedKaryawan;
  String? selectedAfdeling;
  LokasiModel? selectedLokasi;
  WaterLevelMaster? selectedWaterLevelMaster; // <--- PENTING

  File? photoBefore, photoAfter;

  // --- FORM DATA ---
  Map<String, dynamic> form = {
    'tanggal': DateFormat('yyyy-MM-dd').format(DateTime.now()),
    'no_water_level': '', // Hanya string untuk display/api
    'id_objek': null,     // ID Water Level
    'tinggi_level_air': null,
    'kondisi_aliran': null,
    'jarak_ke_bibir': null,
    'kapasitas_drainase': null,
    'risiko': null,
    'tindakan': null,
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
List<WaterLevelMaster> get filteredWaterLevels {
    List<WaterLevelMaster> data = List.from(widget.waterLevelMasterData);

    if (selectedLokasi != null) {
      final selectedId = selectedLokasi!.id.toString().trim();
      
      data = data.where((item) {
        String itemId = item.id_lokasi?.toString().trim() ?? '';

        if (itemId.isEmpty || itemId == 'null') {
           // Pastikan model WaterLevelMaster Anda punya field 'lokasi'
           // Jika tidak punya, hapus blok if ini.
           try {
             // Asumsi di model ada: final LokasiModel? lokasi;
             itemId = (item as dynamic).lokasi?.id?.toString().trim() ?? '';
           } catch (e) {
             // Abaikan jika tidak ada
           }
        }

        // Debugging: Lihat di console apa yang dibandingkan
        // Hapus baris ini nanti jika sudah fix
        print("Comparing Item: '$itemId' vs Selected: '$selectedId'");

        return itemId == selectedId;
      }).toList();
    }

    if (form['lat_aktual'] != '' && form['long_aktual'] != '') {
      try {
        double userLat = double.parse(form['lat_aktual']);
        double userLong = double.parse(form['long_aktual']);

        data.sort((a, b) {
          double distA = _calculateDistance(userLat, userLong, a.latitude, a.longitude);
          double distB = _calculateDistance(userLat, userLong, b.latitude, b.longitude);
          return distA.compareTo(distB);
        });
      } catch (e) {
        debugPrint("Error sorting distance: $e");
      }
    }

    return data;
  }
  double _calculateDistance(double startLat, double startLng, String? endLatStr, String? endLngStr) {
    if (endLatStr == null || endLngStr == null || endLatStr.isEmpty || endLngStr.isEmpty) {
      return double.infinity; // Taruh paling bawah jika tidak ada koordinat
    }
    try {
      double endLat = double.parse(endLatStr);
      double endLng = double.parse(endLngStr);
      return Geolocator.distanceBetween(startLat, startLng, endLat, endLng);
    } catch (e) {
      return double.infinity;
    }
  }
  @override
  void initState() {
    super.initState();
    if (widget.initialWaterLevel != null) {
      selectedWaterLevelMaster = widget.initialWaterLevel;
      form['no_water_level'] = widget.initialWaterLevel!.no_wl;
      form['id_objek'] = widget.initialWaterLevel!.id;
    }
  }

  // --- HELPER: HITUNG SKOR ---
  void _calcScore() {
    int getSkor(String parameter, dynamic value, {bool isNumeric = false}) {
      if (value == null || value.toString().isEmpty) return 0;

      final criteriaList = widget.skoringData.where((s) =>
          s.unit == 'Water Level' && s.parameter.trim().toLowerCase() == parameter.trim().toLowerCase()
      ).toList();

      if (criteriaList.isEmpty) return 0;

      try {
        if (isNumeric) {
          // Bersihkan input (ganti koma jadi titik)
          String cleanValue = value.toString().replaceAll(',', '.');
          double val = double.tryParse(cleanValue) ?? -9999;
          
          // Cari range yang cocok
          for (var c in criteriaList) {
            double min = c.minValue ?? -999999;
            double max = c.maxValue ?? 999999;
            if (val >= min && val <= max) return c.skor;
          }
          return 0; // Tidak masuk range manapun
        } else {
          // String Matching
          var match = criteriaList.firstWhere(
            (c) => c.labelKondisi?.trim().toLowerCase() == value.toString().trim().toLowerCase(),
            orElse: () => SkoringConfig(unit: '', parameter: '', skor: 0),
          );
          return match.skor;
        }
      } catch (e) {
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
  }

  String get averageScore {
    List<int> activeScores = scores.values.where((s) => s > 0).toList();
    if (activeScores.isEmpty) return "0.00";
    double sum = activeScores.fold(0, (prev, curr) => prev + curr);
    return (sum / activeScores.length).toStringAsFixed(2);
  }

  // --- LOGIC: GPS ---
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
        timeLimit: const Duration(seconds: 20),
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

  // --- LOGIC: CAMERA ---
  Future<void> _pickImage(bool isBefore, ImageSource source) async {
    try {
      final f = await ImagePicker().pickImage(
        source: source,
        imageQuality: 30, // Kompres
      );

      if (f != null) {
        setState(() => isBefore ? photoBefore = File(f.path) : photoAfter = File(f.path));
      }
    } catch (e) {
      _showMessage("Gagal mengambil foto: $e", isError: true);
    }
  }

  void _showPickerOptions(bool isBefore) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.blue),
              title: const Text('Ambil dari Kamera'),
              onTap: () { Navigator.pop(context); _pickImage(isBefore, ImageSource.camera); },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.green),
              title: const Text('Pilih dari Galeri'),
              onTap: () { Navigator.pop(context); _pickImage(isBefore, ImageSource.gallery); },
            ),
          ],
        ),
      ),
    );
  }

  // --- LOGIC: SUBMIT ---
  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    
    // Validasi Manual
    if (selectedLokasi == null) {
      _showMessage("Pilih Lokasi terlebih dahulu!", isError: true);
      return;
    }
    if (selectedWaterLevelMaster == null) {
      _showMessage("Pilih No Water Level terlebih dahulu!", isError: true);
      return;
    }
    if (photoBefore == null) {
      _showMessage("Foto Kondisi (Before) wajib diunggah!", isError: true);
      return;
    }

    setState(() => isSubmitting = true);

    // Deklarasi di luar try agar bisa diakses catch/finally
    Map<String, dynamic> submissionData = {};

    try {
      submissionData = {
        ...form, // Spread form data
        'id_lokasi': selectedLokasi!.id,
        'id_karyawan': selectedKaryawan?.id,
        'id_water_level': selectedWaterLevelMaster?.id, // ID Object
        'no_water_level': selectedWaterLevelMaster?.no_wl,
        
        // Skor-skor
        'skor_ketinggian': scores['tinggi_level_air'],
        'skor_jarak': scores['jarak_ke_bibir'],
        'skor_aliran': scores['kondisi_aliran'],
        'skor_drainase': scores['kapasitas_drainase'],
        'skor_risiko': scores['risiko'],
        'rata_rata_skor': averageScore,
        'submitted_at': DateTime.now().toIso8601String(),
      };

      final connectivityResult = await Connectivity().checkConnectivity();
      final bool isOnline = !connectivityResult.contains(ConnectivityResult.none);

      if (isOnline) {
        // KIRIM ONLINE
        await _apiService.submitWL(submissionData, photoBefore, photoAfter);
        _showMessage("Data Berhasil Terkirim Online!", isError: false);
        await _saveToHistory(submissionData);
      } else {
        // SIMPAN OFFLINE
        await _saveToOfflineQueue(submissionData);
        _showMessage("Offline: Data disimpan di antrean.", isError: false, color: Colors.orange);
      }

      _resetForm();

    } catch (e) {
      String errorMessage = "Terjadi Kesalahan";
      if (e is DioException) {
        errorMessage = "Server Error: ${e.response?.data?['message'] ?? e.message}";
      } else {
        errorMessage = e.toString();
      }
      
      _showMessage(errorMessage, isError: true);
      
      // Opsional: Simpan ke offline jika gagal kirim (tergantung kebutuhan)
      // await _saveToOfflineQueue(submissionData); 
    } finally {
      if (mounted) setState(() => isSubmitting = false);
    }
  }

  Future<void> _saveToHistory(Map<String, dynamic> dataPayload) async {
    await _queueService.addToHistory(
      type: 'wl_monitoring',
      data: dataPayload,
      photoBefore: photoBefore?.path,
      photoAfter: photoAfter?.path,
    );
  }

  Future<void> _saveToOfflineQueue(Map<String, dynamic> dataPayload) async {
    await _queueService.addToQueue(
      type: 'wl_monitoring',
      data: dataPayload,
      photoBefore: photoBefore?.path,
      photoAfter: photoAfter?.path,
    );
  }

  void _resetForm() {
    setState(() {
      photoBefore = null;
      photoAfter = null;
      
      // Reset Field
      form['tinggi_level_air'] = null;
      form['jarak_ke_bibir'] = null;
      form['kondisi_aliran'] = null;
      form['kapasitas_drainase'] = null;
      form['risiko'] = null;
      form['tindakan'] = null;
      
      // Reset selected object? Tergantung flow user.
      // selectedWaterLevelMaster = null; 
      // form['no_water_level'] = '';

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

  // --- UI BUILD ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // 1. HEADER SCORE
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Colors.blue.shade800, Colors.blue.shade500]),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.blue.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))
                  ],
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

// 2. INFO CARD (Lokasi & Karyawan)
              InfoCard(
                form: form,
                listKaryawan: widget.listKaryawan,
                listLokasi: widget.listLokasi,
                selectedKaryawan: selectedKaryawan,
                selectedAfdeling: selectedAfdeling,
                selectedLokasi: selectedLokasi,
                onKaryawanChanged: (val) => setState(() => selectedKaryawan = val),
                
                // RESET SAAT AFDELING BERUBAH
                onAfdelingChanged: (val) => setState(() {
                  selectedAfdeling = val;
                  selectedLokasi = null;
                  selectedWaterLevelMaster = null; // Reset item terpilih
                }),
                
                // RESET SAAT LOKASI BERUBAH
                onLokasiChanged: (val) => setState(() {
                  selectedLokasi = val;
                  selectedWaterLevelMaster = null; // Reset item terpilih agar user memilih ulang dari list baru
                }),
                onTipeObjekChanged: (_) {},
              ),

              const SizedBox(height: 20),

              // 3. GPS CARD
              GpsCard(
                lat: form['lat_aktual'],
                long: form['long_aktual'],
                onTap: isGettingGps ? null : _getGeoLocation, // Saat GPS update, list otomatis terurut ulang
                isLoading: isGettingGps,
              ),

              const SizedBox(height: 20),

              // 4. DETAIL FORM
              DetailForm(
                form: form,
                scores: scores,
                skoringData: widget.skoringData,
                
                // PERUBAHAN DISINI: Gunakan 'filteredWaterLevels'
                waterLevelMasterData: filteredWaterLevels,
                
                selectedWaterLevelMaster: selectedWaterLevelMaster,                 
                onWaterLevelMasterChanged: (master) {
                  setState(() {
                    selectedWaterLevelMaster = master;
                    if (master != null) {
                      form['no_water_level'] = master.no_wl;
                      form['id_objek'] = master.id;
                      // Reset nilai lain jika perlu
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

              // 5. PHOTO SECTION
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

              // 6. SUBMIT BUTTON
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isSubmitting ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: isSubmitting
                      ? const SizedBox(
                          height: 24, 
                          width: 24, 
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                        )
                      : const Text("SIMPAN OBSERVASI", style: TextStyle(fontWeight: FontWeight.bold)),
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