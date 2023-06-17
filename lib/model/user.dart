class User {
  final int id;
  final String name;
  final String email;
  final String adresse;
  final int role;
  final String login;
  final String password;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.adresse,
    required this.role,
    required this.login,
    required this.password,
  });
  factory User.fromjson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'] ?? "null",
      email: json['email'],
      adresse: json['adresse'] ?? "null",
      role: json['role'],
      login: json['login'],
      password: json['password'],
    );
  }
}
