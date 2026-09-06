import 'package:chatapp/features/auth/data/models/user_model.dart';

class CurrentUser {
  User? _user;

  User? get user => _user;

  void setUser(User user) {
    _user = user;
  }

  void clear() {
    _user = null;
  }
}
