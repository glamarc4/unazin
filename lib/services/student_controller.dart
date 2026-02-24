import 'package:shared_preferences/shared_preferences.dart';

class StudentController {
  // Chaves para o Storage
  static const String _keyName = 'name';
  static const String _keyLastName = 'lastName';
  static const String _keyId = 'id';
  static const String _keyPhoto = 'photo';
  static const String _keyCourse = 'course';

  // Salva os dados no SharedPreferences
  Future<void> saveStudentData({
    required String name,
    required String lastName,
    required String id,
    required String photoUrl,
    required String course,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyName, name);
    await prefs.setString(_keyLastName, lastName);
    await prefs.setString(_keyId, id);
    await prefs.setString(_keyPhoto, photoUrl);
    await prefs.setString(_keyCourse, course);
  }

  // Carrega os dados ou retorna valores padrão se estiver vazio
  Future<Map<String, String>> loadStudentData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString(_keyName) ?? 'Gabriel',
      'lastName': prefs.getString(_keyLastName) ?? 'Lamarca Galdino Da Silva',
      'id': prefs.getString(_keyId) ?? '836666',
      'photo': prefs.getString(_keyPhoto) ?? 'https://i.pravatar.cc/150?u=836666',
      'course': prefs.getString(_keyCourse) ?? 'Engenharia',
    };
  }
}