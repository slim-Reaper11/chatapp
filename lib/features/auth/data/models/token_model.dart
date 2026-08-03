class Token {
  const Token({required this.token});
  final String token;

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(token: json["token"]);
  }
}
