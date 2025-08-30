import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_send/core/services/cached_service.dart';
import 'package:quick_send/core/services/di/dependency_injector.dart';
import 'package:quick_send/features/transaction/domain/repository/transaction_repository.dart';
import 'package:quick_send/features/transaction/presentation/bloc/transaction_state.dart';

class TransactionBloc extends Cubit<TransactionState> {
  TransactionBloc() : super(TransactionState()) {
    initialized();
  }
  final txn = locator<TransactionRepository>();
  final cache = locator<CachedService>();

  void initialized() async {
    await getTransactions();
  }

  Future getTransactions() async {
    final user = await cache.getCacheUserData();
    if (user != null) {
      emit(state.copyWith(isLoading: true));
      log('user id ${user.id}');
      final result = await txn.getAllTransactions(senderId: user.id ?? '');
      result.fold(
        (failure) {
          emit(state.copyWith(isLoading: false, errorText: failure.message));
        },
        (transactions) {
          emit(state.copyWith(isLoading: false, transactions: transactions));
        },
      );
    } else {
      emit(state.copyWith(errorText: 'User not found'));
    }
  }
}
