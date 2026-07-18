import 'package:chatapp/features/auth/domain/repository/auth_repository.dart';
import 'package:chatapp/features/auth/presentation/bloc/auth_event.dart';
import 'package:chatapp/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<LoginRequested>(_loginPressed);
  }
  final AuthRepository repository;

  void _loginPressed(LoginRequested event, Emitter emit) async {
    emit(AuthLoading());

    try {
      final token = await repository.login(event.request);
      emit(AuthSuccess(token: token));
    } catch (e) {
      emit(AuthFailure(e: e.toString()));
    }
  }
}
