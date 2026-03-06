import 'package:flutter/material.dart';

class GpsCard extends StatefulWidget {
  final String? lat;
  final String? long;
  final VoidCallback? onTap;
  final bool isLoading;
  
  // Tambahkan callback untuk mengirim data ketikan ke parent
  final Function(String)? onLatChanged;
  final Function(String)? onLongChanged;

  const GpsCard({
    super.key,
    this.lat,
    this.long,
    this.onTap,
    this.isLoading = false,
    this.onLatChanged,
    this.onLongChanged,
  });

  @override
  State<GpsCard> createState() => _GpsCardState();
}

class _GpsCardState extends State<GpsCard> {
  late TextEditingController _latController;
  late TextEditingController _longController;

  @override
  void initState() {
    super.initState();
    _latController = TextEditingController(text: widget.lat);
    _longController = TextEditingController(text: widget.long);
  }

  // didUpdateWidget berfungsi agar saat tombol GPS ditekan di parent, 
  // text field di sini ikut ter-update otomatis
  @override
  void didUpdateWidget(GpsCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.lat != oldWidget.lat && widget.lat != _latController.text) {
      _latController.text = widget.lat ?? '';
    }
    if (widget.long != oldWidget.long && widget.long != _longController.text) {
      _longController.text = widget.long ?? '';
    }
  }

  @override
  void dispose() {
    _latController.dispose();
    _longController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.location_on, color: Colors.blue.shade700),
                ),
                const SizedBox(width: 12),
                const Text("Koordinat Lokasi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _coordBox("Latitude", _latController, widget.onLatChanged),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _coordBox("Longitude", _longController, widget.onLongChanged),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: widget.isLoading ? null : widget.onTap,
                icon: widget.isLoading 
                    ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) 
                    : const Icon(Icons.my_location),
                label: Text(widget.isLoading ? "Mencari Satelit..." : "Ambil Lokasi Saat Ini"),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Widget box diubah menggunakan TextField
  Widget _coordBox(String label, TextEditingController controller, Function(String)? onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 10, color: Colors.grey.shade600, fontWeight: FontWeight.bold)),
          TextField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 8),
              border: InputBorder.none,
              hintText: "Isi manual...",
            ),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}