import 'package:flutter/material.dart';

class DashboardStatsRow extends StatelessWidget {
  const DashboardStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 36,
      decoration: BoxDecoration(
        color: const Color(0xFF1CA5ED),
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // --- Lado Esquerdo ---
            Expanded(
              child: _buildItem(
                icon: Icons.description_outlined,
                label: 'Novos arquivos',
                count: '0',
              ),
            ),

            // --- Divisória Vertical (A Barra) ---
            Container(
              width: 1,
              // AQUI: Aumentei a opacidade para ficar "mais branca" e visível
              color: Colors.white.withOpacity(0.6),
            ),

            // --- Lado Direito ---
            Expanded(
              child: _buildItem(
                icon: Icons.copy_all,
                label: 'Novos avisos',
                count: '0',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem({
    required IconData icon,
    required String label,
    required String count,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0x1972A3).withOpacity(1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 18),
              ),

              const SizedBox(width: 20),

              // Texto com Sombra
              Text(
                '$label: ',
                style: TextStyle(
                  fontFamily: 'Arial',
                  color: Colors.white,
                  fontSize: 14,
                  shadows: [
                    Shadow(
                      offset: const Offset(1, 1),
                      blurRadius: 2,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ],
                ),
              ),
              Text(
                count,
                style: TextStyle(
                  fontFamily: 'Arial',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  shadows: [
                    Shadow(
                      offset: const Offset(1, 1),
                      blurRadius: 2,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
