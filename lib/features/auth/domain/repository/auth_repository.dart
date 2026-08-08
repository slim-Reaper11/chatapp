import 'package:chatapp/features/auth/data/models/login_request.dart';
import 'package:chatapp/features/auth/data/models/register_request.dart';
import 'package:chatapp/features/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<User> register(RegisterRequest request);

  Future<User> login(LoginRequest request);

  // Future<Token> refreshToken(String refreshToken);
}
