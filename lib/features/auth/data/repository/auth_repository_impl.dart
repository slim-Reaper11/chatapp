import 'package:chatapp/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:chatapp/features/auth/data/models/login_request.dart';
import 'package:chatapp/features/auth/data/models/token_model.dart';
import 'package:chatapp/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this.dataSource);

  final AuthRemoteDataSource dataSource;

  @override
  Future<Token> login(LoginRequest request) {
    return dataSource.login(request);
  }
}
