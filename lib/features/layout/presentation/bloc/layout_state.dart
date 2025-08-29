import 'package:freezed_annotation/freezed_annotation.dart';

part 'layout_state.freezed.dart';

@freezed
abstract class LayoutState with _$LayoutState {
  factory LayoutState({
    @Default(false) bool isLoading,
    @Default(false) bool isFinished,
    @Default(0) int currentIndex,
    String? errorText,
    String? successText,
  }) = _LayoutState;
}
