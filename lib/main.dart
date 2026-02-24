import 'package:flutter/material.dart';
import 'package:unazin/screens/splash_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      // Agora a Splash é a tela inicial
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
