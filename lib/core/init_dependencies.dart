import 'package:get_it/get_it.dart';
import 'package:spendify/core/constant/app.config.dart';
import 'package:spendify/features/auth/data/datasources/auth_remote.data_source.dart';
import 'package:spendify/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:spendify/features/auth/domain/repository/auth.repository.dart';
import 'package:spendify/features/auth/domain/usecases/user_sign_up.dart';
import 'package:spendify/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  final supabase = await Supabase.initialize(
      url: AppConfig.DB_URL, anonKey: AppConfig.DB_KEY);
  serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(serviceLocator()));
  serviceLocator.registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator()));
  serviceLocator.registerFactory(() => UserSignUp(serviceLocator()));
  serviceLocator
      .registerLazySingleton(() => AuthBloc(userSignUp: serviceLocator()));
}
