import 'package:chatapp/core/network/dio_client.dart';
import 'package:chatapp/core/storage/secure_storage.dart';
import 'package:chatapp/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:chatapp/features/auth/data/datasource/auth_remote_data_source_impl.dart';
import 'package:chatapp/features/auth/data/models/current_user.dart';
import 'package:chatapp/features/auth/domain/repository/auth_repository.dart';
import 'package:chatapp/features/auth/domain/repository/auth_repository_impl.dart';
import 'package:chatapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  sl.registerLazySingleton<DioClient>(() => DioClient());

  sl.registerLazySingleton<SecureStorage>(
    () => SecureStorage(FlutterSecureStorage()),
  );

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl<DioClient>().dio),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      dataSource: sl<AuthRemoteDataSource>(),
      secureStorage: sl<SecureStorage>(),
    ),
  );
  sl.registerLazySingleton<CurrentUser>(() => CurrentUser());

  sl.registerFactory(
    () => AuthBloc(
      repository: sl<AuthRepository>(),
      currentUser: sl<CurrentUser>(),
    ),
  );
}
