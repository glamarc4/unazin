import 'package:flutter/material.dart';
import 'package:unazin/components/custom_navegation_button.dart';

class FinanceCard extends StatelessWidget {
  const FinanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0, // Removida a sombra
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: const BorderSide(
          color: Color(0xFFCECECE),
          width: 1,
        ), // Borda padrão
      ),
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          // 1. Título do Card
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Row(
              children: [
                Icon(
                  Icons.description_outlined,
                  color: Color(0xFF0055AA),
                  size: 22,
                ),
                SizedBox(width: 8),
                const Text(
                  'Boletos para Pagamento',
                  style: TextStyle(
                    color: Color(0xFF0055AA),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // 2. Divider Grande (Respiro)
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
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tipo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'Vencimento',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'Parcela',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'Valor',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'Imprimir',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),

                // 4. Divider Pequeno
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFEFEFEF),
                  ),
                ),

                // 5. Mensagem de vazio
                const Text(
                  'Não há boletos em aberto no momento.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),

                // 6. Outro Divider Pequeno
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFEFEFEF),
                  ),
                ),

                const SizedBox(height: 4),

                // 7. Botão Componentizado
                CustomNavigationButton(
                  text: 'Visualizar extrato financeiro',
                  icon: Icons.chevron_right,
                  onTap: () {
                    // Lógica financeira aqui
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
