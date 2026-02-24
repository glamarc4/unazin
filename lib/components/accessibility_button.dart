import 'package:flutter/material.dart';

class AccessibilityButton extends StatefulWidget {
  const AccessibilityButton({super.key});

  @override
  State<AccessibilityButton> createState() => _AccessibilityButtonState();
}

class _AccessibilityButtonState extends State<AccessibilityButton> {
  bool _isExpanded = false;

  // Estados dos switches
  bool _inverterCores = false;
  bool _escalaDeCinza = false;
  bool _tradutorVirtual = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        alignment: Alignment.topRight, // Alinha ao topo e direita
        clipBehavior: Clip.none,
        children: [
          // 1. O BOTÃO AZUL (Só aparece se fechado)
          if (!_isExpanded) _buildMainButton(),

          // 2. O MENU (Aparece um pouco mais para cima)
          if (_isExpanded)
            Positioned(
              right: 0,
              top: -50, // Ajuste conforme necessário para subir o menu
              child: _buildMiniMenu(),
            ),

          // 3. DETECTOR DE CLIQUE FORA (Invisível, para fechar o menu)
          if (_isExpanded)
            GestureDetector(
              onTap: () => setState(() => _isExpanded = false),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.transparent,
              ),
            ),
        ],
      ),
    );
  }

  // --- MENU COMPACTO ---
  Widget _buildMiniMenu() {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(-2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 6, 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Acessibilidade',
                  style: TextStyle(
                    color: Color(0xFF004471),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _buildCloseButton(),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 0.5, indent: 10, endIndent: 10),

          _buildSectionHeader(Icons.visibility_outlined, 'Visual'),
          _buildSwitchRow(
            'Inverter Cores',
            _inverterCores,
            (v) => setState(() => _inverterCores = v),
          ),
          _buildSwitchRow(
            'Escala de Cinza',
            _escalaDeCinza,
            (v) => setState(() => _escalaDeCinza = v),
          ),

          const Divider(height: 8, indent: 25, endIndent: 25, thickness: 0.5),

          _buildSectionHeader(Icons.back_hand_outlined, 'Libras'),
          _buildSwitchRow(
            'Tradutor Virtual',
            _tradutorVirtual,
            (v) => setState(() => _tradutorVirtual = v),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  // Botão Azul com a imagem acessibilidade.png
  Widget _buildMainButton() {
    return GestureDetector(
      onTap: () => setState(() => _isExpanded = true),
      child: Container(
        height: 45,
        width: 48,
        decoration: const BoxDecoration(
          color: Color(0xFF003399),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        child: Center(
          child: Image.asset(
            'lib/assets/acessibilidade.png',
            height: 28, // Ajustado para manter a proporção do ícone anterior
            width: 28,
            fit: BoxFit.contain,
            // color: Colors.white, // Descomente se quiser forçar a imagem a ser branca
          ),
        ),
      ),
    );
  }

  // Botão de fechar (X)
  Widget _buildCloseButton() {
    return GestureDetector(
      onTap: () => setState(() => _isExpanded = false),
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.close, size: 12, color: Colors.black87),
      ),
    );
  }

  Widget _buildSectionHeader(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 6, 10, 0),
      child: Row(
        children: [
          Icon(icon, size: 14, color: Colors.black87),
          const SizedBox(width: 6),
          Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchRow(String label, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: Color(0xFF555555)),
          ),
          Transform.scale(
            scale: 0.6,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.white,
              activeTrackColor: const Color(0xFF003399),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}
