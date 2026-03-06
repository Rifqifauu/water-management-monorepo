import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final String averageScore;
  const HeaderSection({super.key, required this.averageScore});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFF1D4ED8), Color(0xFF3B82F6)]), 
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
            Text("Daily Observation", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900)),
            Text("Form lapangan online.", style: TextStyle(color: Colors.white70))
          ]),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.white30)),
            child: Column(children: [
              const Text("RATA-RATA", style: TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.bold)),
              Text(averageScore, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w900))
            ]),
          )
        ],
      ),
    );
  }
}