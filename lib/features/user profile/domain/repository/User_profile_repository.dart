import 'package:chatapp/features/auth/data/models/user_model.dart';

abstract class UserProfileRepository {

  Future<User> getUser();
}