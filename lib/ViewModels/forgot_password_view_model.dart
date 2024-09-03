import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Config/app_config.dart';
import '../Models/Requests/code_request.dart';
import '../Models/Responses/code_response.dart';

class ForgotPasswordViewModel extends ChangeNotifier{
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  String _statusMessage = '';
  String? _phoneNumber;

  bool isButtonEnabled = false;
  bool showCodeVerificationCard = false;

  ForgotPasswordViewModel() {
    phoneController.addListener(_checkFormValidity);
    codeController.addListener(_checkFormValidity);
  }

  String get statusMessage => _statusMessage;
  String? get phoneNumber => _phoneNumber;

  @override
  void dispose() {
    phoneController.dispose();
    codeController.dispose();
    super.dispose();
  }

  void _checkFormValidity() {
    isButtonEnabled = phoneController.text.isNotEmpty || codeController.text.isNotEmpty;
    notifyListeners();
  }

  Future<void> sendCode() async {
    final url = Uri.parse('${AppConfig.mainUrl}/user/forgot_pass');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(CodeRequest(phone: phoneController.text).toJson()),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final codeResponse = CodeResponse.fromJson(responseData);
        _statusMessage = codeResponse.message;
        _phoneNumber = phoneController.text;
        showCodeVerificationCard = true;
        notifyListeners();
      } else {
        _statusMessage = 'Failed to send reset code';
      }
    } catch (e) {
      _statusMessage = 'Failed to send reset code: $e';
    }

    notifyListeners();
  }

  Future<void> verifyCode() async {
    final code = codeController.text;
    final phone = _phoneNumber;

    if (code.isEmpty || phone == null) {
      _statusMessage = 'Please enter the code and try again';
      notifyListeners();
      return;
    }

    final url = Uri.parse('${AppConfig.mainUrl}/user/verify_code?code=$code');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'phone': phone}),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final codeResponse = CodeResponse.fromJson(responseData);
        _statusMessage = codeResponse.message;
      } else {
        _statusMessage = 'Failed to verify code';
      }
    } catch (e) {
      _statusMessage = 'Failed to verify code: $e';
    }

    notifyListeners();
  }
}
