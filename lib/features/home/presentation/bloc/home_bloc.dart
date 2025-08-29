import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_send/core/services/cached_service.dart';
import 'package:quick_send/core/services/di/dependency_injector.dart';
import 'package:quick_send/features/home/presentation/bloc/home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeState()) {
    initialized();
  }

  final cache = locator<CachedService>();

  void initialized() async {}

  Future<void> logout() async {
    await cache.clearCacheToken();
  }
}
