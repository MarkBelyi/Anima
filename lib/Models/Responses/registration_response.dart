class RegistrationResponse {
  final String status;
  final String message;

  RegistrationResponse({
    required this.status,
    required this.message,
  });

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) {
    return RegistrationResponse(
      status: json['status'] as String,
      message: json['message'] as String,
    );
  }
}
