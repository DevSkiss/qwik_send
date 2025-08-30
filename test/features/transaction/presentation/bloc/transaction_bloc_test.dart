import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quick_send/core/error/error.dart';
import 'package:quick_send/core/models/user_model_dto.dart';
import 'package:quick_send/core/services/cached_service.dart';
import 'package:quick_send/features/transaction/data/models/transaction_model_dto.dart';
import 'package:quick_send/features/transaction/domain/repository/transaction_repository.dart';
import 'package:quick_send/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:quick_send/features/transaction/presentation/bloc/transaction_state.dart';

class MockTransactionRepository extends Mock implements TransactionRepository {}

class MockCachedService extends Mock implements CachedService {}

void main() {
  group('TransactionBloc', () {
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
    });

    tearDown(() {
      if (GetIt.instance.isRegistered<TransactionRepository>()) {
        GetIt.instance.unregister<TransactionRepository>();
      }
      if (GetIt.instance.isRegistered<CachedService>()) {
        GetIt.instance.unregister<CachedService>();
      }
    });

    group('constructor initialization', () {
      const testUserId = 'test-user-id';
      final testUser = UserModelDto(id: testUserId, name: 'Test User');

      blocTest<TransactionBloc, TransactionState>(
        'calls initialized which loads transactions when user is found',
        setUp: () {
          when(
            () => mockCachedService.getCacheUserData(),
          ).thenAnswer((_) async => testUser);
          when(
            () => mockTransactionRepository.getAllTransactions(
              senderId: testUserId,
            ),
          ).thenAnswer((_) async => const Right([]));
        },
        build: () => TransactionBloc(),
        expect: () => [
          TransactionState(isLoading: true),
          TransactionState(isLoading: false, transactions: []),
        ],
        verify: (_) {
          verify(() => mockCachedService.getCacheUserData()).called(1);
          verify(
            () => mockTransactionRepository.getAllTransactions(
              senderId: testUserId,
            ),
          ).called(1);
        },
      );

      blocTest<TransactionBloc, TransactionState>(
        'emits error when user is not found during initialization',
        setUp: () {
          when(
            () => mockCachedService.getCacheUserData(),
          ).thenAnswer((_) async => null);
        },
        build: () => TransactionBloc(),
        expect: () => [TransactionState(errorText: 'User not found')],
        verify: (_) {
          verify(() => mockCachedService.getCacheUserData()).called(1);
          verifyNever(
            () => mockTransactionRepository.getAllTransactions(
              senderId: any(named: 'senderId'),
            ),
          );
        },
      );

      blocTest<TransactionBloc, TransactionState>(
        'loads transactions with empty list successfully',
        setUp: () {
          when(
            () => mockCachedService.getCacheUserData(),
          ).thenAnswer((_) async => testUser);
          when(
            () => mockTransactionRepository.getAllTransactions(
              senderId: testUserId,
            ),
          ).thenAnswer((_) async => const Right([]));
        },
        build: () => TransactionBloc(),
        expect: () => [
          TransactionState(isLoading: true),
          TransactionState(isLoading: false, transactions: []),
        ],
      );

      blocTest<TransactionBloc, TransactionState>(
        'loads transactions with data successfully',
        setUp: () {
          final transactions = [
            TransactionModelDto(id: '1', senderId: testUserId, amount: 100.0),
            TransactionModelDto(id: '2', senderId: testUserId, amount: 200.0),
          ];
          when(
            () => mockCachedService.getCacheUserData(),
          ).thenAnswer((_) async => testUser);
          when(
            () => mockTransactionRepository.getAllTransactions(
              senderId: testUserId,
            ),
          ).thenAnswer((_) async => Right(transactions));
        },
        build: () => TransactionBloc(),
        expect: () => [
          TransactionState(isLoading: true),
          predicate<TransactionState>(
            (state) =>
                state.isLoading == false &&
                state.transactions != null &&
                state.transactions!.length == 2 &&
                state.transactions![0].id == '1' &&
                state.transactions![1].id == '2',
          ),
        ],
      );

      blocTest<TransactionBloc, TransactionState>(
        'handles repository error during initialization',
        setUp: () {
          when(
            () => mockCachedService.getCacheUserData(),
          ).thenAnswer((_) async => testUser);
          when(
            () => mockTransactionRepository.getAllTransactions(
              senderId: testUserId,
            ),
          ).thenAnswer(
            (_) async => Left(Failure(message: 'Failed to load transactions')),
          );
        },
        build: () => TransactionBloc(),
        expect: () => [
          TransactionState(isLoading: true),
          TransactionState(
            isLoading: false,
            errorText: 'Failed to load transactions',
          ),
        ],
      );

      blocTest<TransactionBloc, TransactionState>(
        'handles user with null id by using empty string',
        setUp: () {
          when(
            () => mockCachedService.getCacheUserData(),
          ).thenAnswer((_) async => UserModelDto(name: 'Test User'));
          when(
            () => mockTransactionRepository.getAllTransactions(senderId: ''),
          ).thenAnswer((_) async => const Right([]));
        },
        build: () => TransactionBloc(),
        expect: () => [
          TransactionState(isLoading: true),
          TransactionState(isLoading: false, transactions: []),
        ],
        verify: (_) {
          verify(
            () => mockTransactionRepository.getAllTransactions(senderId: ''),
          ).called(1);
        },
      );
    });

    group('getTransactions method', () {
      late TransactionBloc transactionBloc;
      const testUserId = 'test-user-id';
      final testUser = UserModelDto(id: testUserId, name: 'Test User');

      setUp(() {
        // Reset mocks for clean constructor call
        reset(mockCachedService);
        reset(mockTransactionRepository);

        // Mock the constructor initialization with a successful call
        when(
          () => mockCachedService.getCacheUserData(),
        ).thenAnswer((_) async => testUser);
        when(
          () => mockTransactionRepository.getAllTransactions(
            senderId: testUserId,
          ),
        ).thenAnswer((_) async => const Right([]));

        transactionBloc = TransactionBloc();
      });

      tearDown(() {
        transactionBloc.close();
      });

      blocTest<TransactionBloc, TransactionState>(
        'successfully loads empty transactions list',
        setUp: () {
          when(
            () => mockCachedService.getCacheUserData(),
          ).thenAnswer((_) async => testUser);
          when(
            () => mockTransactionRepository.getAllTransactions(
              senderId: testUserId,
            ),
          ).thenAnswer((_) async => const Right([]));
        },
        build: () => transactionBloc,
        act: (bloc) => bloc.getTransactions(),
        expect: () => [
          TransactionState(isLoading: true, transactions: []),
          TransactionState(isLoading: false, transactions: []),
        ],
      );

      blocTest<TransactionBloc, TransactionState>(
        'successfully loads transactions with data',
        setUp: () {
          final transactions = [
            TransactionModelDto(id: '1', senderId: testUserId, amount: 100.0),
            TransactionModelDto(id: '2', senderId: testUserId, amount: 200.0),
          ];
          when(
            () => mockCachedService.getCacheUserData(),
          ).thenAnswer((_) async => testUser);
          when(
            () => mockTransactionRepository.getAllTransactions(
              senderId: testUserId,
            ),
          ).thenAnswer((_) async => Right(transactions));
        },
        build: () => transactionBloc,
        act: (bloc) => bloc.getTransactions(),
        expect: () => [
          TransactionState(isLoading: true, transactions: []),
          predicate<TransactionState>(
            (state) =>
                state.isLoading == false &&
                state.transactions != null &&
                state.transactions!.length == 2 &&
                state.transactions![0].id == '1' &&
                state.transactions![1].id == '2',
          ),
        ],
      );

      blocTest<TransactionBloc, TransactionState>(
        'handles repository error',
        setUp: () {
          when(
            () => mockCachedService.getCacheUserData(),
          ).thenAnswer((_) async => testUser);
          when(
            () => mockTransactionRepository.getAllTransactions(
              senderId: testUserId,
            ),
          ).thenAnswer((_) async => Left(Failure(message: 'Network error')));
        },
        build: () => transactionBloc,
        act: (bloc) => bloc.getTransactions(),
        expect: () => [
          TransactionState(isLoading: true, transactions: []),
          TransactionState(
            isLoading: false,
            transactions: [],
            errorText: 'Network error',
          ),
        ],
      );

      blocTest<TransactionBloc, TransactionState>(
        'handles user not found in cache',
        setUp: () {
          when(
            () => mockCachedService.getCacheUserData(),
          ).thenAnswer((_) async => null);
        },
        build: () => transactionBloc,
        act: (bloc) => bloc.getTransactions(),
        expect: () => [
          TransactionState(transactions: [], errorText: 'User not found'),
        ],
      );
    });

    group('initialized method', () {
      late TransactionBloc transactionBloc;
      const testUserId = 'test-user-id';
      final testUser = UserModelDto(id: testUserId, name: 'Test User');

      setUp(() {
        // Reset mocks for clean constructor call
        reset(mockCachedService);
        reset(mockTransactionRepository);

        // Mock the constructor initialization with a successful call
        when(
          () => mockCachedService.getCacheUserData(),
        ).thenAnswer((_) async => testUser);
        when(
          () => mockTransactionRepository.getAllTransactions(
            senderId: testUserId,
          ),
        ).thenAnswer((_) async => const Right([]));

        transactionBloc = TransactionBloc();
      });

      tearDown(() {
        transactionBloc.close();
      });

      blocTest<TransactionBloc, TransactionState>(
        'calls getTransactions which loads data',
        setUp: () {
          final transactions = [
            TransactionModelDto(id: '1', senderId: testUserId, amount: 100.0),
          ];
          when(
            () => mockCachedService.getCacheUserData(),
          ).thenAnswer((_) async => testUser);
          when(
            () => mockTransactionRepository.getAllTransactions(
              senderId: testUserId,
            ),
          ).thenAnswer((_) async => Right(transactions));
        },
        build: () => transactionBloc,
        act: (bloc) => bloc.initialized(),
        expect: () => [
          TransactionState(isLoading: true, transactions: []),
          predicate<TransactionState>(
            (state) =>
                state.isLoading == false &&
                state.transactions != null &&
                state.transactions!.length == 1 &&
                state.transactions![0].id == '1',
          ),
        ],
      );
    });

    group('state management', () {
      test('initial state has correct default values', () {
        final state = TransactionState();
        expect(state.isLoading, isFalse);
        expect(state.isFinished, isFalse);
        expect(state.transactions, isNull);
        expect(state.errorText, isNull);
        expect(state.successText, isNull);
      });

      test('copyWith preserves unchanged values', () {
        final initialState = TransactionState(
          isLoading: true,
          isFinished: true,
          transactions: [TransactionModelDto(id: '1')],
          errorText: 'error',
          successText: 'success',
        );

        final newState = initialState.copyWith(isLoading: false);

        expect(newState.isLoading, isFalse);
        expect(newState.isFinished, isTrue);
        expect(newState.transactions, isNotNull);
        expect(newState.transactions!.length, equals(1));
        expect(newState.transactions![0].id, equals('1'));
        expect(newState.errorText, equals('error'));
        expect(newState.successText, equals('success'));
      });
    });
  });
}
