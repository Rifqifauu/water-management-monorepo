import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'widgets/connection_check.dart'; 
import 'splash_screen.dart'; 

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PalmWaterApp());
}

class PalmWaterApp extends StatelessWidget {
  const PalmWaterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PalmWater OS',
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E88E5)), 
        useMaterial3: true,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const Color(0xFF1E88E5);
            }
            return null;
          }),
        ),
      ),
      builder: (context, child) {
        return ConnectionCheck(child: child!);
      },
      // GANTI LoginPage MENJADI SplashScreen
      home: const SplashScreen(), 
    );
  }
}
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _showPassword = false;
  bool _rememberMe = false;
  bool _isLoading = false;

  void _handleLogin() async {
    setState(() => _isLoading = true);
    
    // Simulasi loading
    await Future.delayed(const Duration(milliseconds: 800));

    // Logika Login Sederhana
    if (_usernameController.text == 'admin' && _passwordController.text == 'admin123') {
      if (mounted) {
        // Navigasi ke Home (Pastikan class HomePage ada)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Username atau Password salah!'), 
            backgroundColor: Colors.red
          ),
        );
      }
    }
    
    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, 
      body: Stack(
        children: [
          Positioned.fill(
       child: Image.asset(
  "assets/images/login.jpg", 
  fit: BoxFit.cover,
),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.white.withOpacity(0.85), 
            ),
          ),
          const Positioned(
            top: 0, left: 0, right: 0,
            child: Opacity(
              opacity: 0.5,
              child: WavyHeader(height: 300, isReverse: true, color: Color(0xFF64B5F6)),
            ),
          ),
          const Positioned(
            top: 0, left: 0, right: 0,
            child: WavyHeader(height: 260, isReverse: false, isGradient: true),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
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
                  ),
                  const SizedBox(height: 20),                  
                  const Center(
                    child: Text("Palm Water OS", 
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFF1565C0))),
                  ),
                  const Center(
                    child: Text("Mobile App", 
                      style: TextStyle(color: Colors.black, fontSize: 14)),
                  ),
                  const SizedBox(height: 40),
                  const Text("Username", style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      hintText: "Masukkan username",
                      prefixIcon: const Icon(Icons.person_outline, color: Colors.blueGrey),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFF1E88E5), width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8), 
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text("Password", style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _passwordController,
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                      hintText: "Masukkan password",
                      prefixIcon: const Icon(Icons.lock_outline, color: Colors.blueGrey),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFF1E88E5), width: 2),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      suffixIcon: IconButton(
                        icon: Icon(_showPassword ? Icons.visibility_off : Icons.visibility, color: Colors.blueGrey),
                        onPressed: () => setState(() => _showPassword = !_showPassword),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _rememberMe, 
                            onChanged: (val) => setState(() => _rememberMe = val!),
                            activeColor: const Color(0xFF1E88E5), 
                          ),
                          const Text("Ingat saya"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF42A5F5), Color(0xFF1565C0)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ]
                    ),
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, 
                        shadowColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      child: _isLoading 
                        ? const CircularProgressIndicator(color: Colors.white) 
                        : const Text("Masuk Sekarang", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WavyHeader extends StatelessWidget {
  final double height;
  final bool isReverse;
  final bool isGradient;
  final Color? color;

  const WavyHeader({
    super.key, 
    required this.height, 
    this.isReverse = false, 
    this.isGradient = false,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(isReverse: isReverse),
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: color,
          gradient: isGradient 
            ? const LinearGradient(
                colors: [Color(0xFF42A5F5), Color(0xFF1565C0)], 
                begin: Alignment.topLeft, 
                end: Alignment.bottomRight
              ) 
            : null,
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  final bool isReverse;
  WaveClipper({this.isReverse = false});

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);

    var firstControlPoint = Offset(size.width / 4, isReverse ? size.height : size.height - 80);
    var firstEndPoint = Offset(size.width / 2, size.height - 40);

    var secondControlPoint = Offset(size.width - (size.width / 4), isReverse ? size.height - 80 : size.height);
    var secondEndPoint = Offset(size.width, size.height - 40);

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