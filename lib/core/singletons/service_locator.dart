import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:test_project/core/singletons/dio_settings.dart';
import 'package:test_project/core/singletons/storage/storage.dart';
import 'package:test_project/features/auth/data/datasource/authentication_datasource.dart';
import 'package:test_project/features/auth/data/repositories/login_repository_impl.dart';
import 'package:test_project/features/auth/domain/repositories/authentication_repository.dart';

final serviceLocator = GetIt.instance;

Future<void> setupLocator() async {
  await StorageRepository.getInstance();
  serviceLocator.registerLazySingleton(() => DioSettings());

  //Authentication
  serviceLocator.registerLazySingleton<AuthenticationDataSource>(() => AuthenticationDataSourceImpl());
  serviceLocator.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImpl());
}
