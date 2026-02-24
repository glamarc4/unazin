import 'dart:math';
import 'package:flutter/material.dart';
import 'package:unazin/components/custom_navegation_button.dart';

class TodayClassesCard extends StatefulWidget {
  const TodayClassesCard({super.key});

  @override
  State<TodayClassesCard> createState() => _TodayClassesCardState();
}

class _TodayClassesCardState extends State<TodayClassesCard>
    with SingleTickerProviderStateMixin {
  // Tornamos o controller nullable para evitar erro de inicialização tardia
  AnimationController? _controller;
  late Animation<double> _animation;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    
    // Inicializamos o controller aqui, mas com segurança
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _animation = Tween<double>(begin: -pi / 2, end: 0).animate(
      CurvedAnimation(parent: _controller!, curve: Curves.elasticOut),
    );

    // O segredo: esperar a frame ser desenhada e garantir que o widget ainda existe
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      Future.delayed(const Duration(milliseconds: 800), () {
        if (mounted && _controller != null) {
          setState(() => _isInitialized = true);
          _controller!.forward().catchError((_) {});
        }
      });
    });
  }

  @override
  void dispose() {
    // Paramos tudo antes de descartar
    _controller?.stop();
    _controller?.dispose();
    _controller = null; 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Se não estiver inicializado, mostramos o card invisível ou estático 
    // para evitar que o AnimatedBuilder tente ler um controller descartado
    if (_controller == null) return const SizedBox.shrink();

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, childWidget) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateX(_animation.value),
          alignment: Alignment.center,
          child: Opacity(
            // Se ainda não começou a animar, mantemos transparente
            opacity: _isInitialized ? ((_animation.value + (pi / 2)) / (pi / 2)).clamp(0.0, 1.0) : 0.0,
            child: childWidget,
          ),
        );
      },
      child: _buildCardContent(),
    );
  }

  // Extraí o conteúdo para limpar o método build
  Widget _buildCardContent() {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: const BorderSide(color: Color(0xFFCECECE), width: 1),
      ),
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Row(
              children: [
                Icon(Icons.school, color: Color(0xFF0055AA), size: 22),
                SizedBox(width: 8),
                Text(
                  'Aulas de Hoje',
                  style: TextStyle(
                    color: Color(0xFF0055AA),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(height: 4, width: double.infinity, color: const Color(0xFFEFEFEF)),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.location_on, color: Colors.black54, size: 20),
                    Icon(Icons.menu_book, color: Colors.black54, size: 20),
                    Icon(Icons.access_time_filled, color: Colors.black54, size: 20),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Divider(height: 1, thickness: 1, color: Color(0xFFEFEFEF)),
                ),
                const Text(
                  'Não há aulas para o dia de hoje.',
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Divider(height: 1, thickness: 1, color: Color(0xFFEFEFEF)),
                ),
                const SizedBox(height: 4),
                CustomNavigationButton(
                  text: 'Visualizar horários',
                  icon: Icons.chevron_right,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}