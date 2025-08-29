import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quick_send/features/transaction/data/models/transaction_model_dto.dart';

part 'transaction_state.freezed.dart';

@freezed
abstract class TransactionState with _$TransactionState {
  factory TransactionState({
    @Default(false) bool isLoading,
    @Default(false) bool isFinished,
    List<TransactionModelDto>? transactions,
    String? errorText,
    String? successText,
  }) = _TransactionState;
}
