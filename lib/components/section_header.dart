import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF26B0F9), Color(0xFF114964)], // Degradê Azul
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w400,
          shadows: [
            Shadow(offset: Offset(0, 1), blurRadius: 2, color: Colors.black26),
          ],
        ),
      ),
    );
  }
}
