import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Config/app_config.dart';
import '../Models/Requests/registration_request.dart';
import '../Models/Responses/registration_response.dart';

class SignUpViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isTermsAccepted = false;
  String _statusMessage = '';
  bool isButtonEnabled = false;

  SignUpViewModel() {
    nameController.addListener(_checkFormValidity);
    phoneController.addListener(_checkFormValidity);
    passwordController.addListener(_checkFormValidity);
  }

  String get statusMessage => _statusMessage;

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _checkFormValidity() {
    isButtonEnabled = nameController.text.isNotEmpty && phoneController.text.isNotEmpty && passwordController.text.isNotEmpty && isTermsAccepted;
    notifyListeners();
  }

  void updateTermsAccepted(bool value) {
    isTermsAccepted = value;
    _checkFormValidity();
  }

  Future<bool> registerUser() async {
    final url = Uri.parse('${AppConfig.mainUrl}/user/register');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(RegistrationRequest(
          login: nameController.text,
          password: passwordController.text,
          phone: phoneController.text,
        ).toJson()),
      );

      if (response.statusCode == 200) {
        final registrationResponse = RegistrationResponse.fromJson(jsonDecode(response.body));
        _statusMessage = registrationResponse.message;
        notifyListeners();
        return true;
      } else {
        final errorResponse = jsonDecode(response.body);
        _statusMessage = errorResponse['message'] ?? 'Failed to register';
        notifyListeners();
        return false;
      }
    } catch (e) {
      _statusMessage = 'Failed to register: $e';
      notifyListeners();
      return false; // Ошибка
    }
  }

}