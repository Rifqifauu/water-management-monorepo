import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectionCheck extends StatefulWidget {
  final Widget child;
  const ConnectionCheck({super.key, required this.child});

  @override
  State<ConnectionCheck> createState() => _ConnectionCheckState();
}

class _ConnectionCheckState extends State<ConnectionCheck> {
  bool _isOnline = true;
  late StreamSubscription<List<ConnectivityResult>> _subscription;

  @override
  void initState() {
    super.initState();
    _checkInitial();
    // Gunakan instans Connectivity() untuk menghindari error 'Lookup failed'
    _subscription = Connectivity().onConnectivityChanged.listen(_updateStatus);
  }

  Future<void> _checkInitial() async {
    final result = await Connectivity().checkConnectivity();
    _updateStatus(result);
  }

  void _updateStatus(List<ConnectivityResult> results) {
    final bool online = results.isNotEmpty && !results.contains(ConnectivityResult.none);
    if (online != _isOnline) {
      setState(() => _isOnline = online);
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color emerald = Color(0xFF059669);

    return Stack(
      children: [
        widget.child,
        Positioned(
          top: MediaQuery.of(context).padding.top + 10,
          right: 16,
          // WAJIB: Gunakan Material agar garis kuning hilang dan teks rapi
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: _isOnline ? emerald.withOpacity(0.3) : Colors.red.withOpacity(0.3),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _isOnline ? "ONLINE" : "OFFLINE",
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                      color: _isOnline ? emerald : Colors.red,
                      // Tambahan pengaman agar tidak ada dekorasi garis
                      decoration: TextDecoration.none, 
                    ),
                  ),
                  const SizedBox(width: 6),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _isOnline ? emerald : Colors.red,
                      boxShadow: [
                        BoxShadow(
                          color: (_isOnline ? emerald : Colors.red).withOpacity(0.4),
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}