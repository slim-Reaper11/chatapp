import 'package:chatapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chatapp/features/auth/presentation/bloc/auth_state.dart';
import 'package:chatapp/features/auth/presentation/pages/login_view.dart';
import 'package:chatapp/features/conversations/presentation/pages/conversation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthInitialLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is AuthSuccess) {
          return ConversationPage();
        }

        return LoginView();
      },
    );
  }
}
