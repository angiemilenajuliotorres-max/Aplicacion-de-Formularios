import 'package:flutter/material.dart';

class LoginFormController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu usuario';
    }
    if (value.length < 3) {
      return 'El usuario debe tener al menos 3 caracteres';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor ingresa tu contraseña';
    }
    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
    return null;
  }

  void clearControllers() {
    usernameController.clear();
    passwordController.clear();
  }

  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
  }

  String getUsername() => usernameController.text.trim();
  String getPassword() => passwordController.text;
}
