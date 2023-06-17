class UserC {
  final String login;

  UserC({
    required this.login,
  });
  factory UserC.fromjson(Map<String, dynamic> json) {
    return UserC(
      login: json['login'],
    );
  }
}
