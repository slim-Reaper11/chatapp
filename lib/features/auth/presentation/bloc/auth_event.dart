import 'package:chatapp/features/auth/data/models/login_request.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class RegisterRequested extends AuthEvent {
  const RegisterRequested();
}

final class LoginRequested extends AuthEvent {
  const LoginRequested({required this.request});

  final LoginRequest request;
}

final class LogoutRequested extends AuthEvent {
  const LogoutRequested();
}
