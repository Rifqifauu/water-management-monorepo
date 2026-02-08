import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart'; // Diperlukan untuk debugPrint

class ApiService {
  // Konfigurasi Client Dio
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://api.palmwateros-tap.com/api/',
    connectTimeout: const Duration(seconds: 30), // Diperpanjang ke 30s untuk koneksi lambat
    receiveTimeout: const Duration(seconds: 30),
    responseType: ResponseType.json,
  ));

  // ===========================================================================
  // MASTER DATA
  // ===========================================================================
  
  Future<Map<String, dynamic>> fetchAllMasterData() async {
    try {
      debugPrint("📡 Fetching Master Data...");
      final responses = await Future.wait([
        _dio.get('list/karyawan'),
        _dio.get('list/lokasi'),
        _dio.get('skoring'),
        _dio.get('list/water-level-master'),
        _dio.get('list/infrastructure-master')
      ]);

      debugPrint("✅ Master Data Downloaded");
      return {
        'karyawan': responses[0].data,
        'lokasi': responses[1].data,
        'skoring': responses[2].data,
        'waterLevelMaster': responses[3].data,
        'infrastructureMaster': responses[4].data,
      };
    } catch (e) {
      debugPrint("❌ Error Fetch Master Data: $e");
      throw Exception("Gagal download master data: $e");
    }
  }

  // ===========================================================================
  // SUBMIT FUNCTIONS (Public)
  // ===========================================================================

  Future<bool> submitHarian(Map<String, dynamic> form, File? photoBefore, File? photoAfter) async {
    return await _submitData('monitoring-harian', form, photoBefore, photoAfter);
  }

  Future<bool> submitMingguan(Map<String, dynamic> form, File? photoBefore, File? photoAfter) async {
    return await _submitData('monitoring-mingguan', form, photoBefore, photoAfter);
  }

  Future<bool> submitWL(Map<String, dynamic> form, File? photoBefore, File? photoAfter) async {
    return await _submitData('water-level', form, photoBefore, photoAfter);
  }

  // ===========================================================================
  // HELPER FUNCTION (Private - Core Logic)
  // ===========================================================================

  /// Fungsi generik untuk menangani pengiriman data + foto agar tidak duplikasi kode
  Future<bool> _submitData(
    String endpoint, 
    Map<String, dynamic> form, 
    File? photoBefore, 
    File? photoAfter
  ) async {
    try {
      debugPrint("-------------------------------------------------");
      debugPrint("🚀 SENDING TO: $endpoint");
      debugPrint("📝 Form Data: $form");

      // 1. Buat FormData dari Map dasar
      FormData formData = FormData.fromMap(form);

      // 2. Handle Foto 'Before' (Key: foto_path)
      if (photoBefore != null) {
        if (await photoBefore.exists()) {
          debugPrint("📸 Attach Photo Before: ${photoBefore.path}");
          formData.files.add(MapEntry(
            'foto_path', // Pastikan key ini sesuai Backend
            await MultipartFile.fromFile(photoBefore.path, filename: 'before.jpg'),
          ));
        } else {
          debugPrint("⚠️ File Photo Before tidak ditemukan di storage HP (Path invalid).");
        }
      }

      // 3. Handle Foto 'After' (Key: foto_after)
      if (photoAfter != null) {
        if (await photoAfter.exists()) {
          debugPrint("📸 Attach Photo After: ${photoAfter.path}");
          formData.files.add(MapEntry(
            'foto_after', // Pastikan key ini sesuai Backend
            await MultipartFile.fromFile(photoAfter.path, filename: 'after.jpg'),
          ));
        } else {
          debugPrint("⚠️ File Photo After tidak ditemukan di storage HP.");
        }
      }

      // 4. Eksekusi Request POST
      final response = await _dio.post(endpoint, data: formData);

      // 5. Cek Response Sukses
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("✅ SUCCESS [$endpoint]: ID ${response.data['id'] ?? 'OK'}");
        return true;
      } else {
        debugPrint("⚠️ FAILED [$endpoint]: Status Code ${response.statusCode}");
        return false;
      }

    } on DioException catch (e) {
      // 6. Penanganan Error Spesifik Dio (Server, Timeout, dll)
      debugPrint("❌ DIO ERROR di $endpoint");
      debugPrint("➤ Type: ${e.type}");
      debugPrint("➤ Message: ${e.message}");
      
      if (e.response != null) {
        debugPrint("➤ Status: ${e.response?.statusCode}");
        debugPrint("➤ Data: ${e.response?.data}"); // Ini akan menampilkan pesan validasi dari server
        throw Exception("Server Error (${e.response?.statusCode}): ${e.response?.data}");
      } else {
        throw Exception("Koneksi Error: ${e.message}");
      }
    } catch (e) {
      debugPrint("❌ UNKNOWN ERROR di $endpoint: $e");
      throw Exception("Error tidak diketahui: $e");
    }
  }
}