import 'package:dartz/dartz.dart';
import 'package:quick_send/core/error/error.dart';

abstract class AuthRepository {
  Future<Either<Failure, Map<String, dynamic>>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, Map<String, dynamic>>> signup({
    required String email,
    required String password,
  });

  Future<bool> hasSession();
}
