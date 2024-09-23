import 'package:flutter/material.dart';

class LoginValidationModel with ChangeNotifier {
  String _email = '';
  String _password = '';

  String? _emailError;
  String? _passwordError;
	bool _isPasswordVisible = false;

  String get email => _email;
  String get password => _password;
  String? get emailError => _emailError;
  String? get passwordError => _passwordError;
	bool get isPasswordVisible => _isPasswordVisible;

  void setEmail(String value) {
    _email = value;
    if (value.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value))
      _emailError = 'E-mail inválido!';
    else _emailError = null;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    if (value.isEmpty) _passwordError = 'Senha inválida!';
    else _passwordError = null;
    notifyListeners();
  }

	void togglePasswordVisibility() {
		_isPasswordVisible = !_isPasswordVisible;
		notifyListeners();
	}

  bool validateForm() {
    setEmail(_email);
    setPassword(_password);
    return _emailError == null && _passwordError == null;
  }
}
