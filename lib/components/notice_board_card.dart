import 'dart:math';
import 'package:flutter/material.dart';

class NoticeBoardCard extends StatefulWidget {
  const NoticeBoardCard({super.key});

  @override
  State<NoticeBoardCard> createState() => _NoticeBoardCardState();
}

class _NoticeBoardCardState extends State<NoticeBoardCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: -pi / 2,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    // Proteção: Só inicia se o widget ainda estiver montado após o build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) _controller.forward();
        });
      }
    });
  }

  @override
  void dispose() {
    // É CRUCIAL parar o controller antes do dispose para evitar o erro de Ticker
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: const BorderSide(color: Color(0xFFCECECE), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Row(
              children: [
                Icon(Icons.filter_none, color: Color(0xFF1B5376), size: 20),
                SizedBox(width: 8),
                Text(
                  'Quadro de Avisos',
                  style: TextStyle(
                    color: Color(0xFF1B5376),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(height: 4, color: const Color(0xFFEFEFEF)),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [              
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, childWidget) {
                    return Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.002)
                        ..rotateX(_animation.value),
                      alignment: Alignment.center,
                      // Verificação de segurança para o child
                      child: childWidget,
                    );
                  },
                  // Definimos o conteúdo fixo aqui para otimizar performance
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE1F5FE),
                      borderRadius: BorderRadius.circular(4),
                      border: const Border(
                        left: BorderSide(color: Color(0xFF40C4FF), width: 4),
                        right: BorderSide(color: Color(0xFF40C4FF), width: 4),
                      ),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bem-vindo!',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text('No momento não existem mensagens para você!'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
