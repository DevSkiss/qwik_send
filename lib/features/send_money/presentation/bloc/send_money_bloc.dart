import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_send/core/services/cached_service.dart';
import 'package:quick_send/core/services/di/dependency_injector.dart';
import 'package:quick_send/features/send_money/presentation/bloc/send_money_state.dart';
import 'package:quick_send/features/transaction/domain/repository/transaction_repository.dart';

class SendMoneyBloc extends Cubit<SendMoneyState> {
  SendMoneyBloc() : super(SendMoneyState()) {
    initialized();
  }
  final txn = locator<TransactionRepository>();
  final cache = locator<CachedService>();

  void initialized() async {}

  Future sendMoney(String amount) async {
    final user = await cache.getCacheUserData();
    if (user != null) {
      final cleanAmount = amount.replaceAll('P', '');
      emit(state.copyWith(isLoading: true));

      final result = await txn.sendPayment(
        senderId: user.id ?? '',
        amount: double.tryParse(cleanAmount) ?? 0,
      );
      result.fold(
        (failure) {
          emit(state.copyWith(isLoading: false, errorText: failure.message));
        },
        (success) {
          emit(
            state.copyWith(
              isLoading: false,
              successText: 'Successfully sent \P${amount}',
            ),
          );
        },
      );
    } else {
      emit(state.copyWith(errorText: 'User not found'));
      emit(state.copyWith(errorText: null));
    }
    emit(state.copyWith(errorText: null, successText: null));
  }
}
