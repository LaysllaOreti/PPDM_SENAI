import 'package:app_tarefas/navigation/navigation.navbar.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NavBar()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryPink = Color(0xFFF48FB1);
    const Color accentPink = Color(0xFFFF4081);
    const Color lightPink = Color(0xFFFCE4EC);

    return Scaffold(
      backgroundColor: lightPink,
      body: Stack(
        children: [
          // Conteúdo Principal Centralizado
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      )
                    ],
                  ),
                  child: const Icon(Icons.calendar_month_outlined, size: 80, color: primaryPink),
                ),
                const SizedBox(height: 40),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [primaryPink, accentPink],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: const Text(
                    "Minhas Tarefas",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Organize seu dia",
                  style: TextStyle(
                    fontSize: 16,
                    color: primaryPink,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: 60,
                  height: 4,
                  decoration: BoxDecoration(
                    color: accentPink,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 60),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        value: 1.0,
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(primaryPink.withOpacity(0.2)),
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        valueColor: AlwaysStoppedAnimation<Color>(accentPink),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}