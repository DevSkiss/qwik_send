import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quick_send/core/error/error.dart';
import 'package:quick_send/features/auth/domain/repository/auth_repository.dart';
import 'package:quick_send/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:quick_send/features/auth/presentation/bloc/auth_state.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  group('AuthBloc', () {
    late AuthBloc authBloc;
    late MockAuthRepository mockAuthRepository;

    setUp(() {
      mockAuthRepository = MockAuthRepository();

      // Setup dependency injection for testing
      if (GetIt.instance.isRegistered<AuthRepository>()) {
        GetIt.instance.unregister<AuthRepository>();
      }
      GetIt.instance.registerLazySingleton<AuthRepository>(
        () => mockAuthRepository,
      );

      // Provide default stub for hasSession to avoid null errors
      when(
        () => mockAuthRepository.hasSession(),
      ).thenAnswer((_) async => false);

      authBloc = AuthBloc();
    });

    tearDown(() {
      authBloc.close();
      if (GetIt.instance.isRegistered<AuthRepository>()) {
        GetIt.instance.unregister<AuthRepository>();
      }
    });

    group('initialized', () {
      blocTest<AuthBloc, AuthState>(
        'emits state with hasSession true when repository returns true',
        setUp: () {
          when(
            () => mockAuthRepository.hasSession(),
          ).thenAnswer((_) async => true);
        },
        build: () => authBloc,
        act: (bloc) => bloc.initialized(),
        expect: () => [AuthState(hasSession: true)],
        verify: (_) {
          verify(
            () => mockAuthRepository.hasSession(),
          ).called(2); // Constructor + act
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emits state with hasSession false when repository returns false',
        setUp: () {
          when(
            () => mockAuthRepository.hasSession(),
          ).thenAnswer((_) async => false);
        },
        build: () => authBloc,
        act: (bloc) => bloc.initialized(),
        expect: () => [], // No state change since hasSession was already false
        verify: (_) {
          verify(
            () => mockAuthRepository.hasSession(),
          ).called(2); // Constructor + act
        },
      );
    });

    group('togglePasswordVisibility', () {
      blocTest<AuthBloc, AuthState>(
        'toggles hidePassword from true to false',
        build: () => authBloc,
        act: (bloc) => bloc.togglePasswordVisibility(),
        expect: () => [AuthState(hidePassword: false)],
      );

      blocTest<AuthBloc, AuthState>(
        'toggles hidePassword from false to true',
        build: () => authBloc,
        seed: () => AuthState(hidePassword: false),
        act: (bloc) => bloc.togglePasswordVisibility(),
        expect: () => [AuthState(hidePassword: true)],
      );
    });

    group('toggleConfirmPasswordVisibility', () {
      blocTest<AuthBloc, AuthState>(
        'toggles hideConfirmPassword from true to false',
        build: () => authBloc,
        act: (bloc) => bloc.toggleConfirmPasswordVisibility(),
        expect: () => [AuthState(hideConfirmPassword: false)],
      );

      blocTest<AuthBloc, AuthState>(
        'toggles hideConfirmPassword from false to true',
        build: () => authBloc,
        seed: () => AuthState(hideConfirmPassword: false),
        act: (bloc) => bloc.toggleConfirmPasswordVisibility(),
        expect: () => [AuthState(hideConfirmPassword: true)],
      );
    });

    group('onShowSignup', () {
      blocTest<AuthBloc, AuthState>(
        'sets showSignup to true',
        build: () => authBloc,
        act: (bloc) => bloc.onShowSignup(true),
        expect: () => [AuthState(showSignup: true)],
      );

      blocTest<AuthBloc, AuthState>(
        'sets showSignup to false',
        build: () => authBloc,
        act: (bloc) => bloc.onShowSignup(false),
        expect: () => [], // No state change since showSignup was already false
      );
    });

    group('login', () {
      const email = 'test@example.com';
      const password = 'password123';

      blocTest<AuthBloc, AuthState>(
        'emits loading, success states and resets when login succeeds',
        setUp: () {
          when(
            () => mockAuthRepository.login(email: email, password: password),
          ).thenAnswer((_) async => const Right({'token': 'test_token'}));
        },
        build: () => authBloc,
        act: (bloc) => bloc.login(email: email, password: password),
        expect: () => [
          AuthState(isLoading: true),
          AuthState(
            isLoading: true, // This stays true until the final emit
            successText: 'Login Successful',
            hasSession: true,
          ),
          AuthState(
            isLoading: false,
            errorText: null,
            successText: null,
            hasSession: false,
          ),
        ],
        verify: (_) {
          verify(
            () => mockAuthRepository.login(email: email, password: password),
          ).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emits loading, error states and resets when login fails',
        setUp: () {
          when(
            () => mockAuthRepository.login(email: email, password: password),
          ).thenAnswer((_) async => Left(Failure(message: 'Login failed')));
        },
        build: () => authBloc,
        act: (bloc) => bloc.login(email: email, password: password),
        expect: () => [
          AuthState(isLoading: true),
          AuthState(
            isLoading: true, // This stays true until the final emit
            errorText: 'Invalid email and password',
          ),
          AuthState(
            isLoading: false,
            errorText: null,
            successText: null,
            hasSession: false,
          ),
        ],
        verify: (_) {
          verify(
            () => mockAuthRepository.login(email: email, password: password),
          ).called(1);
        },
      );
    });

    group('signup', () {
      const email = 'test@example.com';
      const password = 'password123';

      blocTest<AuthBloc, AuthState>(
        'emits loading, success states and resets when signup succeeds',
        setUp: () {
          when(
            () => mockAuthRepository.signup(email: email, password: password),
          ).thenAnswer((_) async => const Right({'user_id': 'test_id'}));
        },
        build: () => authBloc,
        act: (bloc) => bloc.signup(email: email, password: password),
        expect: () => [
          AuthState(isLoading: true),
          AuthState(
            isLoading: true, // This stays true until the final emit
            successText: 'Signup Successful',
            hasSession: true,
          ),
          AuthState(
            isLoading: false,
            errorText: null,
            successText: null,
            hasSession: false,
          ),
        ],
        verify: (_) {
          verify(
            () => mockAuthRepository.signup(email: email, password: password),
          ).called(1);
        },
      );

      blocTest<AuthBloc, AuthState>(
        'emits loading, error states and resets when signup fails',
        setUp: () {
          when(
            () => mockAuthRepository.signup(email: email, password: password),
          ).thenAnswer((_) async => Left(Failure(message: 'Signup failed')));
        },
        build: () => authBloc,
        act: (bloc) => bloc.signup(email: email, password: password),
        expect: () => [
          AuthState(isLoading: true),
          AuthState(
            isLoading: true, // This stays true until the final emit
            errorText: 'Account creation failed',
          ),
          AuthState(
            isLoading: false,
            errorText: null,
            successText: null,
            hasSession: false,
          ),
        ],
        verify: (_) {
          verify(
            () => mockAuthRepository.signup(email: email, password: password),
          ).called(1);
        },
      );
    });
  });
}
