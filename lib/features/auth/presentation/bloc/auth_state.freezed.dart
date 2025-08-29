// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {

 bool get isLoading; bool get isFinished; bool get hasSession; bool get hidePassword; bool get hideConfirmPassword; bool get showSignup; String? get errorText; String? get successText;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.hasSession, hasSession) || other.hasSession == hasSession)&&(identical(other.hidePassword, hidePassword) || other.hidePassword == hidePassword)&&(identical(other.hideConfirmPassword, hideConfirmPassword) || other.hideConfirmPassword == hideConfirmPassword)&&(identical(other.showSignup, showSignup) || other.showSignup == showSignup)&&(identical(other.errorText, errorText) || other.errorText == errorText)&&(identical(other.successText, successText) || other.successText == successText));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isFinished,hasSession,hidePassword,hideConfirmPassword,showSignup,errorText,successText);

@override
String toString() {
  return 'AuthState(isLoading: $isLoading, isFinished: $isFinished, hasSession: $hasSession, hidePassword: $hidePassword, hideConfirmPassword: $hideConfirmPassword, showSignup: $showSignup, errorText: $errorText, successText: $successText)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isFinished, bool hasSession, bool hidePassword, bool hideConfirmPassword, bool showSignup, String? errorText, String? successText
});




}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isFinished = null,Object? hasSession = null,Object? hidePassword = null,Object? hideConfirmPassword = null,Object? showSignup = null,Object? errorText = freezed,Object? successText = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,hasSession: null == hasSession ? _self.hasSession : hasSession // ignore: cast_nullable_to_non_nullable
as bool,hidePassword: null == hidePassword ? _self.hidePassword : hidePassword // ignore: cast_nullable_to_non_nullable
as bool,hideConfirmPassword: null == hideConfirmPassword ? _self.hideConfirmPassword : hideConfirmPassword // ignore: cast_nullable_to_non_nullable
as bool,showSignup: null == showSignup ? _self.showSignup : showSignup // ignore: cast_nullable_to_non_nullable
as bool,errorText: freezed == errorText ? _self.errorText : errorText // ignore: cast_nullable_to_non_nullable
as String?,successText: freezed == successText ? _self.successText : successText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,){
final _that = this;
switch (_that) {
case _AuthState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isFinished,  bool hasSession,  bool hidePassword,  bool hideConfirmPassword,  bool showSignup,  String? errorText,  String? successText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.isLoading,_that.isFinished,_that.hasSession,_that.hidePassword,_that.hideConfirmPassword,_that.showSignup,_that.errorText,_that.successText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isFinished,  bool hasSession,  bool hidePassword,  bool hideConfirmPassword,  bool showSignup,  String? errorText,  String? successText)  $default,) {final _that = this;
switch (_that) {
case _AuthState():
return $default(_that.isLoading,_that.isFinished,_that.hasSession,_that.hidePassword,_that.hideConfirmPassword,_that.showSignup,_that.errorText,_that.successText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isFinished,  bool hasSession,  bool hidePassword,  bool hideConfirmPassword,  bool showSignup,  String? errorText,  String? successText)?  $default,) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.isLoading,_that.isFinished,_that.hasSession,_that.hidePassword,_that.hideConfirmPassword,_that.showSignup,_that.errorText,_that.successText);case _:
  return null;

}
}

}

/// @nodoc


class _AuthState implements AuthState {
   _AuthState({this.isLoading = false, this.isFinished = false, this.hasSession = false, this.hidePassword = true, this.hideConfirmPassword = true, this.showSignup = false, this.errorText, this.successText});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isFinished;
@override@JsonKey() final  bool hasSession;
@override@JsonKey() final  bool hidePassword;
@override@JsonKey() final  bool hideConfirmPassword;
@override@JsonKey() final  bool showSignup;
@override final  String? errorText;
@override final  String? successText;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.hasSession, hasSession) || other.hasSession == hasSession)&&(identical(other.hidePassword, hidePassword) || other.hidePassword == hidePassword)&&(identical(other.hideConfirmPassword, hideConfirmPassword) || other.hideConfirmPassword == hideConfirmPassword)&&(identical(other.showSignup, showSignup) || other.showSignup == showSignup)&&(identical(other.errorText, errorText) || other.errorText == errorText)&&(identical(other.successText, successText) || other.successText == successText));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isFinished,hasSession,hidePassword,hideConfirmPassword,showSignup,errorText,successText);

@override
String toString() {
  return 'AuthState(isLoading: $isLoading, isFinished: $isFinished, hasSession: $hasSession, hidePassword: $hidePassword, hideConfirmPassword: $hideConfirmPassword, showSignup: $showSignup, errorText: $errorText, successText: $successText)';
}


}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isFinished, bool hasSession, bool hidePassword, bool hideConfirmPassword, bool showSignup, String? errorText, String? successText
});




}
/// @nodoc
class __$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isFinished = null,Object? hasSession = null,Object? hidePassword = null,Object? hideConfirmPassword = null,Object? showSignup = null,Object? errorText = freezed,Object? successText = freezed,}) {
  return _then(_AuthState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,hasSession: null == hasSession ? _self.hasSession : hasSession // ignore: cast_nullable_to_non_nullable
as bool,hidePassword: null == hidePassword ? _self.hidePassword : hidePassword // ignore: cast_nullable_to_non_nullable
as bool,hideConfirmPassword: null == hideConfirmPassword ? _self.hideConfirmPassword : hideConfirmPassword // ignore: cast_nullable_to_non_nullable
as bool,showSignup: null == showSignup ? _self.showSignup : showSignup // ignore: cast_nullable_to_non_nullable
as bool,errorText: freezed == errorText ? _self.errorText : errorText // ignore: cast_nullable_to_non_nullable
as String?,successText: freezed == successText ? _self.successText : successText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
