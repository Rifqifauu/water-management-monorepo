import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../models/monitoring_model.dart';
import 'api_service.dart';

class MasterDataService {
  static final MasterDataService _instance = MasterDataService._internal();
  static Database? _database;
  final ApiService _apiService = ApiService();

  factory MasterDataService() => _instance;
  MasterDataService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, 'master_data.db');
    
    print("📂 [DB INIT] Path Database: $path");

    return await openDatabase(
      path, 
      version: 1, 
      onCreate: (db, version) async {
        print("✨ [DB CREATE] Membuat tabel master_cache baru...");
        await db.execute('CREATE TABLE master_cache (key TEXT PRIMARY KEY, value TEXT)');
      }
    );
  }

  // --- FUNGSI SYNC (Download & Simpan) ---
  Future<void> syncMasterData() async {
    try {
      print("🔄 [SYNC] Memulai download data dari API...");
      
      // 1. Download dari API
      final data = await _apiService.fetchAllMasterData();
      
      // DEBUG: Cek apa yang didapat dari API
      print("📥 [API] Karyawan: ${(data['karyawan'] as List).length} item");
      print("📥 [API] Lokasi: ${(data['lokasi'] as List).length} item");
      print("📥 [API] Skoring: ${(data['skoring'] as List).length} item");

      final db = await database;
      final batch = db.batch();

      print("💾 [DB] Mulai menyimpan ke SQLite...");

      // 2. Simpan ke SQLite sebagai JSON String
      // Encode List/Map menjadi String agar bisa masuk ke kolom TEXT
      batch.insert('master_cache', {'key': 'karyawan', 'value': jsonEncode(data['karyawan'])}, conflictAlgorithm: ConflictAlgorithm.replace);
      batch.insert('master_cache', {'key': 'lokasi', 'value': jsonEncode(data['lokasi'])}, conflictAlgorithm: ConflictAlgorithm.replace);
      batch.insert('master_cache', {'key': 'skoring', 'value': jsonEncode(data['skoring'])}, conflictAlgorithm: ConflictAlgorithm.replace);
      
      await batch.commit();
      print("✅ [SYNC SUCCESS] Master Data berhasil disimpan di Local DB!");
    } catch (e) {
      print("❌ [SYNC ERROR] Gagal Sync: $e");
      rethrow; 
    }
  }

  // --- FUNGSI GET (Untuk UI Offline) ---
  
  Future<List<KaryawanModel>> getKaryawan() async {
    try {
      final db = await database;
      print("🔍 [READ] Mengambil data Karyawan dari DB...");
      final maps = await db.query('master_cache', where: 'key = ?', whereArgs: ['karyawan']);
      
      if (maps.isNotEmpty) {
        String rawJson = maps.first['value'] as String;
        // print("📄 [RAW] JSON Karyawan (potongan): ${rawJson.substring(0, 50)}..."); 
        
        final List<dynamic> jsonList = jsonDecode(rawJson);
        final list = jsonList.map((e) => KaryawanModel.fromJson(e)).toList();
        
        print("✅ [READ] Berhasil load ${list.length} Karyawan.");
        return list;
      } else {
        print("⚠️ [READ] Data Karyawan KOSONG di DB.");
        return [];
      }
    } catch (e) {
      print("❌ [READ ERROR] Gagal load Karyawan: $e");
      return [];
    }
  }

  Future<List<LokasiModel>> getLokasi() async {
    try {
      final db = await database;
      print("🔍 [READ] Mengambil data Lokasi dari DB...");
      final maps = await db.query('master_cache', where: 'key = ?', whereArgs: ['lokasi']);
      
      if (maps.isNotEmpty) {
        String rawJson = maps.first['value'] as String;
        final List<dynamic> jsonList = jsonDecode(rawJson);
        final list = jsonList.map((e) => LokasiModel.fromJson(e)).toList();
        
        print("✅ [READ] Berhasil load ${list.length} Lokasi.");
        return list;
      } else {
        print("⚠️ [READ] Data Lokasi KOSONG di DB.");
        return [];
      }
    } catch (e) {
      print("❌ [READ ERROR] Gagal load Lokasi: $e");
      return [];
    }
  }

  Future<List<SkoringConfig>> getSkoring() async {
    try {
      final db = await database;
      print("🔍 [READ] Mengambil data Skoring dari DB...");
      final maps = await db.query('master_cache', where: 'key = ?', whereArgs: ['skoring']);
      
      if (maps.isNotEmpty) {
        String rawJson = maps.first['value'] as String;
        final List<dynamic> jsonList = jsonDecode(rawJson);
        final list = jsonList.map((e) => SkoringConfig.fromJson(e)).toList();
        
        print("✅ [READ] Berhasil load ${list.length} Skoring.");
        return list;
      } else {
        print("⚠️ [READ] Data Skoring KOSONG di DB.");
        return [];
      }
    } catch (e) {
      print("❌ [READ ERROR] Gagal load Skoring: $e");
      return [];
    }
  }
  
  Future<bool> hasData() async {
    final db = await database;
    final count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM master_cache'));
    print("📊 [STATUS] Jumlah key di cache: $count");
    return (count ?? 0) >= 3; 
  }
}