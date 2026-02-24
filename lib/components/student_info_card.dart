import 'package:flutter/material.dart';

class StudentInfoCard extends StatelessWidget {
  const StudentInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // AQUI: Padding reduzido (12 vertical para ficar mais compacto)
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(110, 0, 0, 0).withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel('CURSO'),
          // Espaço zero ou minúsculo entre label e valor
          const SizedBox(height: 2),

          const Text(
            'Engenharia de Software',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 15,
              // AJUSTE: w600 é um negrito mais suave que o Bold padrão
              fontWeight: FontWeight.w600,
              color: Colors.black87,
              height: 1.1, // Altura da linha reduzida para aproximar
            ),
          ),

          const SizedBox(height: 10), // Reduzi o espaço entre blocos

          _buildLabel('USUÁRIO GOOGLE EDUCATION'),
          const SizedBox(height: 2),

          const Text(
            'gabriel.lasilva@sou.unaerp.edu.br',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14, // Um pouco menor que o título
              // AJUSTE: w500 (Medium) para não ficar muito fino/apagado
              fontWeight: FontWeight.w500,
              color: Colors.black87,
              height: 1.1,
            ),
          ),

          const SizedBox(height: 14),

          // Linha de baixo
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCompactColumn('ANO/SEM.', '2024/2'),
              const SizedBox(width: 24),
              _buildCompactColumn('ETAPA', '8'),
              const SizedBox(width: 24),
              _buildCompactColumn('CURR.', '1147'),
              const SizedBox(width: 24),
              // Flexible para garantir que o campus não quebre linha errado se for grande
              Flexible(child: _buildCompactColumn('CAMPUS', 'Ribeirão Preto')),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 10,
        color: Colors.grey[600],
        fontWeight: FontWeight.normal,
        letterSpacing: 0.3,
      ),
    );
  }

  Widget _buildCompactColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label),
        const SizedBox(height: 1), // Bem coladinho
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 13, // Levemente menor para hierarquia
            fontWeight: FontWeight.w600, // SemiBold para os números
            color: Colors.black87,
            height: 1.1,
          ),
        ),
      ],
    );
  }
}
