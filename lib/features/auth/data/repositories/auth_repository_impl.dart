import 'package:dartz/dartz.dart';
import 'package:quick_send/core/error/error.dart';
import 'package:quick_send/core/models/user_model_dto.dart';
import 'package:quick_send/core/services/cached_service.dart';
import 'package:quick_send/core/services/di/dependency_injector.dart';
import 'package:quick_send/core/services/dio_service.dart';
import 'package:quick_send/features/auth/data/models/auth_model_dto.dart';
import 'package:quick_send/features/auth/domain/repository/auth_repository.dart';
import 'package:quick_send/shared/constants/logger.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ds = locator<DioService>().authClient;
  final cache = locator<CachedService>();

  @override
  Future<Either<Failure, Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) async {
    try {
      final data = await ds.login(email: email, password: password);
      final auth = AuthModelDto.fromJson(data);
      await cache.cacheUserData(UserModelDto(id: auth.id));
      await cache.cacheToken(auth.accessToken ?? '');
      return Right(data);
    } catch (e) {
      logger.e(e);
      return Left(Failure(message: 'Unexpected error: \n$e', exception: e));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> signup({
    required String email,
    required String password,
  }) async {
    try {
      final data = await ds.signup(email: email, password: password);
      final auth = AuthModelDto.fromJson(data);

      await cache.cacheUserData(UserModelDto(id: auth.id));
      await cache.cacheToken(auth.accessToken ?? '');
      return Right(data);
    } catch (e) {
      logger.e(e);
      return Left(Failure(message: 'Unexpected error: \n$e', exception: e));
    }
  }

  @override
  Future<bool> hasSession() async {
    return (await cache.getToken() != null);
  }
}
