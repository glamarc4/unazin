import 'package:flutter/material.dart';
import 'package:unazin/components/custom_navegation_button.dart'; // Certifique-se que o caminho está correto

class LastGradesCard extends StatelessWidget {
  const LastGradesCard({super.key});

  @override
  Widget build(BuildContext context) {
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
          // 1. Título do Card
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Row(
              children: [
                Icon(Icons.edit, color: Color(0xFF0055AA), size: 22),
                SizedBox(width: 8),
                Text(
                  'Últimas Notas Lançadas',
                  style: TextStyle(
                    color: Color(0xFF0055AA),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // 2. Divider Grande (O "Respiro")
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 4,
              width: double.infinity,
              color: const Color(0xFFEFEFEF),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // 3. Cabeçalho da Tabela (Categorias)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Disciplina',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'Tipo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'Nota',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),

                // 4. Divider Pequeno após categorias
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFEFEFEF),
                  ),
                ),

                // 5. Mensagem de vazio (Texto)
                const Text(
                  'Não há notas lançadas recentemente para 2024/2.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),

                // 6. Outro Divider Pequeno antes dos botões
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFEFEFEF),
                  ),
                ),

                const SizedBox(height: 4),

                // 7. Botões utilizando o componente reaproveitável
                CustomNavigationButton(
                  text: 'Atualizar',
                  icon: Icons.refresh,
                  onTap: () {
                    // Lógica para atualizar
                  },
                ),

                const SizedBox(height: 8),

                CustomNavigationButton(
                  text: 'Visualizar boletim',
                  icon: Icons.chevron_right,
                  onTap: () {
                    // Lógica para abrir boletim
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
