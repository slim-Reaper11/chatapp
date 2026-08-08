import 'package:chatapp/core/network/dio_client.dart';
import 'package:chatapp/features/auth/data/datasource/auth_remote_data_source_impl.dart';
import 'package:chatapp/features/auth/data/datasource/token_storage.dart';
import 'package:chatapp/features/auth/domain/repository/auth_repository_impl.dart';
import 'package:chatapp/features/auth/domain/repository/auth_repository.dart';
import 'package:chatapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chatapp/features/auth/presentation/pages/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  final dio = DioClient().dio;
  final authDataSource = AuthRemoteDataSourceImpl(dio);

  final storage = FlutterSecureStorage();
  final tokenStorage = TokenStorage(storage);

  final authRepository = AuthRepositoryImpl(
    dataSource: authDataSource,
    secureStorage: tokenStorage,
  );
  runApp(ChatApp(authRepository: authRepository, tokenStorage: tokenStorage));
}

class ChatApp extends StatelessWidget {
  const ChatApp({
    super.key,
    required this.authRepository,
    required this.tokenStorage,
  });

  final AuthRepository authRepository;

  final TokenStorage tokenStorage;

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
        create: (context) => AuthBloc(repository: authRepository),
        child: LoginView(),
      ),
    );
  }
}
