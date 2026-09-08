import 'dart:developer' as developer;
import 'package:chatapp/core/di/injection_container.dart';
import 'package:chatapp/core/network/dio_client.dart';
import 'package:chatapp/features/auth/data/models/current_user.dart';
import 'package:chatapp/features/auth/data/models/user_model.dart';
import 'package:chatapp/features/user%20profile/data/datasource/user_profile_datasource.dart';
import 'package:dio/dio.dart';

class UserProfileDatasourceImpl implements UserProfileDatasource {
  final dio = sl<DioClient>().dio;
  @override
  Future<void> getUser() async {
    try {
      final response = await dio.get(
        'users/profile',

        options: Options(extra: {'requiresAuth': true}),
      );

      final user = User.fromJson(response.data);

      sl<CurrentUser>().setUser(user);
    } catch (e) {}
  }
}
