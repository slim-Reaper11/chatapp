import 'package:chatapp/core/di/injection_container.dart';
import 'package:chatapp/features/auth/data/models/current_user.dart';
import 'package:chatapp/features/auth/data/models/user_model.dart';
import 'package:chatapp/features/user%20profile/domain/repository/User_profile_repository.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  @override
  Future<User> getUser() async {
    await Future.delayed(Duration(seconds: 2));
    return sl<CurrentUser>().user!;
  }
}
