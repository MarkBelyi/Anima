class CodeResponse {
  final String status;
  final String message;

  CodeResponse({required this.status, required this.message});

  factory CodeResponse.fromJson(Map<String, dynamic> json) {
    return CodeResponse(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
