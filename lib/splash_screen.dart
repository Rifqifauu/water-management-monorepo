import 'dart:async';
import 'package:flutter/material.dart';

import '../main.dart'; 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Durasi splash screen 3 detik
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: Stack(
      children: [
        // 1. Gambar Latar Belakang (Paling Bawah)
        Positioned.fill(
          child: Image.asset(
            "assets/images/login.jpg", // Pastikan path ini benar di pubspec.yaml
            fit: BoxFit.cover,
          ),
        ),

        Positioned.fill(
          child: Container(
            color: Colors.white.withOpacity(0.8), // Memberikan efek transparan di atas gambar
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 30,
                      offset: const Offset(0, 15),
                    )
                  ]
                ),
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 100,  
                  height: 100, 
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "PWOS Mobile",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1565C0),
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Water Monitoring System",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 60),

            ],
          ),
        ),
      ],
    ),
  );
}
}