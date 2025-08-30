import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quick_send/core/services/cached_service.dart';
import 'package:quick_send/features/home/presentation/bloc/home_bloc.dart';
import 'package:quick_send/features/home/presentation/bloc/home_state.dart';

class MockCachedService extends Mock implements CachedService {}

void main() {
  group('HomeBloc', () {
    late HomeBloc homeBloc;
    late MockCachedService mockCachedService;

    setUp(() {
      mockCachedService = MockCachedService();

      // Setup dependency injection for testing
      if (GetIt.instance.isRegistered<CachedService>()) {
        GetIt.instance.unregister<CachedService>();
      }
      GetIt.instance.registerLazySingleton<CachedService>(
        () => mockCachedService,
      );

      homeBloc = HomeBloc();
    });

    tearDown(() {
      homeBloc.close();
      if (GetIt.instance.isRegistered<CachedService>()) {
        GetIt.instance.unregister<CachedService>();
      }
    });

    test('initial state is correct', () {
      expect(
        homeBloc.state,
        equals(
          HomeState(
            isLoading: false,
            isFinished: false,
            hideAmount: false,
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
        expect(() => homeBloc.initialized(), returnsNormally);
      });
    });

    group('logout', () {
      blocTest<HomeBloc, HomeState>(
        'calls clearCacheToken on cached service',
        setUp: () {
          when(
            () => mockCachedService.clearCacheToken(),
          ).thenAnswer((_) async {});
        },
        build: () => homeBloc,
        act: (bloc) => bloc.logout(),
        expect: () => [], // No state changes expected
        verify: (_) {
          verify(() => mockCachedService.clearCacheToken()).called(1);
        },
      );
    });

    group('toggleHideAmount', () {
      blocTest<HomeBloc, HomeState>(
        'toggles hideAmount from false to true',
        build: () => homeBloc,
        act: (bloc) => bloc.toggleHideAmount(),
        expect: () => [HomeState(hideAmount: true)],
      );

      blocTest<HomeBloc, HomeState>(
        'toggles hideAmount from true to false',
        build: () => homeBloc,
        seed: () => HomeState(hideAmount: true),
        act: (bloc) => bloc.toggleHideAmount(),
        expect: () => [HomeState(hideAmount: false)],
      );

      blocTest<HomeBloc, HomeState>(
        'can toggle multiple times',
        build: () => homeBloc,
        act: (bloc) {
          bloc.toggleHideAmount(); // false -> true
          bloc.toggleHideAmount(); // true -> false
          bloc.toggleHideAmount(); // false -> true
        },
        expect: () => [
          HomeState(hideAmount: true),
          HomeState(hideAmount: false),
          HomeState(hideAmount: true),
        ],
      );
    });

    group('state preservation', () {
      test('preserves other state properties when toggling hideAmount', () {
        final initialState = HomeState(
          isLoading: true,
          isFinished: true,
          hideAmount: false,
          errorText: 'test error',
          successText: 'test success',
        );

        final expectedState = initialState.copyWith(hideAmount: true);

        homeBloc.emit(initialState);
        homeBloc.toggleHideAmount();

        expect(homeBloc.state, equals(expectedState));
        expect(homeBloc.state.isLoading, isTrue);
        expect(homeBloc.state.isFinished, isTrue);
        expect(homeBloc.state.errorText, equals('test error'));
        expect(homeBloc.state.successText, equals('test success'));
      });
    });
  });
}
