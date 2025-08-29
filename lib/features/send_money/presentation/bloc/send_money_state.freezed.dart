// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_money_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SendMoneyState {

 bool get isLoading; bool get isFinished; String? get errorText; String? get successText;
/// Create a copy of SendMoneyState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendMoneyStateCopyWith<SendMoneyState> get copyWith => _$SendMoneyStateCopyWithImpl<SendMoneyState>(this as SendMoneyState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMoneyState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.errorText, errorText) || other.errorText == errorText)&&(identical(other.successText, successText) || other.successText == successText));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isFinished,errorText,successText);

@override
String toString() {
  return 'SendMoneyState(isLoading: $isLoading, isFinished: $isFinished, errorText: $errorText, successText: $successText)';
}


}

/// @nodoc
abstract mixin class $SendMoneyStateCopyWith<$Res>  {
  factory $SendMoneyStateCopyWith(SendMoneyState value, $Res Function(SendMoneyState) _then) = _$SendMoneyStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isFinished, String? errorText, String? successText
});




}
/// @nodoc
class _$SendMoneyStateCopyWithImpl<$Res>
    implements $SendMoneyStateCopyWith<$Res> {
  _$SendMoneyStateCopyWithImpl(this._self, this._then);

  final SendMoneyState _self;
  final $Res Function(SendMoneyState) _then;

/// Create a copy of SendMoneyState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isFinished = null,Object? errorText = freezed,Object? successText = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,errorText: freezed == errorText ? _self.errorText : errorText // ignore: cast_nullable_to_non_nullable
as String?,successText: freezed == successText ? _self.successText : successText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SendMoneyState].
extension SendMoneyStatePatterns on SendMoneyState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendMoneyState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendMoneyState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendMoneyState value)  $default,){
final _that = this;
switch (_that) {
case _SendMoneyState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendMoneyState value)?  $default,){
final _that = this;
switch (_that) {
case _SendMoneyState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isFinished,  String? errorText,  String? successText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendMoneyState() when $default != null:
return $default(_that.isLoading,_that.isFinished,_that.errorText,_that.successText);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isFinished,  String? errorText,  String? successText)  $default,) {final _that = this;
switch (_that) {
case _SendMoneyState():
return $default(_that.isLoading,_that.isFinished,_that.errorText,_that.successText);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isFinished,  String? errorText,  String? successText)?  $default,) {final _that = this;
switch (_that) {
case _SendMoneyState() when $default != null:
return $default(_that.isLoading,_that.isFinished,_that.errorText,_that.successText);case _:
  return null;

}
}

}

/// @nodoc


class _SendMoneyState implements SendMoneyState {
   _SendMoneyState({this.isLoading = false, this.isFinished = false, this.errorText, this.successText});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isFinished;
@override final  String? errorText;
@override final  String? successText;

/// Create a copy of SendMoneyState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendMoneyStateCopyWith<_SendMoneyState> get copyWith => __$SendMoneyStateCopyWithImpl<_SendMoneyState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendMoneyState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.errorText, errorText) || other.errorText == errorText)&&(identical(other.successText, successText) || other.successText == successText));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isFinished,errorText,successText);

@override
String toString() {
  return 'SendMoneyState(isLoading: $isLoading, isFinished: $isFinished, errorText: $errorText, successText: $successText)';
}


}

/// @nodoc
abstract mixin class _$SendMoneyStateCopyWith<$Res> implements $SendMoneyStateCopyWith<$Res> {
  factory _$SendMoneyStateCopyWith(_SendMoneyState value, $Res Function(_SendMoneyState) _then) = __$SendMoneyStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isFinished, String? errorText, String? successText
});




}
/// @nodoc
class __$SendMoneyStateCopyWithImpl<$Res>
    implements _$SendMoneyStateCopyWith<$Res> {
  __$SendMoneyStateCopyWithImpl(this._self, this._then);

  final _SendMoneyState _self;
  final $Res Function(_SendMoneyState) _then;

/// Create a copy of SendMoneyState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isFinished = null,Object? errorText = freezed,Object? successText = freezed,}) {
  return _then(_SendMoneyState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,errorText: freezed == errorText ? _self.errorText : errorText // ignore: cast_nullable_to_non_nullable
as String?,successText: freezed == successText ? _self.successText : successText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
