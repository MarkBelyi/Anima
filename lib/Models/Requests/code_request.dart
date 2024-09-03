class CodeRequest {
  final String phone;

  CodeRequest({required this.phone});

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
    };
  }
}
