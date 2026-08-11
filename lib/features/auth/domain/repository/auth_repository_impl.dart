import 'package:chatapp/core/storage/secure_storage.dart';
import 'package:chatapp/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:chatapp/features/auth/data/models/login_request.dart';
import 'package:chatapp/features/auth/data/models/register_request.dart';
import 'package:chatapp/features/auth/data/models/user_model.dart';
import 'package:chatapp/features/auth/domain/repository/auth_repository.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.dataSource, required this.secureStorage});

  final AuthRemoteDataSource dataSource;
  final SecureStorage secureStorage;

  

  @override
  Future<User> register(RegisterRequest request) async {
    final token = await dataSource.register(request);
    await secureStorage.saveTokens(
      accessToken: token.accessToken,
      refreshToken: token.refreshToken,
      idToken: token.accessToken,
    );
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token.accessToken);

    return User(
      id: decodedToken['sub'] as String,
      username: decodedToken['preferred_username'] as String,
      firstName: decodedToken['given_name'] as String,
      lastName: decodedToken['family_name'] as String,
    );
  }

  @override
  Future<User> login(LoginRequest request) async {
    final token = await dataSource.login(request);
    await secureStorage.saveTokens(
      accessToken: token.accessToken,
      refreshToken: token.refreshToken,
      idToken: token.accessToken,
    );
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token.accessToken);

    return User(
      id: decodedToken['sub'] as String,
      username: decodedToken['preferred_username'] as String,
      firstName: decodedToken['given_name'] as String,
      lastName: decodedToken['family_name'] as String,
    );
  }

  @override
  Future<User?> restoreSession() async {
    final accessToken = await secureStorage.getAccessToken();
    final refreshToken = await secureStorage.getRefreshToken();

    if (accessToken == null || refreshToken == null) {
      return null;
    }

    if (!JwtDecoder.isExpired(accessToken)) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken);

      return User(
        id: decodedToken['sub'] as String,
        username: decodedToken['preferred_username'] as String,
        firstName: decodedToken['given_name'] as String,
        lastName: decodedToken['family_name'] as String,
      );
    }
    if (!JwtDecoder.isExpired(refreshToken)) {
      try {
        final token = await dataSource.refresh(refreshToken);
        await secureStorage.saveTokens(
          accessToken: token.accessToken,
          refreshToken: token.refreshToken,
          idToken: token.accessToken,
        );
        Map<String, dynamic> decodedToken = JwtDecoder.decode(
          token.accessToken,
        );

        return User(
          id: decodedToken['sub'] as String,
          username: decodedToken['preferred_username'] as String,
          firstName: decodedToken['given_name'] as String,
          lastName: decodedToken['family_name'] as String,
        );
      } catch (e) {}
    }
    return null;
  }
}
