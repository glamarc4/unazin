import 'dart:async';
import 'package:flutter/material.dart';
import 'package:unazin/screens/home.dart';
import 'package:unazin/components/app_footer.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    // Timer de 4 segundos para ir para a Home
    Timer(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            // IMPORTANTE: Aqui passamos sem o 'const' para garantir
            // que as animações internas da Home (como o Flip) iniciem corretamente.
            builder: (context) => MyHomePage(title: 'Unaerp Mobile'),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      body: Stack(
        children: [
          // --- CAMADA 1: O FOOTER NO TOPO (Background) ---
          // Usamos IgnorePointer para que o usuário não interaja com o fundo durante o loading
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: IgnorePointer(child: const UnaerpFooter()),
          ),

          // --- CAMADA 2: OVERLAY ESCURO (50% OPACIDADE) ---
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.5)),
          ),

          // --- CAMADA 3: O LOADER CENTRALIZADO ---
          Center(
            child: Container(
              width: 280,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF001D54), // Azul escuro
                borderRadius: BorderRadius.circular(12),              
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Ícone de Refresh/Sync Giratório
                  RotationTransition(
                    turns: _controller,
                    child: const Icon(
                      Icons.sync,
                      color: Color(0xFFFFD700), // Amarelo Unaerp
                      size: 50,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Carregando, aguarde...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
