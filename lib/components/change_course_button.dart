import 'package:flutter/material.dart';
// Certifique-se de que o caminho abaixo está correto para o seu projeto
import 'package:unazin/components/alterar_curso_modal.dart'; 

class ChangeCourseButton extends StatelessWidget {
  const ChangeCourseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 36,
      decoration: BoxDecoration(
        color: const Color(0xFF0C77AF),
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) => const AlterarCursoModal(),
            );
          },
          borderRadius: BorderRadius.circular(4),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Color(0xFF085476),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.edit, color: Colors.white, size: 18),
                ),
                Expanded(
                  child: Text(
                    'Alterar curso e ano/semestre',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Arial',
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      shadows: [
                        Shadow(
                          offset: const Offset(1, 1),
                          blurRadius: 2,
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}