import 'package:chatapp/features/auth/data/models/user_model.dart';

abstract class UserProfileDatasource {
  Future<void> getUser();
}
