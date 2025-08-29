import 'package:dartz/dartz.dart';
import 'package:quick_send/core/error/error.dart';
import 'package:quick_send/core/services/di/dependency_injector.dart';
import 'package:quick_send/core/services/dio_service.dart';
import 'package:quick_send/features/transaction/data/models/transaction_model_dto.dart';
import 'package:quick_send/features/transaction/domain/repository/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final ds = locator<DioService>().transactionDatasource;
  @override
  Future<Either<Failure, List<TransactionModelDto>>> getAllTransactions({
    required String senderId,
  }) async {
    try {
      final response = await ds.getAllTransaction(senderId: 'eq.$senderId');
      final transactions = (response as List)
          .map((e) => TransactionModelDto.fromJson(e))
          .toList();
      return Right(transactions);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendPayment({
    required String senderId,
    required double amount,
  }) async {
    try {
      await ds.sendTransaction(senderId: senderId, amount: amount);
      return Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
