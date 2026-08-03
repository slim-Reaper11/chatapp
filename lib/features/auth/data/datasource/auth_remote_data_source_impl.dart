import 'package:chatapp/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:chatapp/features/auth/data/models/login_request.dart';
import 'package:chatapp/features/auth/data/models/register_request.dart';
import 'package:chatapp/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<User> register(RegisterRequest request) async {
    final response = await dio.post(
      'users/register',
      data: {"username": request.userName, "password": request.password},
    );

    return User(username: request.userName, token: response.data);
  }

  @override
  Future<User> login(LoginRequest request) async {
    // if (request.userName == 'admin' && request.password == 'admin') {
    //   return User(username: 'admin', token: 'admin');
    // }
    final response = await dio.post(
      'users/login',
      data: {"username": request.userName, "password": request.password},
    );

    return User(username: request.userName, token: response.data);
  }
}
