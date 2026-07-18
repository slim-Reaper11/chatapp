import 'package:chatapp/features/auth/data/models/token_model.dart';
import 'package:equatable/equatable.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class AuthSuccess extends AuthState {
  const AuthSuccess({required this.token});

  final Token token;
}

final class AuthFailure extends AuthState {
  const AuthFailure({required this.e});

  final String e;
}
