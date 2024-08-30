
class LoginResponse {
  final String status;

  LoginResponse({required this.status});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
    );
  }
}
