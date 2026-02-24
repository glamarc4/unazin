import 'package:flutter/material.dart';
import 'package:unazin/components/custom_modal_picker.dart';
// Importe o seu componente aqui
// import 'package:seu_projeto/components/custom_modal_picker.dart';

class AlterarCursoModal extends StatefulWidget {
  const AlterarCursoModal({super.key});

  @override
  State<AlterarCursoModal> createState() => _AlterarCursoModalState();
}

class _AlterarCursoModalState extends State<AlterarCursoModal> {
  // Variáveis para controlar o estado dos textos na tela
  String cursoAtivo = 'ENGENHARIA DE SOFTWARE';
  String campusAtivo = 'CAMPUS I - RIBEIRAO PRETO - RIBEIRANIA';
  String semestreAtivo = '2024/2';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header Cinza
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const BoxDecoration(
                    color: Color(0xFFE9E9E9),
                    border: Border(
                      bottom: BorderSide(color: Color(0xFFDDDDDD)),
                    ),
                  ),
                  child: const Text(
                    'Alterar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF343434),
                    ),
                  ),
                ),
                // Conteúdo
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('Curso:'),
                      _buildSelectField(
                        context: context,
                        value: cursoAtivo,
                        title: 'Selecionar Curso',
                        options: [
                          'ENGENHARIA DE SOFTWARE',
                          'DIREITO',
                          'MEDICINA',
                          'ADMINISTRAÇÃO',
                        ],
                        onChanged: (novo) => setState(() => cursoAtivo = novo),
                      ),
                      const SizedBox(height: 15),
                      _buildLabel('Campus:'),
                      _buildSelectField(
                        context: context,
                        value: campusAtivo,
                        title: 'Selecionar Campus',
                        options: [
                          'CAMPUS I - RIBEIRAO PRETO - RIBEIRANIA',
                          'CAMPUS II - CENTRO',
                        ],
                        onChanged: (novo) => setState(() => campusAtivo = novo),
                      ),
                      const SizedBox(height: 15),
                      _buildLabel('Ano/Semestre:'),
                      _buildSelectField(
                        context: context,
                        value: semestreAtivo,
                        title: 'Selecionar Semestre',
                        options: ['2023/1', '2023/2', '2024/1', '2024/2'],
                        onChanged: (novo) =>
                            setState(() => semestreAtivo = novo),
                      ),
                      const SizedBox(height: 25),

                      // Botoes Lado a Lado
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildActionButton(
                            text: 'Alterar',
                            icon: Icons.check,
                            isPrimary: true,
                            onTap: () => Navigator.pop(context),
                          ),
                          const SizedBox(width: 12),
                          _buildActionButton(
                            text: 'Fechar',
                            icon: Icons.cancel,
                            isPrimary: false,
                            onTap: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Botão X flutuante
          Positioned(
            right: -15,
            top: -15,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 34, // Tamanho total do botão
                height: 34,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFA9A9A9), // Fundo escuro
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ), // Borda branca grossa
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Primeira barra do X
                      Transform.rotate(
                        angle: 0.785398, // 45 graus em radianos
                        child: Container(
                          width: 16, // Comprimento da perna do X
                          height:
                              3, // ESPESSURA - mude aqui para ficar mais grosso
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                      // Segunda barra do X
                      Transform.rotate(
                        angle: -0.785398, // -45 graus em radianos
                        child: Container(
                          width: 16,
                          height:
                              3, // ESPESSURA - mude aqui para ficar mais grosso
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFF444444),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // AQUI É ONDE O SEU COMPONENTE É INSTANCIADO
  Widget _buildSelectField({
    required BuildContext context,
    required String value,
    required String title,
    required List<String> options,
    required Function(String) onChanged,
  }) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => CustomModalPicker(
            title: title,
            options: options,
            selectedOption: value,
            onSelect: onChanged,
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0xFFCCCCCC)),
        ),
        child: Row(
          children: [
            const SizedBox(width: 24),
            Expanded(
              child: Text(
                value,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: Color(0xFFA9A9A9),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String text,
    required IconData icon,
    required bool isPrimary,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: isPrimary
                  ? const Color(0xFF3388CB)
                  : const Color(0xFFF6F6F6),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isPrimary
                  ? [const Color(0xFF4FA0D8), const Color(0xFF3388CB)]
                  : [const Color(0xFFFFFFFF), const Color(0xFFF6F6F6)],
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isPrimary)
                Container(
                  padding: const EdgeInsets.all(1),
                  decoration: const BoxDecoration(
                    color: Color(0xFF2A628E),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    size: 13,
                    color: Colors.white,
                    shadows: [
                      Shadow(blurRadius: 2.0, color: Colors.white),
                      Shadow(offset: Offset(0.5, 0.5), color: Colors.white),
                      Shadow(offset: Offset(-0.5, -0.5), color: Colors.white),
                    ],
                  ),
                )
              else
                Icon(icon, size: 16, color: const Color(0xFF888888)),
              const SizedBox(width: 6),
              Text(
                text,
                style: TextStyle(
                  color: isPrimary ? Colors.white : const Color(0xFF444444),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
