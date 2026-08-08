import 'package:chatapp/features/auth/data/models/token_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  TokenStorage(this.storage);

  final FlutterSecureStorage storage;

  Future<void> saveToken(Token token) async {
    await storage.write(key: 'access_token', value: token.accessToken);
    await storage.write(key: 'refresh_token', value: token.refreshToken);
    await storage.write(key: 'id_token', value: token.idToken);
  }

  Future<String?> getToken() async {
    return await storage.read(key: 'access_token');
  }

  Future<void> deleteToken() async {
    await storage.delete(key: 'access_token');
  }
}
