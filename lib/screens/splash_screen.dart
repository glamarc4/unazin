import 'dart:async';
import 'package:flutter/material.dart';
import 'package:unazin/screens/home.dart';
import 'package:unazin/screens/loading_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoadingScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001D54),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Centraliza verticalmente
          children: [
            // A Logo
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Image.asset(
                'lib/assets/logo-grande.png',
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 80), // Espaço entre a logo e o loading
            // O Loading com a cor solicitada
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF027F82)),
              strokeWidth: 3, // Espessura do traço
            ),
          ],
        ),
      ),
    );
  }
}
