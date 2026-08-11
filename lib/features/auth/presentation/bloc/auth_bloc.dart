import 'package:chatapp/features/auth/domain/repository/auth_repository.dart';
import 'package:chatapp/features/auth/presentation/bloc/auth_event.dart';
import 'package:chatapp/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<LoginRequested>(_loginPressed);
    on<RegisterRequested>(_registerPressed);
    on<AuthStarted>(_onAuthStarted);
  }
  final AuthRepository repository;

  void _loginPressed(LoginRequested event, Emitter emit) async {
    emit(AuthLoading());

    try {
      final user = await repository.login(event.request);
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthFailure(e: e.toString()));
    }
  }

  void _registerPressed(RegisterRequested event, Emitter emit) async {
    emit(AuthLoading());

    try {
      final user = await repository.register(event.request);
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthFailure(e: e.toString()));
    }
  }

  void _onAuthStarted(AuthStarted event, Emitter emit) async {
    emit(AuthInitialLoading());

    try {
      final user = await repository.restoreSession();

      if (user == null) {
        emit(AuthUnauthenticated());
        return;
      }

      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthFailure(e: e.toString()));
    }
  }
}
