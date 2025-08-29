import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_money_state.freezed.dart';

@freezed
abstract class SendMoneyState with _$SendMoneyState {
  factory SendMoneyState({
    @Default(false) bool isLoading,
    @Default(false) bool isFinished,
    String? errorText,
    String? successText,
  }) = _SendMoneyState;
}
