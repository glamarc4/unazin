import 'package:flutter/material.dart';

class CustomNavigationButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const CustomNavigationButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5), // Cinza bem claro de fundo
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0xFFDCDCDC)), // Borda sutil
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Círculo com o ícone posicionado à esquerda
            Positioned(
              left: 0,
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                  color: Color(0xFFBCBCBC), // Cor do círculo do ícone
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 18, color: Colors.white),
              ),
            ),
            // Texto centralizado no botão
            Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF444444),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
