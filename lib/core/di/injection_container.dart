import 'package:chatapp/core/network/dio_client.dart';
import 'package:chatapp/core/storage/secure_storage.dart';
import 'package:chatapp/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:chatapp/features/auth/data/datasource/auth_remote_data_source_impl.dart';
import 'package:chatapp/features/auth/data/models/current_user.dart';
import 'package:chatapp/features/auth/domain/repository/auth_repository.dart';
import 'package:chatapp/features/auth/domain/repository/auth_repository_impl.dart';
import 'package:chatapp/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chatapp/features/user%20profile/data/datasource/user_profile_datasource.dart';
import 'package:chatapp/features/user%20profile/data/datasource/user_profile_datasource_impl.dart';
import 'package:chatapp/features/user%20profile/domain/repository/User_profile_repository.dart';
import 'package:chatapp/features/user%20profile/domain/repository/user_profile_repository_impl.dart';
import 'package:chatapp/features/user%20profile/presentation/bloc/user_profile_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  sl.registerLazySingleton<SecureStorage>(
    () => SecureStorage(FlutterSecureStorage()),
  );

  sl.registerLazySingleton<DioClient>(() => DioClient());

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl<DioClient>().dio),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      dataSource: sl<AuthRemoteDataSource>(),
      secureStorage: sl<SecureStorage>(),
    ),
  );

  sl<DioClient>().addAuthInterceptor(
    authRepository: sl<AuthRepository>(),
    secureStorage: sl<SecureStorage>(),
  );

  sl.registerLazySingleton<CurrentUser>(() => CurrentUser());

  sl.registerFactory(
    () => AuthBloc(
      repository: sl<AuthRepository>(),
      currentUser: sl<CurrentUser>(),
    ),
  );

  sl.registerLazySingleton<UserProfileDatasource>(
    () => UserProfileDatasourceImpl(),
  );

  sl.registerLazySingleton<UserProfileRepository>(
    () => UserProfileRepositoryImpl(),
  );

  sl.registerFactory<UserProfileBloc>(() => UserProfileBloc());
}
