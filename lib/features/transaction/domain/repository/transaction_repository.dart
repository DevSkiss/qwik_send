import 'package:dartz/dartz.dart';
import 'package:quick_send/core/error/error.dart';
import 'package:quick_send/features/transaction/data/models/transaction_model_dto.dart';

abstract class TransactionRepository {
  Future sendPayment({required String senderId, required double amount});
  Future<Either<Failure, List<TransactionModelDto>>> getAllTransactions({
    required String senderId,
  });
}
