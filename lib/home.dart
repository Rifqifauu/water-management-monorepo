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

  @override
  void initState() {
    super.initState();
    _checkDataAvailability();
  }

  Future<void> _checkDataAvailability() async {
    bool exists = await _masterService.hasData();
    setState(() {
      _hasMasterData = exists;
    });
    if (exists) {
      await _loadLocalData();
    }
  }

  Future<void> _loadLocalData() async {
    var k = await _masterService.getKaryawan();
    var l = await _masterService.getLokasi();
    var s = await _masterService.getSkoring();
    setState(() {
      _listKaryawan = k;
      _listLokasi = l;
      _listSkoring = s;
    });
  }

  Future<void> _doSync() async {
    setState(() => _isLoading = true);
    try {
      await _masterService.syncMasterData();
      await _checkDataAvailability();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("✅ Data Master Berhasil Diupdate!"), backgroundColor: Colors.blue),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("❌ Gagal Sync: $e"), backgroundColor: Colors.red),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _onItemTapped(int index) {
    if (index == 1 && !_hasMasterData) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Data Master Kosong"),
          content: const Text("Anda belum memiliki data master. Harap update data terlebih dahulu."),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Tutup")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  _doSync();
                },
                child: const Text("Update Sekarang"))
          ],
        ),
      );
      return;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List halaman didefinisikan di sini
    final List<Widget> pages = [
      _buildDashboardContent(), 
      ObservationEntryPage(
        listKaryawan: _listKaryawan,
        listLokasi: _listLokasi,
        skoringData: _listSkoring,
      ),
      // Setiap kali ini dipanggil, FormQueuePage dibuat baru -> initState jalan -> load data baru
      const FormQueuePage() 
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: false, 
      
      appBar: CustomWavyAppBar(
        title: "",
        isLoading: _isLoading,
      ),

      body: pages[_selectedIndex],
      
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_rounded), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.water_drop_rounded), label: 'Form Baru'),
          BottomNavigationBarItem(icon: Icon(Icons.history_rounded), label: 'History'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF1E88E5),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }

  // --- KONTEN DASHBOARD ---
  Widget _buildDashboardContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 10),
          const Text(
            "Selamat Datang di",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const Text(
            "Palm Water",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1565C0)),
          ),
          const Text(
            "Operational System",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1565C0)),
          ),
          
          const SizedBox(height: 30),

          // STATUS CARD UTAMA
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.15),
                  blurRadius: 25,
                  offset: const Offset(0, 10),
                )
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
                    size: 50,
                    color: _hasMasterData ? Colors.blue[600] : Colors.orange,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  _hasMasterData ? "Sistem Siap (Offline)" : "Data Kosong",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  _hasMasterData
                      ? "Database lokal tersedia. Anda dapat mengisi form tanpa internet."
                      : "Data Karyawan & Lokasi belum ada. Harap download sekarang.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: _isLoading ? null : _doSync,
                    icon: _isLoading
                        ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                        : const Icon(Icons.sync, color: Colors.white),
                    label: Text(_isLoading ? "Sedang Mengunduh..." : "UPDATE DATA MASTER"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E88E5),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // STATISTIK GRID
          if (_hasMasterData)
            Row(
              children: [
                Expanded(child: _statCard("Karyawan", _listKaryawan.length.toString(), Icons.people_alt_rounded, Colors.lightBlue)),
                const SizedBox(width: 15),
                Expanded(child: _statCard("Lokasi", _listLokasi.length.toString(), Icons.place_rounded, Colors.lightBlue)),
              ],
            ),
        ],
      ),
    );
  }

  Widget _statCard(String label, String value, IconData icon, MaterialColor color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey[100]!),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: color[50], borderRadius: BorderRadius.circular(10)),
            child: Icon(icon, color: color[700], size: 24),
          ),
          const SizedBox(height: 15),
          Text(value, style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.grey[800])),
          Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[500])),
        ],
      ),
    );
  }
}

// CLASS CUSTOM WAVY APPBAR & CLIPPER (Tetap Sama)
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    if (isLoading)
                      const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
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
    path.lineTo(0, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}