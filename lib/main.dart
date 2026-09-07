import 'package:chatapp/core/di/injection_container.dart';
import 'package:chatapp/core/storage/secure_storage.dart';
import 'package:chatapp/features/auth/domain/repository/auth_repository.dart';
import 'package:chatapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chatapp/features/auth/presentation/bloc/auth_event.dart';
import 'package:chatapp/features/auth/presentation/pages/auth_view.dart';
import 'package:chatapp/features/user%20profile/presentation/bloc/user_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupDependencies();
  runApp(
    ChatApp(
      authRepository: sl<AuthRepository>(),
      secureStorage: sl<SecureStorage>(),
    ),
  );
}

class ChatApp extends StatelessWidget {
  const ChatApp({
    super.key,
    required this.authRepository,
    required this.secureStorage,
  });

  final AuthRepository authRepository;

  final SecureStorage secureStorage;

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 0, 251, 255),
      brightness: Brightness.light,
    );
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: colorScheme.surface,
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
          ),
          bodyLarge: TextStyle(fontWeight: FontWeight.w400),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: colorScheme.primary, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: BorderSide(color: colorScheme.error, width: 2),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(58),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(29),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),

      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      home: BlocProvider(
        create: (context) => sl<AuthBloc>()..add(AuthStarted()),

        // AuthBloc(repository: authRepository)..add(AuthStarted()),
        child: AuthView(),
      ),
    );
  }
}
