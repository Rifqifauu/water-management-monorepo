import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class QueueService {
  static final QueueService _instance = QueueService._internal();
  static Database? _database;

  factory QueueService() => _instance;
  QueueService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "offline_queue.db");
    
    print("📂 [QUEUE DB] Path Database: $path");

    return await openDatabase(
      path,
      version: 2, // PENTING: Versi dinaikkan ke 2 untuk memicu onUpgrade
      onCreate: (db, version) async {
        print("✨ [QUEUE DB] Membuat Tabel 'queue' baru...");
        await db.execute('''
          CREATE TABLE queue (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            type TEXT,
            payload TEXT,
            photo_before_path TEXT,
            photo_after_path TEXT,
            is_synced INTEGER DEFAULT 0, 
            created_at TEXT
          )
        ''');
        print("✅ [QUEUE DB] Tabel berhasil dibuat!");
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          print("🔄 [QUEUE DB] Melakukan upgrade database ke versi 2...");
          await db.execute("ALTER TABLE queue ADD COLUMN is_synced INTEGER DEFAULT 0");
          print("✅ [QUEUE DB] Upgrade selesai. Kolom 'is_synced' ditambahkan.");
        }
      },
    );
  }

  Future<int> addToQueue({
    required String type,
    required Map<String, dynamic> data,
    String? photoBefore,
    String? photoAfter,
  }) async {
    try {
      final db = await database;
      print("💾 [QUEUE] Mencoba menyimpan data...");
      String? savedBefore = await _saveToPermanentStorage(photoBefore);
      String? savedAfter = await _saveToPermanentStorage(photoAfter);

      int id = await db.insert('queue', {
        'type': type,
        'payload': jsonEncode(data),
        'photo_before_path': savedBefore,
        'photo_after_path': savedAfter,
        'is_synced': 0, 
        'created_at': DateTime.now().toIso8601String(),
      });

      print("✅ [QUEUE] Berhasil disimpan! ID Antrean: $id");
      return id;
    } catch (e) {
      print("❌ [QUEUE ERROR] Gagal menyimpan: $e");
      rethrow;
    }
  }
  Future<int> addToHistory({
    required String type,
    required Map<String, dynamic> data,
    String? photoBefore,
    String? photoAfter,
  }) async {
    try {
      final db = await database;
      print("💾 [QUEUE] Mencoba menyimpan data...");
      String? savedBefore = await _saveToPermanentStorage(photoBefore);
      String? savedAfter = await _saveToPermanentStorage(photoAfter);

      int id = await db.insert('queue', {
        'type': type,
        'payload': jsonEncode(data),
        'photo_before_path': savedBefore,
        'photo_after_path': savedAfter,
        'is_synced': 1, 
        'created_at': DateTime.now().toIso8601String(),
      });

      print("✅ [QUEUE] Berhasil disimpan! ID Antrean: $id");
      return id;
    } catch (e) {
      print("❌ [QUEUE ERROR] Gagal menyimpan: $e");
      rethrow;
    }
  }
  Future<List<Map<String, dynamic>>> getUnsyncedItems() async {
    try {
      final db = await database;
      var res = await db.query(
        'queue', 
        where: 'is_synced = 0', 
        orderBy: "id DESC"
      );
      print("👀 [QUEUE READ] ${res.length} item pending.");
      return res;
    } catch (e) {
      print("❌ [QUEUE READ ERROR]: $e");
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getSyncedItems(int limit, int offset) async {
    try {
      final db = await database;
      var res = await db.query(
        'queue', 
        where: 'is_synced = 1', 
        orderBy: "id DESC",
        limit: limit,
        offset: offset
      );
      print("👀 [HISTORY READ] Mengambil $limit item (Offset $offset).");
      return res;
    } catch (e) {
      print("❌ [HISTORY READ ERROR]: $e");
      return [];
    }
  }

  Future<void> markAsSynced(int id) async {
    final db = await database;
    await db.update(
      'queue', 
      {'is_synced': 1}, 
      where: 'id = ?', 
      whereArgs: [id]
    );
    print("✅ [QUEUE] Item ID $id ditandai sebagai TERKIRIM (Synced).");
  }

  Future<void> deleteItem(int id) async {
    final db = await database;
        final List<Map<String, dynamic>> items = await db.query(
      'queue', columns: ['photo_before_path', 'photo_after_path'], where: 'id = ?', whereArgs: [id]
    );

    if (items.isNotEmpty) {
      _deleteLocalFile(items.first['photo_before_path']);
      _deleteLocalFile(items.first['photo_after_path']);
    }

    await db.delete('queue', where: 'id = ?', whereArgs: [id]);
    print("🗑️ [QUEUE] Item ID $id dan fotonya berhasil dihapus.");
  }

  Future<void> _deleteLocalFile(String? path) async {
    if (path == null) return;
    try {
      final file = File(path);
      if (await file.exists()) {
        await file.delete();
        print("   -> File dihapus: ${basename(path)}");
      }
    } catch (e) {
      print("⚠️ Gagal hapus file $path: $e");
    }
  }

  Future<String?> _saveToPermanentStorage(String? tempPath) async {
    if (tempPath == null) return null;
    try {
      final File tempFile = File(tempPath);
      if (!await tempFile.exists()) return null;
      final Directory appDocDir = await getApplicationDocumentsDirectory();
      final String fileName = "queue_${DateTime.now().millisecondsSinceEpoch}_${basename(tempPath)}";
      final String permanentPath = join(appDocDir.path, fileName);
      await tempFile.copy(permanentPath);
      return permanentPath;
    } catch (e) {
      print("⚠️ Gagal copy file: $e");
      return tempPath;
    }
  }

}