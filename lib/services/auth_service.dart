import 'package:app_form/models/user_model.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();

  factory AuthService() {
    return _instance;
  }

  AuthService._internal();

  User? _currentUser;

  User? get currentUser => _currentUser;

  final Map<String, User> _users = {
    'angie': User(
      id: '1',
      username: 'angie',
      password: 'angie123',
      fullName: 'Angie Julio',
      role: 'Ingeniera de Sistemas',
      profileImage: 'assets/images/angie.jpg',
      bio: 'Ingeniera de Sistemas | Manejo múltiples lenguajes de programación: Dart, Flutter, Python, JavaScript, TypeScript, Java',
    ),
    'carlos': User(
      id: '2',
      username: 'carlos',
      password: 'carlos123',
      fullName: 'Carlos García',
      role: 'Desarrollador Senior',
      bio: 'Desarrollador con más de 10 años de experiencia en tecnología',
    ),
    'maria': User(
      id: '3',
      username: 'maria',
      password: 'maria123',
      fullName: 'María López',
      role: 'Product Manager',
      bio: 'Gestora de productos digitales y desarrollo ágil',
    ),
  };

  Future<bool> login(String username, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    if (_users.containsKey(username)) {
      final user = _users[username]!;
      if (user.password == password) {
        _currentUser = user;
        return true;
      }
    }
    return false;
  }

  void logout() {
    _currentUser = null;
  }

  bool isLoggedIn() {
    return _currentUser != null;
  }
}
