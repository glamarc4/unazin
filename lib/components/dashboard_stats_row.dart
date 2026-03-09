import 'package:flutter/material.dart';

class DashboardStatsRow extends StatelessWidget {
  const DashboardStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    // 360px = Galaxy S22 e telas pequenas; 380 garante margem e evita overflow
    final isNarrow = MediaQuery.sizeOf(context).width <= 380;
    return Container(
      width: double.infinity,
      height: isNarrow ? 32 : 36,
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
                context: context,
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
                context: context,
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
    required BuildContext context,
    required IconData icon,
    required String label,
    required String count,
  }) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isNarrow = screenWidth <= 380;

    final padding = isNarrow ? 4.0 : 10.0;
    final spacing = isNarrow ? 4.0 : 20.0;
    final fontSize = isNarrow ? 10.0 : 14.0;
    final iconSize = isNarrow ? 12.0 : 18.0;
    final iconPadding = isNarrow ? 2.0 : 4.0;

    final textStyle = TextStyle(
      fontFamily: 'Arial',
      color: Colors.white,
      fontSize: fontSize,
      shadows: [
        Shadow(
          offset: const Offset(1, 1),
          blurRadius: 2,
          color: Colors.black.withOpacity(0.4),
        ),
      ],
    );

    final boldStyle = textStyle.copyWith(fontWeight: FontWeight.bold);

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(iconPadding),
          decoration: BoxDecoration(
            color: const Color(0x1972A3).withOpacity(1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: iconSize),
        ),
        SizedBox(width: spacing),
        Text(
          '$label: ',
          style: textStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Text(
          count,
          style: boldStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: constraints.maxWidth,
                  ),
                  child: content,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
