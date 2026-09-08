import 'package:chatapp/core/di/injection_container.dart';
import 'package:chatapp/features/user%20profile/data/datasource/user_profile_datasource.dart';
import 'package:chatapp/features/user%20profile/domain/repository/User_profile_repository.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final dataSource = sl<UserProfileDatasource>();
  @override
  Future<void> getUser() async {
    await dataSource.getUser();
  }
}
