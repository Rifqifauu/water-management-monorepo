import 'package:flutter/material.dart';
import 'package:water_monitoring_mobile/pages/form_queue.dart';
import 'package:water_monitoring_mobile/pages/observation_entry.dart';
import '../services/master_data_service.dart';
import '../models/monitoring_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final MasterDataService _masterService = MasterDataService();
  bool _isLoading = false;
  bool _hasMasterData = false;
  List<KaryawanModel> _listKaryawan = [];
  List<LokasiModel> _listLokasi = [];
  List<SkoringConfig> _listSkoring = [];
  List<WaterLevelMaster> _listWaterLevelMaster = [];
  List<InfrastructureMaster> _listInfrastructureMaster = [];

  @override
  void initState() {
    super.initState();
    _checkDataAvailability();
  }
Future<void> _checkDataAvailability() async {
  bool exists = await _masterService.hasData();
  
  if (!exists) {
    debugPrint("🌱 [HOME] Data kosong, mencoba ambil dari snapshot lokal...");
    await _masterService.forceSeed();
    exists = await _masterService.hasData();
  }
  if (mounted) {
    setState(() => _hasMasterData = exists);
    if (exists) {
      await _loadLocalData();
    }
  }
}
  Future<void> _loadLocalData() async {
    try {
      final results = await Future.wait([
        _masterService.getKaryawan(),
        _masterService.getLokasi(),
        _masterService.getSkoring(),
        _masterService.getWaterLevelMaster(),
        _masterService.getInfrastructureMaster(),
      ]);

      if (mounted) {
        setState(() {
          _listKaryawan = results[0] as List<KaryawanModel>;
          _listLokasi = results[1] as List<LokasiModel>;
          _listSkoring = results[2] as List<SkoringConfig>;
          _listWaterLevelMaster = results[3] as List<WaterLevelMaster>;
          _listInfrastructureMaster = results[4] as List<InfrastructureMaster>;
        });
      }
    } catch (e) {
      debugPrint("Error loading local data: $e");
    }
  }

  Future<void> _doSync() async {
    setState(() => _isLoading = true);
    try {
      await _masterService.syncMasterData();
      await _checkDataAvailability();
      
      if (mounted) {
        _showSnackBar("✅ Data Master Berhasil Diupdate!", Colors.green[700]!);
      }
    } catch (e) {
      if (mounted) {
        _showSnackBar("❌ Gagal Sync: $e", Colors.redAccent);
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
  void _onItemTapped(int index) {
    if (index == 1 && !_hasMasterData) {
      _showSyncDialog();
      return;
    }
    setState(() => _selectedIndex = index);
  }

  // --- UI HELPER METHODS ---

  void _showSnackBar(String message, Color bgColor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: bgColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(15),
      ),
    );
  }

  void _showSyncDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Data Master Kosong"),
        content: const Text(
            "Anda belum memiliki data master. Harap update data terlebih dahulu."),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Tutup", style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              _doSync();
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1E88E5)),
            child: const Text("Update Sekarang", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      extendBodyBehindAppBar: false,
      
      appBar: CustomWavyAppBar(
        title: _selectedIndex == 0 
            ? "Beranda" 
            : (_selectedIndex == 1 ? "Input Observasi" : "Antrean Data"),
        isLoading: _isLoading,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildDashboardContent(),
          ObservationEntryPage(
            listKaryawan: _listKaryawan,
            listLokasi: _listLokasi,
            skoringData: _listSkoring,
            waterLevelMasterData: _listWaterLevelMaster,
            infrastructureMasterData: _listInfrastructureMaster,
          ),
          const FormQueuePage()
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))
          ],
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.dashboard_rounded), label: 'Beranda'),
            BottomNavigationBarItem(icon: Icon(Icons.water_drop_rounded), label: 'Form Baru'),
            BottomNavigationBarItem(icon: Icon(Icons.history_rounded), label: 'History'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFF1565C0),
          unselectedItemColor: Colors.grey[400],
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          elevation: 0,
        ),
      ),
    );
  }
  Widget _buildDashboardContent() {
    return RefreshIndicator(
      onRefresh: _checkDataAvailability,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Selamat Datang di", style: TextStyle(fontSize: 14, color: Colors.grey)),
            const Text("Palm Water OS", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1565C0))), 
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.blue.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 10))
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: _hasMasterData ? Colors.blue[50] : Colors.orange[50],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _hasMasterData ? Icons.cloud_done_rounded : Icons.cloud_off_rounded,
                      size: 40,
                      color: _hasMasterData ? Colors.blue[600] : Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    _hasMasterData ? "Sistem Siap Offline" : "Data Master Kosong",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _hasMasterData
                        ? "Database lokal tersedia. Anda dapat mengisi form."
                        : "Data Master belum ada. Harap download sekarang.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton.icon(
                      onPressed: _isLoading ? null : _doSync,
                      icon: _isLoading
                          ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                          : const Icon(Icons.sync, color: Colors.white),
                      label: Text(_isLoading ? "Mengunduh..." : "UPDATE DATA MASTER"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E88E5),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            if (_hasMasterData) ...[
              const Text(" Data Master", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
              const SizedBox(height: 5),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10, 
                childAspectRatio: 2.2, 
                children: [
                  _statCard("Karyawan", _listKaryawan.length.toString(), Icons.people_alt_rounded, Colors.blue),
                  _statCard("Lokasi", _listLokasi.length.toString(), Icons.place_rounded, Colors.orange),
                  _statCard("Water Level", _listWaterLevelMaster.length.toString(), Icons.water, Colors.cyan),
                  _statCard("Infrastruktur", _listInfrastructureMaster.length.toString(), Icons.construction, Colors.purple),
                ],
              ),
            ]
          ],
        ),
      ),
    );
  }
  Widget _statCard(String label, String value, IconData icon, MaterialColor color) {
    return Container(
      padding: const EdgeInsets.all(10), 
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12), 
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // Padding icon dikurangi
                padding: const EdgeInsets.all(6), 
                decoration: BoxDecoration(color: color[50], borderRadius: BorderRadius.circular(6)),
                // Ukuran icon diperkecil
                child: Icon(icon, color: color[700], size: 18), 
              ),
              // Font size angka diperkecil
              Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[800])),
            ],
          ),
          const SizedBox(height: 8), // Spacer diganti jarak fix
          // Font size label diperkecil
          Text(
            label, 
            style: TextStyle(fontSize: 11, color: Colors.grey[500], fontWeight: FontWeight.w500),
            maxLines: 1, 
            overflow: TextOverflow.ellipsis
          ),
        ],
      ),
    );
  }
}
class CustomWavyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isLoading;
  const CustomWavyAppBar({super.key, required this.title, this.isLoading = false});
  @override
  Size get preferredSize => const Size.fromHeight(110); 
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AppBarWaveClipper(),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF42A5F5), Color(0xFF1565C0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                ),
                if (isLoading)
                  const SizedBox(
                    width: 20, 
                    height: 20, 
                    child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white)
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class AppBarWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 30);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 30);
    var secondControlPoint = Offset(size.width - (size.width / 4), size.height - 60);
    var secondEndPoint = Offset(size.width, size.height - 20);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}