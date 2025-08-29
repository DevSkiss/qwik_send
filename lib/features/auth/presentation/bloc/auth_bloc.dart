import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_send/core/services/di/dependency_injector.dart';
import 'package:quick_send/features/auth/domain/repository/auth_repository.dart';
import 'package:quick_send/features/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(AuthState()) {
    initialized();
  }

  final repo = locator<AuthRepository>();

  void initialized() async {
    final hasSession = await repo.hasSession();
    emit(state.copyWith(hasSession: hasSession));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(hidePassword: !state.hidePassword));
  }

  void toggleConfirmPasswordVisibility() {
    emit(state.copyWith(hideConfirmPassword: !state.hideConfirmPassword));
  }

  void onShowSignup(bool value) {
    emit(state.copyWith(showSignup: value));
  }

  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(isLoading: true));
    final result = await repo.login(email: email, password: password);
    result.fold(
      (l) => emit(state.copyWith(errorText: 'Invalid email and password')),
      (r) => emit(
        state.copyWith(successText: 'Login Successful', hasSession: true),
      ),
    );
    emit(
      state.copyWith(
        isLoading: false,
        errorText: null,
        successText: null,
        hasSession: false,
      ),
    );
  }

  Future<void> signup({required String email, required String password}) async {
    emit(state.copyWith(isLoading: true));
    final result = await repo.signup(email: email, password: password);
    result.fold(
      (l) => emit(state.copyWith(errorText: 'Account creation failed')),
      (r) => emit(
        state.copyWith(successText: 'Signup Successful', hasSession: true),
      ),
    );
    emit(
      state.copyWith(
        isLoading: false,
        errorText: null,
        successText: null,
        hasSession: false,
      ),
    );
  }
}
