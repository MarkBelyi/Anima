class RegistrationRequest {
  final String login;
  final String password;
  final String phone;

  RegistrationRequest({
    required this.login,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
    'login': login,
    'password': password,
    'phone': phone,
  };
}
