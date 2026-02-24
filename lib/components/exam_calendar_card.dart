import 'package:flutter/material.dart';

class ExamCalendarCard extends StatelessWidget {
  const ExamCalendarCard({super.key});

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
          // Título
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Row(
              children: [
                Icon(Icons.calendar_month, color: Color(0xFF0055AA), size: 22),
                SizedBox(width: 8),
                Text(
                  'Calendário de Provas',
                  style: TextStyle(
                    color: Color(0xFF0055AA),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Divider Grande
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: 4,
              width: double.infinity,
              color: const Color(0xFFEFEFEF),
            ),
          ),

          // Área do Calendário com Sombra Interna
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
                border: Border.all(color: const Color(0xFFE0E0E0)),
              ),
              child: Column(
                children: [
                  // Navegação do Mês
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildCalendarArrow(Icons.chevron_left),
                        const Text(
                          'Fevereiro 2026',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF444444),
                          ),
                        ),
                        _buildCalendarArrow(Icons.chevron_right),
                      ],
                    ),
                  ),

                  // Tabela
                  Table(
                    border: TableBorder.all(
                      color: const Color(0xFFE0E0E0),
                      width: 1,
                    ),
                    children: [
                      TableRow(
                        decoration: const BoxDecoration(
                          color: Color(0xFFF2F2F2),
                        ),
                        children:
                            ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab']
                                .map(
                                  (day) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    child: Center(
                                      child: Text(
                                        day,
                                        style: const TextStyle(
                                          color: Color(0xFF666666),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                      _buildCalendarRow(['1', '2', '3', '4', '5', '6', '7']),
                      _buildCalendarRow([
                        '8',
                        '9',
                        '10',
                        '11',
                        '12',
                        '13',
                        '14',
                      ]),
                      _buildCalendarRow([
                        '15',
                        '16',
                        '17',
                        '18',
                        '19',
                        '20',
                        '21',
                      ]),
                      _buildCalendarRow([
                        '22',
                        '23',
                        '24',
                        '25',
                        '26',
                        '27',
                        '28',
                      ]),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TableRow _buildCalendarRow(List<String> days) {
    return TableRow(
      children: days.map((day) {
        bool isSelected = day == '9';
        return Container(
          color: isSelected ? const Color(0xFF3182CE) : Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
            child: Text(
              day,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? Colors.white : const Color(0xFF333333),
                fontSize: 13,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // Widget das Setas atualizado
  Widget _buildCalendarArrow(IconData icon) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFE0E0E0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: Color(0xFFBDBDBD), // Cinza do fundo da seta
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 18, color: Colors.white),
        ),
      ),
    );
  }
}
