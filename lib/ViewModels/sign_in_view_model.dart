import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Config/app_config.dart';
import '../Models/Requests/login_request.dart';
import '../Models/Responses/login_response.dart';

class SignInViewModel extends ChangeNotifier {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String _statusMessage = '';

  bool isButtonEnabled = false;

  SignInViewModel() {
    loginController.addListener(_checkFormValidity);
    passwordController.addListener(_checkFormValidity);
  }

  String get statusMessage => _statusMessage;

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _checkFormValidity() {
    isButtonEnabled = loginController.text.isNotEmpty && passwordController.text.isNotEmpty;
    notifyListeners();
  }

  Future<void> loginUser() async {
    final url = Uri.parse('${AppConfig.mainUrl}/user/login');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(LoginRequest(login: loginController.text, password: passwordController.text).toJson()),
      );

      if (response.statusCode == 200) {
        final loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
        _statusMessage = loginResponse.message;
      } else {
        final errorResponse = jsonDecode(response.body);
        _statusMessage = errorResponse['message'] ?? 'Failed to login';
      }
    } catch (e) {
      _statusMessage = 'Failed to login: $e';
    }
    notifyListeners();
  }

}