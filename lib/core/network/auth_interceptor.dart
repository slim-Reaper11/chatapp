import 'package:chatapp/core/storage/secure_storage.dart';
import 'package:chatapp/features/auth/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required this.authRepository,
    required this.secureStorage,
    required this.dio,
  });

  final AuthRepository authRepository;
  final SecureStorage secureStorage;
  final Dio dio;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final requiresAuth = options.extra['requiresAuth'] == true;

    if (!requiresAuth) {
      return handler.next(options);
    }
    final accessToken = await secureStorage.getAccessToken();

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }
    final requiresAuth = err.requestOptions.extra['requiresAuth'] == true;

    if (!requiresAuth) {
      return handler.next(err);
    }
    try {
      await authRepository.refreshToken();
      final response = await dio.fetch(err.requestOptions);
      return handler.resolve(response);
    } catch (e) {
      return handler.next(err);
    }
  }
}
