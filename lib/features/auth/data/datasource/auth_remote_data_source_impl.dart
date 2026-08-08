import 'package:chatapp/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:chatapp/features/auth/data/datasource/token_storage.dart';
import 'package:chatapp/features/auth/data/models/login_request.dart';
import 'package:chatapp/features/auth/data/models/register_request.dart';
import 'package:chatapp/features/auth/data/models/token_model.dart';
import 'package:chatapp/features/auth/data/models/user_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<Token> register(RegisterRequest request) async {
    final response = await dio.post(
      'users/register',
      data: {
        "username": request.userName,
        "password": request.password,
        "firstName": request.firstName,
        "lastName": request.lastName,
        "picture": null,
      },
    );
    return Token.fromJson(response.data);
    // developer.log(token.accessToken, name: 'Token');

    // Map<String, dynamic> decodedToken = JwtDecoder.decode(token.accessToken);
    // developer.log(decodedToken.toString(), name: 'Token');

    // // developer.log(decodedToken, name: 'Token');
    // return User(
    //   id: decodedToken['sub'] as String,
    //   username: decodedToken['preferred_username'] as String,
    //   firstName: decodedToken['given_name'] as String,
    //   lastName: decodedToken['family_name'] as String,
    // );
  }

  @override
  Future<Token> login(LoginRequest request) async {
    // if (request.userName == 'admin' && request.password == 'admin') {
    //   return User(username: 'admin', token: 'admin');
    // }
    final response = await dio.post(
      'users/login',
      data: {"username": request.userName, "password": request.password},
    );

    return Token.fromJson(response.data);
    // developer.log(token.accessToken, name: 'Token');

    // Map<String, dynamic> decodedToken = JwtDecoder.decode(token.accessToken);
    // developer.log(decodedToken.toString(), name: 'Token');

    // // developer.log(decodedToken, name: 'Token');

    // return User(
    //   id: decodedToken['sub'] as String,
    //   username: decodedToken['preferred_username'] as String,
    //   firstName: decodedToken['given_name'] as String,
    //   lastName: decodedToken['family_name'] as String,
    // );
  }
}
