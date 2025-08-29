import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  factory AuthState({
    @Default(false) bool isLoading,
    @Default(false) bool isFinished,
    @Default(false) bool hasSession,
    @Default(true) bool hidePassword,
    @Default(true) bool hideConfirmPassword,
    @Default(false) bool showSignup,
    String? errorText,
    String? successText,
  }) = _AuthState;
}
