import 'dart:io'; // Importante para lidar com File
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unazin/services/student_controller.dart';

class StudentDetailCard extends StatefulWidget {
  const StudentDetailCard({super.key});

  @override
  State<StudentDetailCard> createState() => _StudentDetailCardState();
}

class _StudentDetailCardState extends State<StudentDetailCard> {
  final StudentController _studentController = StudentController();
  final ImagePicker _picker = ImagePicker();
  
  int _clickCount = 0;
  String _name = 'Carregando...';
  String _lastName = '';
  String _id = '';
  String _photo = ''; // Pode ser URL ou caminho de arquivo
  String _course = '';

  @override
  void initState() {
    super.initState();
    _loadStoredData();
  }

  Future<void> _loadStoredData() async {
    final data = await _studentController.loadStudentData();
    setState(() {
      _name = data['name']!;
      _lastName = data['lastName']!;
      _id = data['id']!;
      _photo = data['photo']!;
      _course = data['course']!;
    });
  }

  // FUNÇÃO PARA PEGAR IMAGEM DA GALERIA
  Future<void> _pickImage(TextEditingController photoController) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      photoController.text = image.path; // Define o caminho no campo de texto
    }
  }

  // Widget para exibir a imagem de forma inteligente (Rede ou Local)
  ImageProvider _getProfileImage(String path) {
    if (path.startsWith('http')) {
      return NetworkImage(path);
    } else if (path.isNotEmpty && File(path).existsSync()) {
      return FileImage(File(path));
    }
    return const NetworkImage('https://i.pravatar.cc/150?u=default');
  }

  void _showEditBottomSheet(BuildContext context) {
    final nameController = TextEditingController(text: _name);
    final lastNameController = TextEditingController(text: _lastName);
    final idController = TextEditingController(text: _id);
    final photoController = TextEditingController(text: _photo);
    String tempCourse = _course;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20, right: 20, top: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Configurações do Aluno', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              TextField(controller: nameController, decoration: const InputDecoration(labelText: 'Nome', border: OutlineInputBorder())),
              const SizedBox(height: 12),
              TextField(controller: lastNameController, decoration: const InputDecoration(labelText: 'Sobrenome', border: OutlineInputBorder())),
              const SizedBox(height: 12),
              
              // CAMPO DE FOTO COM BOTÃO DE GALERIA
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: photoController,
                      decoration: const InputDecoration(labelText: 'Caminho/URL da Foto', border: OutlineInputBorder()),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton.filled(
                    onPressed: () => _pickImage(photoController),
                    icon: const Icon(Icons.photo_library),
                    style: IconButton.styleFrom(backgroundColor: const Color(0xFF2F749B)),
                  ),
                ],
              ),
              
              const SizedBox(height: 12),
              DropdownButtonFormField<String>(
                value: tempCourse.isNotEmpty ? tempCourse : null,
                items: ['Engenharia', 'Medicina', 'Direito', 'Psicologia', 'Administração']
                    .map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                onChanged: (value) => tempCourse = value!,
                decoration: const InputDecoration(labelText: 'Curso', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2F749B)),
                  onPressed: () async {
                    await _studentController.saveStudentData(
                      name: nameController.text,
                      lastName: lastNameController.text,
                      id: idController.text,
                      photoUrl: photoController.text,
                      course: tempCourse,
                    );
                    _loadStoredData();
                    if (context.mounted) Navigator.pop(context);
                  },
                  child: const Text('Salvar Alterações', style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              _clickCount++;
              if (_clickCount >= 10) {
                _clickCount = 0;
                _showEditBottomSheet(context);
              }
            },
            child: Container(
              width: 80,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  image: _getProfileImage(_photo), // Lógica de exibição aqui
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_name, style: TextStyle(fontSize: 22, color: const Color(0xFF2F749B), fontWeight: FontWeight.bold)),
                Text(_lastName, style: const TextStyle(fontSize: 13, color: Color(0xFF757575))),
                const SizedBox(height: 10),
                Container(height: 4, width: double.infinity, color: const Color(0xFFEFEFEF)),
                const SizedBox(height: 10),
                const Text('CÓDIGO ALUNO', style: TextStyle(fontSize: 10, color: Color(0xFF9E9E9E), fontWeight: FontWeight.bold)),
                Text(_id, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF424242))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}