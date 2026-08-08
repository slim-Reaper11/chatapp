class RegisterRequest {
  const RegisterRequest({
    required this.userName,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.picture,
  });
  final String userName;
  final String password;
  final String firstName;
  final String lastName;
  final String? picture;
}
