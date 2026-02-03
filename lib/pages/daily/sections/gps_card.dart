import 'package:flutter/material.dart';

class GpsCard extends StatelessWidget {
  final String? lat;
  final String? long;
  final VoidCallback? onTap;
  
  // Parameter baru untuk menampilkan status loading
  final bool isLoading; 

  const GpsCard({
    super.key,
    this.lat,
    this.long,
    this.onTap,
    this.isLoading = false, // Default false
  });

  @override
  Widget build(BuildContext context) {
    bool hasLocation = lat != null && lat!.isNotEmpty && long != null && long!.isNotEmpty;

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
                  child: _coordBox("Latitude", lat ?? "-"),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _coordBox("Longitude", long ?? "-"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: isLoading ? null : onTap, // Disable tombol saat loading
                icon: isLoading 
                    ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)) 
                    : const Icon(Icons.my_location),
                label: Text(isLoading ? "Mencari Satelit..." : "Ambil Lokasi Saat Ini"),
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

  Widget _coordBox(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 10, color: Colors.grey.shade600, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}