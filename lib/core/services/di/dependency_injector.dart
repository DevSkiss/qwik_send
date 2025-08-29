import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:quick_send/app/app_config.dart';
import 'package:quick_send/core/router/app_router.dart';
import 'package:quick_send/core/services/cached_service.dart';
import 'package:quick_send/core/services/dio_service.dart';
import 'package:quick_send/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:quick_send/features/auth/domain/repository/auth_repository.dart';

final locator = GetIt.instance;

Future<void> init({required AppConfig config}) async {
  locator
    ..registerLazySingleton(() => DioService(config: config))
    ..registerLazySingleton<Logger>(Logger.new)
    ..registerLazySingleton<CachedService>(CachedServiceImpl.new)
    ..registerLazySingleton<AppRouter>(AppRouter.new)
    ..registerLazySingleton<FlutterSecureStorage>(FlutterSecureStorage.new)
    // Datasource
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  // Repository

  await locator.allReady();
}
