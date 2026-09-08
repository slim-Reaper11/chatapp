import 'package:flutter/widgets.dart';

class UserProfileColumn extends StatelessWidget {
  const UserProfileColumn({
    super.key,
    required this.userName,
    required this.firstName,
    required this.lastName,
  });

  final String userName;
  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      spacing: 20,
      children: [Text(userName), Text(firstName), Text(lastName)],
    );
  }
}
