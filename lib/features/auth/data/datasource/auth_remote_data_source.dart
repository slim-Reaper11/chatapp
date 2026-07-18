import 'package:chatapp/features/auth/data/models/login_request.dart';
import 'package:chatapp/features/auth/data/models/token_model.dart';

abstract class AuthRemoteDataSource {
  // Future<User> register(RegisterRequest request);

  Future<Token> login(LoginRequest request);

  // Future<Token> refreshToken(String refreshToken);
}
