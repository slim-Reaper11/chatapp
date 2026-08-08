import 'package:chatapp/features/auth/data/models/login_request.dart';
import 'package:chatapp/features/auth/data/models/register_request.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class RegisterRequested extends AuthEvent {
  const RegisterRequested({required this.request});

  final RegisterRequest request;
}

final class LoginRequested extends AuthEvent {
  const LoginRequested({required this.request});

  final LoginRequest request;
}

class AuthStarted extends AuthEvent {}

final class LogoutRequested extends AuthEvent {
  const LogoutRequested();
}
