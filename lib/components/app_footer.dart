import 'package:flutter/material.dart';

class UnaerpFooter extends StatelessWidget {
  const UnaerpFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Container Azul - Logo Footer / e-MEC
        Container(
          width: double.infinity,
          color: const Color(0xFF001D54), // Azul Marinho Oficial
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          child: Center(
            child: Image.asset(
              'lib/assets/logo-footer.png', // O card com QR Code
              height: 100, // Ajuste conforme a necessidade
              fit: BoxFit.contain,
            ),
          ),
        ),

        // Container Cinza - Logo Colorida
        Container(
          width: double.infinity,
          color: const Color(0xFFE0E0E0), // Cinza do fundo da Home
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Center(
            child: Image.asset(
              'lib/assets/logo-colorida.png', // A logo horizontal colorida
              height: 45, // Proporção da imagem
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
