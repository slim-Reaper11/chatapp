import 'package:chatapp/core/network/auth_interceptor.dart';
import 'package:chatapp/core/storage/secure_storage.dart';
import 'package:chatapp/features/auth/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';

class DioClient {
  late final Dio dio;

  DioClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: 'http://192.168.1.105:8080/api/',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        ),
      );

  void addAuthInterceptor({
    required AuthRepository authRepository,
    required SecureStorage secureStorage,
  }) {
    dio.interceptors.add(
      AuthInterceptor(
        authRepository: authRepository,
        secureStorage: secureStorage,
        dio: dio,
      ),
    );
  }
}
