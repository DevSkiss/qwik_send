import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_send/core/services/cached_service.dart';
import 'package:quick_send/core/services/di/dependency_injector.dart';
import 'package:quick_send/features/layout/presentation/bloc/layout_state.dart';

class LayoutBloc extends Cubit<LayoutState> {
  LayoutBloc() : super(LayoutState()) {
    initialized();
  }

  final cache = locator<CachedService>();

  void initialized() async {}

  Future<void> logout() async {
    await cache.clearCacheToken();
  }

  void updateCurrentIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
