import 'package:chatapp/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:chatapp/features/auth/data/models/login_request.dart';
import 'package:chatapp/features/auth/data/models/register_request.dart';
import 'package:chatapp/features/auth/data/models/token_model.dart';
import 'dart:developer' as developer;

import 'package:dio/dio.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<Token> register(RegisterRequest request) async {
    try {
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
    } on DioException catch (e) {
      final error = getError(e);
      throw error;
    }
  }

  @override
  Future<Token> login(LoginRequest request) async {
    try {
      final response = await dio.post(
        'users/login',
        data: {"username": request.userName, "password": request.password},
      );

      return Token.fromJson(response.data);
    } on DioException catch (e) {
      final error = getError(e);
      throw error;
    }
  }

  @override
  Future<Token> refresh(String token) async {
    try {
      final response = await dio.post(
        'users/token/refresh',
        data: {"tokenValue": token},
      );

      return Token.fromJson(response.data);
    } on DioException catch (e) {
      final error = getError(e);
      throw error;
    }
  }
}

Exception getError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return Exception("The connection timed out. Please try again.");
    case DioExceptionType.badResponse:
      // Handle explicit HTTP status codes
      return Exception(_handleStatusCode(error.response?.statusCode));
    case DioExceptionType.cancel:
      return Exception("The request was cancelled.");
    case DioExceptionType.connectionError:
      return Exception("No internet connection detected.");
    default:
      return Exception("Something went wrong. Please try again.");
  }
}

String _handleStatusCode(int? statusCode) {
  switch (statusCode) {
    case 400:
      return "Bad request syntax.";
    case 401:
      return "Unauthorized access.";
    case 403:
      return "Forbidden action.";
    case 404:
      return "Requested resource not found.";
    case 500:
      return "Internal server error.";
    default:
      return "Received invalid status code: $statusCode";
  }
}
