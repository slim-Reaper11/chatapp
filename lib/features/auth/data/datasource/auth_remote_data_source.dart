import 'package:chatapp/features/auth/data/models/login_request.dart';
import 'package:chatapp/features/auth/data/models/register_request.dart';
import 'package:chatapp/features/auth/data/models/token_model.dart';
import 'package:chatapp/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<Token> register(RegisterRequest request);

  Future<Token> login(LoginRequest request);

  // Future<Token> refreshToken(String refreshToken);
}
