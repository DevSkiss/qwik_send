import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quick_send/core/error/error.dart';
import 'package:quick_send/core/models/user_model_dto.dart';
import 'package:quick_send/core/services/cached_service.dart';
import 'package:quick_send/features/send_money/presentation/bloc/send_money_bloc.dart';
import 'package:quick_send/features/send_money/presentation/bloc/send_money_state.dart';
import 'package:quick_send/features/transaction/domain/repository/transaction_repository.dart';

class MockTransactionRepository extends Mock implements TransactionRepository {}

class MockCachedService extends Mock implements CachedService {}

void main() {
  group('SendMoneyBloc', () {
    late SendMoneyBloc sendMoneyBloc;
    late MockTransactionRepository mockTransactionRepository;
    late MockCachedService mockCachedService;

    setUp(() {
      mockTransactionRepository = MockTransactionRepository();
      mockCachedService = MockCachedService();

      // Setup dependency injection for testing
      if (GetIt.instance.isRegistered<TransactionRepository>()) {
        GetIt.instance.unregister<TransactionRepository>();
      }
      if (GetIt.instance.isRegistered<CachedService>()) {
        GetIt.instance.unregister<CachedService>();
      }

      GetIt.instance.registerLazySingleton<TransactionRepository>(
        () => mockTransactionRepository,
      );
      GetIt.instance.registerLazySingleton<CachedService>(
        () => mockCachedService,
      );

      sendMoneyBloc = SendMoneyBloc();
    });

    tearDown(() {
      sendMoneyBloc.close();
      if (GetIt.instance.isRegistered<TransactionRepository>()) {
        GetIt.instance.unregister<TransactionRepository>();
      }
      if (GetIt.instance.isRegistered<CachedService>()) {
        GetIt.instance.unregister<CachedService>();
      }
    });

    test('initial state is correct', () {
      expect(
        sendMoneyBloc.state,
        equals(
          SendMoneyState(
            isLoading: false,
            isFinished: false,
            errorText: null,
            successText: null,
          ),
        ),
      );
    });

    group('initialized', () {
      test('completes without error', () async {
        // Since initialized() is an empty async method,
        // we just verify it doesn't throw any exceptions
        expect(() => sendMoneyBloc.initialized(), returnsNormally);
      });
    });

    group('sendMoney', () {
      const testUserId = 'test-user-id';
      const testAmount = '100';
      final testUser = UserModelDto(id: testUserId, name: 'Test User');

      group('when user is found in cache', () {
        setUp(() {
          when(
            () => mockCachedService.getCacheUserData(),
          ).thenAnswer((_) async => testUser);
        });

        blocTest<SendMoneyBloc, SendMoneyState>(
          'emits loading, success states and resets when sendPayment succeeds',
          setUp: () {
            when(
              () => mockTransactionRepository.sendPayment(
                senderId: testUserId,
                amount: 100.0,
              ),
            ).thenAnswer((_) async => const Right('success'));
          },
          build: () => sendMoneyBloc,
          act: (bloc) => bloc.sendMoney(testAmount),
          expect: () => [
            SendMoneyState(isLoading: true),
            SendMoneyState(
              isLoading: false,
              successText: 'Successfully sent P$testAmount',
            ),
            SendMoneyState(
              isLoading: false,
              errorText: null,
              successText: null,
            ),
          ],
          verify: (_) {
            verify(() => mockCachedService.getCacheUserData()).called(1);
            verify(
              () => mockTransactionRepository.sendPayment(
                senderId: testUserId,
                amount: 100.0,
              ),
            ).called(1);
          },
        );

        blocTest<SendMoneyBloc, SendMoneyState>(
          'emits loading, error states and resets when sendPayment fails',
          setUp: () {
            when(
              () => mockTransactionRepository.sendPayment(
                senderId: testUserId,
                amount: 100.0,
              ),
            ).thenAnswer((_) async => Left(Failure(message: 'Payment failed')));
          },
          build: () => sendMoneyBloc,
          act: (bloc) => bloc.sendMoney(testAmount),
          expect: () => [
            SendMoneyState(isLoading: true),
            SendMoneyState(isLoading: false, errorText: 'Payment failed'),
            SendMoneyState(
              isLoading: false,
              errorText: null,
              successText: null,
            ),
          ],
          verify: (_) {
            verify(() => mockCachedService.getCacheUserData()).called(1);
            verify(
              () => mockTransactionRepository.sendPayment(
                senderId: testUserId,
                amount: 100.0,
              ),
            ).called(1);
          },
        );

        blocTest<SendMoneyBloc, SendMoneyState>(
          'handles amount with P prefix correctly',
          setUp: () {
            when(
              () => mockTransactionRepository.sendPayment(
                senderId: testUserId,
                amount: 250.0,
              ),
            ).thenAnswer((_) async => const Right('success'));
          },
          build: () => sendMoneyBloc,
          act: (bloc) => bloc.sendMoney('P250'),
          expect: () => [
            SendMoneyState(isLoading: true),
            SendMoneyState(
              isLoading: false,
              successText: 'Successfully sent PP250',
            ),
            SendMoneyState(
              isLoading: false,
              errorText: null,
              successText: null,
            ),
          ],
          verify: (_) {
            verify(
              () => mockTransactionRepository.sendPayment(
                senderId: testUserId,
                amount: 250.0,
              ),
            ).called(1);
          },
        );

        blocTest<SendMoneyBloc, SendMoneyState>(
          'handles invalid amount gracefully by defaulting to 0',
          setUp: () {
            when(
              () => mockTransactionRepository.sendPayment(
                senderId: testUserId,
                amount: 0.0,
              ),
            ).thenAnswer((_) async => const Right('success'));
          },
          build: () => sendMoneyBloc,
          act: (bloc) => bloc.sendMoney('invalid'),
          expect: () => [
            SendMoneyState(isLoading: true),
            SendMoneyState(
              isLoading: false,
              successText: 'Successfully sent Pinvalid',
            ),
            SendMoneyState(
              isLoading: false,
              errorText: null,
              successText: null,
            ),
          ],
          verify: (_) {
            verify(
              () => mockTransactionRepository.sendPayment(
                senderId: testUserId,
                amount: 0.0,
              ),
            ).called(1);
          },
        );

        blocTest<SendMoneyBloc, SendMoneyState>(
          'handles decimal amounts correctly',
          setUp: () {
            when(
              () => mockTransactionRepository.sendPayment(
                senderId: testUserId,
                amount: 99.99,
              ),
            ).thenAnswer((_) async => const Right('success'));
          },
          build: () => sendMoneyBloc,
          act: (bloc) => bloc.sendMoney('99.99'),
          expect: () => [
            SendMoneyState(isLoading: true),
            SendMoneyState(
              isLoading: false,
              successText: 'Successfully sent P99.99',
            ),
            SendMoneyState(
              isLoading: false,
              errorText: null,
              successText: null,
            ),
          ],
          verify: (_) {
            verify(
              () => mockTransactionRepository.sendPayment(
                senderId: testUserId,
                amount: 99.99,
              ),
            ).called(1);
          },
        );
      });

      group('when user is not found in cache', () {
        setUp(() {
          when(
            () => mockCachedService.getCacheUserData(),
          ).thenAnswer((_) async => null);
        });

        blocTest<SendMoneyBloc, SendMoneyState>(
          'emits user not found error and resets',
          build: () => sendMoneyBloc,
          act: (bloc) => bloc.sendMoney(testAmount),
          expect: () => [
            SendMoneyState(errorText: 'User not found'),
            SendMoneyState(errorText: null),
          ],
          verify: (_) {
            verify(() => mockCachedService.getCacheUserData()).called(1);
            verifyNever(
              () => mockTransactionRepository.sendPayment(
                senderId: any(named: 'senderId'),
                amount: any(named: 'amount'),
              ),
            );
          },
        );
      });

      group('when user has no id', () {
        setUp(() {
          when(
            () => mockCachedService.getCacheUserData(),
          ).thenAnswer((_) async => UserModelDto(name: 'Test User'));
        });

        blocTest<SendMoneyBloc, SendMoneyState>(
          'calls sendPayment with empty string as senderId',
          setUp: () {
            when(
              () => mockTransactionRepository.sendPayment(
                senderId: '',
                amount: 100.0,
              ),
            ).thenAnswer((_) async => const Right('success'));
          },
          build: () => sendMoneyBloc,
          act: (bloc) => bloc.sendMoney(testAmount),
          expect: () => [
            SendMoneyState(isLoading: true),
            SendMoneyState(
              isLoading: false,
              successText: 'Successfully sent P$testAmount',
            ),
            SendMoneyState(
              isLoading: false,
              errorText: null,
              successText: null,
            ),
          ],
          verify: (_) {
            verify(
              () => mockTransactionRepository.sendPayment(
                senderId: '',
                amount: 100.0,
              ),
            ).called(1);
          },
        );
      });
    });
  });
}
