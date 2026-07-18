import 'package:chatapp/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:chatapp/features/auth/data/models/login_request.dart';
import 'package:chatapp/features/auth/data/models/token_model.dart';

class FakeAuthDataSource implements AuthRemoteDataSource {
  @override
  Future<Token> login(LoginRequest request) async {
    await Future.delayed(const Duration(seconds: 2));

    if (request.userName == "ali" && request.password == "1234") {
      return const Token(
        accessToken: "fake_access",
        refreshToken: "fake_refresh",
      );
    }

    throw Exception("Wrong credentials");
  }
}
