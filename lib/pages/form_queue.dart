import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../../services/queue_service.dart';
import '../../services/api_service.dart';

class FormQueuePage extends StatefulWidget {
  const FormQueuePage({super.key});

  @override
  State<FormQueuePage> createState() => _FormQueuePageState();
}

class _FormQueuePageState extends State<FormQueuePage> with SingleTickerProviderStateMixin {
  final QueueService _queueService = QueueService();
  final ApiService _apiService = ApiService();
  late TabController _tabController;

  List<Map<String, dynamic>> _unsyncedItems = [];
  List<Map<String, dynamic>> _syncedItems = [];
  bool _isLoadingUnsynced = true;
  bool _isLoadingSynced = true;
  bool _isSyncing = false;
  final ScrollController _scrollController = ScrollController();
  int _page = 0;
  final int _limit = 10;
  bool _hasMoreSynced = true;
  bool _isLoadingMore = false;
  int _syncIndex = 0;
  int _totalSync = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);    
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent &&
          !_isLoadingMore &&
          _hasMoreSynced) {
        _loadSyncedData(loadMore: true);
      }
    });

    initializeDateFormatting('id_ID', null).then((_) {
      _loadUnsyncedData();
      _loadSyncedData(loadMore: false);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadUnsyncedData() async {
    setState(() => _isLoadingUnsynced = true);
    try {
      final items = await _queueService.getUnsyncedItems(); 
      if (mounted) {
        setState(() {
          _unsyncedItems = items;
          _isLoadingUnsynced = false;
        });
      }
    } catch (e) {
      debugPrint("Error loading unsynced: $e");
      if (mounted) setState(() => _isLoadingUnsynced = false);
    }
  }

  Future<void> _loadSyncedData({bool loadMore = false}) async {
    if (loadMore) {
      setState(() => _isLoadingMore = true);
    } else {
      setState(() {
        _isLoadingSynced = true;
        _page = 0;
        _syncedItems.clear();
        _hasMoreSynced = true;
      });
    }

    try {
      final offset = _page * _limit;
      final newItems = await _queueService.getSyncedItems(_limit, offset);

      if (mounted) {
        setState(() {
          if (newItems.length < _limit) {
            _hasMoreSynced = false;
          }
          _syncedItems.addAll(newItems);
          _page++; // Naikkan halaman untuk fetch berikutnya
          
          _isLoadingSynced = false;
          _isLoadingMore = false;
        });
      }
    } catch (e) {
      debugPrint("Error loading synced: $e");
      if (mounted) {
        setState(() {
          _isLoadingSynced = false;
          _isLoadingMore = false;
        });
      }
    }
  }
  Future<void> _syncAllData() async {
    if (_unsyncedItems.isEmpty) return;

    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity == ConnectivityResult.none) {
      _showSnackBar("⚠️ Tidak ada koneksi internet!", Colors.red);
      return;
    }

    setState(() {
      _isSyncing = true;
      _totalSync = _unsyncedItems.length;
      _syncIndex = 0;
    });

    int successCount = 0;
    int failCount = 0;
    List<Map<String, dynamic>> itemsToSync = List.from(_unsyncedItems);

    for (var i = 0; i < itemsToSync.length; i++) {
      setState(() => _syncIndex = i + 1);
      final item = itemsToSync[i];

      bool result = await _processSingleItem(item);
      if (result) {
        await _queueService.markAsSynced(item['id']);
        successCount++;
      } else {
        failCount++;
      }
    }

    await _loadUnsyncedData();
    await _loadSyncedData(loadMore: false); // Reset list synced untuk menampilkan data baru

    setState(() {
      _isSyncing = false;
      _syncIndex = 0;
      _totalSync = 0;
    });

    _showSnackBar(
      "Selesai! Sukses: $successCount, Gagal: $failCount",
      failCount == 0 ? Colors.green : Colors.orange,
    );
  }

  Future<bool> _processSingleItem(Map<String, dynamic> item) async {
    try {
      final Map<String, dynamic> payload = jsonDecode(item['payload']);
      final File? f1 = item['photo_before_path'] != null ? File(item['photo_before_path']) : null;
      final File? f2 = item['photo_after_path'] != null ? File(item['photo_after_path']) : null;
      final String type = item['type'] ?? '';
      
      switch (type) {
        case 'daily_monitoring':
          return await _apiService.submitHarian(payload, f1, f2);
        case 'weekly_monitoring':
          return await _apiService.submitMingguan(payload, f1, f2);
        case 'wl_monitoring':
          return await _apiService.submitWL(payload, f1, f2);
        default:
          return false;
      }
    } catch (e) {
      debugPrint("Sync Error ID ${item['id']}: $e");
      return false;
    }
  }
  Future<void> _deleteConfirm(int id, bool isSyncedItem) async {
    bool confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Hapus Data"),
        content: const Text("Anda yakin ingin menghapus data ini dari perangkat?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text("Batal")),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text("Hapus", style: TextStyle(color: Colors.red))),
        ],
      ),
    ) ?? false;

    if (confirm) {
      await _queueService.deleteItem(id);
      if (isSyncedItem) {
        setState(() {
          _syncedItems.removeWhere((item) => item['id'] == id);
        });
      } else {
        _loadUnsyncedData();
      }
      _showSnackBar("Data dihapus", Colors.grey);
    }
  }

  String _formatDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return '-';
    try {
      final DateTime dt = DateTime.parse(dateString).toLocal();
      return DateFormat('dd MMM yyyy • HH:mm', 'id').format(dt);
    } catch (e) {
      return dateString; 
    }
  }

  String _formatKey(String key) {
    return key.replaceAll('_', ' ').toUpperCase();
  }

  void _showSnackBar(String message, Color color) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: color),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        backgroundColor: Colors.white, 
        title: TabBar(
          controller: _tabController,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.blue,
          tabs: const [
            Tab(text: "Pending"),
            Tab(text: "Terkirim"),
          ],
        ),
      ),
      body: Column(
        children: [
          // Progress Bar Sync
          if (_isSyncing)
            LinearProgressIndicator(
              value: _totalSync == 0 ? 0 : _syncIndex / _totalSync,
              backgroundColor: Colors.blue[100],
              color: Colors.blue,
              minHeight: 4,
            ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // TAB 1: BELUM SINKRON
                _buildUnsyncedTab(),
                // TAB 2: SUDAH SINKRON (PAGINATION)
                _buildSyncedTab(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _unsyncedItems.isNotEmpty && !_tabController.indexIsChanging
        ? AnimatedBuilder(
            animation: _tabController,
            builder: (context, child) {
              if (_tabController.index == 1) return const SizedBox.shrink();
              
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, -2))],
                ),
                child: ElevatedButton.icon(
                  onPressed: _isSyncing ? null : _syncAllData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[800],
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  icon: _isSyncing 
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) 
                    : const Icon(Icons.cloud_upload, color:Colors.white),
                  label: Text(_isSyncing ? "Mengirim Data $_syncIndex / $_totalSync..." : "SINKRONISASI SEKARANG"),
                ),
              );
            }
          )
        : null,
    );
  }

  Widget _buildUnsyncedTab() {
    if (_isLoadingUnsynced) return const Center(child: CircularProgressIndicator());
    
    if (_unsyncedItems.isEmpty) {
      return _buildEmptyState("Tidak ada data pending", "Semua data telah tersinkronisasi.");
    }

    return RefreshIndicator(
      onRefresh: _loadUnsyncedData,
      child: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: _unsyncedItems.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          return _buildCompactCard(_unsyncedItems[index], isSynced: false);
        },
      ),
    );
  }

  Widget _buildSyncedTab() {
    if (_isLoadingSynced) return const Center(child: CircularProgressIndicator());

    if (_syncedItems.isEmpty) {
      return _buildEmptyState("Belum ada riwayat", "Data yang berhasil dikirim akan muncul di sini.");
    }

    return RefreshIndicator(
      onRefresh: () => _loadSyncedData(loadMore: false),
      child: ListView.separated(
        controller: _scrollController,
        padding: const EdgeInsets.all(12),
        itemCount: _syncedItems.length + (_hasMoreSynced ? 1 : 0),
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          // Indikator Loading di bawah list saat pagination
          if (index == _syncedItems.length) {
            return const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          return _buildCompactCard(_syncedItems[index], isSynced: true);
        },
      ),
    );
  }

  Widget _buildCompactCard(Map<String, dynamic> item, {required bool isSynced}) {
    final type = item['type'] ?? '';
    final dateFormatted = _formatDate(item['created_at']);
    Color themeColor;
    IconData iconData;

    if (type == 'daily_monitoring') {
      themeColor = Colors.blue;
      iconData = Icons.calendar_today;
    } else if (type == 'weekly_monitoring') {
      themeColor = Colors.orange;
      iconData = Icons.date_range;
    } else if (type == 'wl_monitoring') {
      themeColor = Colors.teal;
      iconData = Icons.water;
    } else {
      themeColor = Colors.grey;
      iconData = Icons.insert_drive_file;
    }

    // Jika sudah sync, warnanya kita buat agak pudar atau hijau
    if (isSynced) {
      themeColor = Colors.green;
      iconData = Icons.check_circle;
    }

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: themeColor.withOpacity(0.1),
          child: Icon(iconData, color: themeColor, size: 22),
        ),
        title: Text(
          _formatKey(type),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(dateFormatted, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            if (isSynced)
              Text("Terkirim", style: TextStyle(fontSize: 11, color: Colors.green[800], fontWeight: FontWeight.bold)),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.visibility_outlined, color: Colors.grey),
              tooltip: "Lihat Detail",
              onPressed: () => _showDetailModal(item),
            ),
            IconButton(
              icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
              tooltip: "Hapus",
              onPressed: _isSyncing ? null : () => _deleteConfirm(item['id'], isSynced),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(String title, String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_outlined, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[700])),
          const SizedBox(height: 4),
          Text(message, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  void _showDetailModal(Map<String, dynamic> item) {
    Map<String, dynamic> payload = {};
    try {
      payload = jsonDecode(item['payload']);
    } catch (_) {
      payload = {"Error": "Data korup"};
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.95,
          builder: (_, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Container(
                    width: 40, height: 4,
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_formatKey(item['type']), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
                    ],
                  ),
                  const Divider(),
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      children: [
                        ...payload.entries
                            .where((e) => !e.key.contains('_id') && !e.key.contains('path'))
                            .map((e) => Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(_formatKey(e.key), style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Text("${e.value}", 
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                        const SizedBox(height: 20),
                        const Text("Lampiran Foto", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildPhotoThumb(item['photo_before_path'], "Before"),
                            _buildPhotoThumb(item['photo_after_path'], "After"),
                          ],
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildPhotoThumb(String? path, String label) {
    if (path == null) return const SizedBox.shrink();
    final file = File(path);
    final exists = file.existsSync();

    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300),
            image: exists 
              ? DecorationImage(image: FileImage(file), fit: BoxFit.cover)
              : null,
          ),
          child: !exists 
            ? const Icon(Icons.broken_image, color: Colors.grey)
            : null,
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}