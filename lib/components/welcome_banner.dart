import 'package:flutter/material.dart';

class WelcomeBanner extends StatelessWidget {
  final VoidCallback onTap;
  final bool isExpanded;
  final String studentName;

  const WelcomeBanner({
    super.key,
    required this.onTap,
    required this.isExpanded,
    this.studentName = 'Gabriel',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 4),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF008081),
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.25),
                shape: BoxShape.circle,
              ),
              child: Icon(
                // Mantendo o truque da sombra para engrossar o ícone
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 24,
                shadows: const [
                  Shadow(color: Colors.white, offset: Offset(0.5, 0.5)),
                  Shadow(color: Colors.white, offset: Offset(-0.5, -0.5)),
                  Shadow(color: Colors.white, offset: Offset(0.5, -0.5)),
                  Shadow(color: Colors.white, offset: Offset(-0.5, 0.5)),
                ],
              ),
            ),
            Expanded(
              child: Text(
                'Olá ${studentName.isNotEmpty ? studentName : 'Gabriel'}, seja bem-vindo(a)!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  // Removi o const aqui por causa do withOpacity
                  color: Colors.white,
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  // AQUI: A sombra no texto
                  shadows: [
                    Shadow(
                      offset: const Offset(1, 1), // Deslocamento suave
                      blurRadius: 2, // Leve desfoque
                      color: Colors.black.withOpacity(
                        0.3,
                      ), // Preto transparente
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 28),
          ],
        ),
      ),
    );
  }
}
