import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Widget child;

  const SectionCard({super.key, required this.title, required this.icon, required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey[200]!)),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)), child: Icon(icon, color: color, size: 20)),
            const SizedBox(width: 12),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87)),
          ]),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }
}

class LabelWithScore extends StatelessWidget {
  final String label;
  final int score;

  const LabelWithScore({super.key, required this.label, required this.score});

  @override
  Widget build(BuildContext context) {
    Color bg = score == 3 ? Colors.green[50]! : (score == 2 ? Colors.orange[50]! : (score == 1 ? Colors.red[50]! : Colors.grey[100]!));
    Color fg = score == 3 ? Colors.green[700]! : (score == 2 ? Colors.orange[700]! : (score == 1 ? Colors.red[700]! : Colors.grey));
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label.toUpperCase(), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black54)),
        if (score > 0) Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(4)), child: Text("SKOR: $score", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: fg)))
      ]),
    );
  }
}