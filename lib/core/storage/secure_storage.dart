import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage(this.storage);

  final FlutterSecureStorage storage;

  static const accessTokenKey = 'access_token';
  static const refreshTokenKey = 'refresh_token';
  static const idTokenKey = 'id_token';

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    required String idToken,
  }) async {
    await storage.write(key: accessTokenKey, value: accessToken);

    await storage.write(key: refreshTokenKey, value: refreshToken);

    await storage.write(key: idTokenKey, value: idToken);
  }

  Future<String?> getAccessToken() {
    return storage.read(key: accessTokenKey);
  }

  Future<String?> getRefreshToken() {
    return storage.read(key: refreshTokenKey);
  }

  Future<String?> getIdToken() {
    return storage.read(key: idTokenKey);
  }

  Future<void> clearTokens() async {
    await storage.delete(key: accessTokenKey);
    await storage.delete(key: refreshTokenKey);
    await storage.delete(key: idTokenKey);
  }
}
