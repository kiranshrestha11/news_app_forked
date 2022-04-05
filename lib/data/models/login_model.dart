class LoginModel {
  final String name;
  final String email;
  final String password;

  const LoginModel({
    required this.password,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
      };
}
