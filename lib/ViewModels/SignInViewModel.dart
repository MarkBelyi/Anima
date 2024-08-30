import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/Requests/login_request.dart';
import '../Models/Responses/login_response.dart';

class SignInViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String _message = '';

  bool isSignInButtonEnabled = false;

  SignInViewModel() {
    emailController.addListener(_checkFormValidity);
    passwordController.addListener(_checkFormValidity);
  }

  String get message => _message;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _checkFormValidity() {
    isSignInButtonEnabled = emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
    notifyListeners();
  }

  Future<void> loginUser() async {
    final url = Uri.parse('http://192.168.8.208:5986/user/login');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(LoginRequest(login: emailController.text, password: passwordController.text).toJson()),
      );

      if (response.statusCode == 200) {
        final loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
        _message = loginResponse.status;
      } else {
        _message = 'Failed to login';
      }
    } catch (e) {
      _message = 'Failed to login';
    }
    notifyListeners();
  }
}
