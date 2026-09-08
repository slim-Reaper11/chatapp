class User {
  const User({
    required this.username,
    required this.id,
    required this.firstName,
    required this.lastName,
  });
  final String username;
  final String id;
  final String firstName;
  final String lastName;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json["username"] as String,
      id: json["id"] as String,
      firstName: json["firstName"] as String,
      lastName: json["lastName"] as String,
    );
  }
}
