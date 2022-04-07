class LoginModel {
  final String name;
  final String email;
  final String password;

  const LoginModel({
    required this.password,
    required this.name,
    required this.email,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        password: json['password'], name: json['name'], email: json['email']);
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
      };
}
