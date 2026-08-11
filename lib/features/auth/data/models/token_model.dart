class Token {
  const Token({
    required this.accessToken,
    required this.refreshToken,
    required this.idToken,
  });
  final String accessToken;
  final String refreshToken;
  final String idToken;

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      accessToken: json["access_token"],
      refreshToken: json["refresh_token"],
      idToken: json["id_token"],
    );
  }
}
