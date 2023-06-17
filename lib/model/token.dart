class Token {
  final String token;
  Token({required this.token});
  factory Token.fromjson(Map<String, dynamic> json) {
    return Token(token: json['token']);
  }
}
