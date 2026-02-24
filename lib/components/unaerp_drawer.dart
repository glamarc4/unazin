import 'package:flutter/material.dart';

class UnaerpDrawer extends StatelessWidget {
  const UnaerpDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryTeal = Color(0xFF007A7C);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Drawer(
          elevation: 0,
          // Mantive a largura conforme o seu código
          width: MediaQuery.of(context).size.width * 0.60,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          // O segredo está aqui: o fundo do Drawer é branco
          backgroundColor: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    // --- ÁREA VERDE (Menu Principal) ---
                    Container(
                      color: primaryTeal,
                      child: Column(
                        children: [
                          _buildMenuItem(Icons.home_outlined, "Início"),
                          _buildMenuItem(Icons.person_outline, "Perfil"),
                          _buildMenuItem(Icons.search, "Consultas"),
                          _buildMenuItem(
                            Icons.settings_outlined,
                            "Ferramentas",
                          ),
                          _buildMenuItem(
                            Icons.description_outlined,
                            "Requerimento",
                          ),
                          _buildMenuItem(Icons.attach_money, "Financeiro"),
                          _buildMenuItem(Icons.school_outlined, "Matrícula"),
                          _buildMenuItem(Icons.info_outline, "Informações"),
                          _buildMenuItem(
                            Icons.trending_up,
                            "Avaliação CPA",
                            showBorder: false,
                          ),
                        ],
                      ),
                    ),
                    // --- LINHA DIVISORA BRANCA GROSSA ---
                    Container(height: 2, color: Colors.white),
                    // --- ÁREA CINZA (Logo abaixo da verde) ---
                    Container(
                      color: const Color(0xFFF5F5F5),
                      child: Column(
                        children: [
                          _buildFooterItem(
                            Icons.chat_bubble_outline,
                            "Meus Comentários",
                            showBorder: true,
                          ),
                          _buildFooterItem(
                            Icons.exit_to_app,
                            "Sair",
                            showBorder: false,
                          ),
                        ],
                      ),
                    ),
                    // O espaço que sobrar aqui para baixo ficará branco automaticamente
                    // porque definimos o backgroundColor do Drawer como white.
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {bool showBorder = true}) {
    return Container(
      decoration: BoxDecoration(
        border: showBorder
            ? const Border(bottom: BorderSide(color: Colors.white, width: 1.0))
            : null,
      ),
      child: ListTile(
        visualDensity: const VisualDensity(horizontal: 0, vertical: -3),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        leading: Icon(
          icon,
          color: Colors.white,
          size: 22,
          shadows: const [
            Shadow(color: Colors.black, offset: Offset(0.3, 0.3)),
            Shadow(color: Colors.black, offset: Offset(-0.3, -0.3)),
          ],
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Roboto',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(1, 1),
                blurRadius: 1,
              ),
            ],
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: const Color(0xFF004D4D),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 10,
            shadows: [
              Shadow(color: Colors.white, offset: Offset(0.4, 0.4)),
              Shadow(color: Colors.white, offset: Offset(-0.4, -0.4)),
              Shadow(color: Colors.white, offset: Offset(0.4, -0.4)),
              Shadow(color: Colors.white, offset: Offset(-0.4, 0.4)),
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }

  Widget _buildFooterItem(
    IconData icon,
    String title, {
    bool showBorder = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: showBorder
            ? const Border(bottom: BorderSide(color: Colors.white, width: 1.5))
            : null,
      ),
      child: ListTile(
        visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
        leading: Icon(icon, color: Colors.grey[600], size: 22),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.grey[800],
            fontFamily: 'Roboto',
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
