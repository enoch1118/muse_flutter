// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'launch_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LaunchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() needOnboarding,
    required TResult Function() needHome,
    required TResult Function() geminiError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? needOnboarding,
    TResult? Function()? needHome,
    TResult? Function()? geminiError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? needOnboarding,
    TResult Function()? needHome,
    TResult Function()? geminiError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(NeedOnBoarding value) needOnboarding,
    required TResult Function(NeedHome value) needHome,
    required TResult Function(GeminiError value) geminiError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(NeedOnBoarding value)? needOnboarding,
    TResult? Function(NeedHome value)? needHome,
    TResult? Function(GeminiError value)? geminiError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(NeedOnBoarding value)? needOnboarding,
    TResult Function(NeedHome value)? needHome,
    TResult Function(GeminiError value)? geminiError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LaunchStateCopyWith<$Res> {
  factory $LaunchStateCopyWith(
          LaunchState value, $Res Function(LaunchState) then) =
      _$LaunchStateCopyWithImpl<$Res, LaunchState>;
}

/// @nodoc
class _$LaunchStateCopyWithImpl<$Res, $Val extends LaunchState>
    implements $LaunchStateCopyWith<$Res> {
  _$LaunchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitImplCopyWith<$Res> {
  factory _$$InitImplCopyWith(
          _$InitImpl value, $Res Function(_$InitImpl) then) =
      __$$InitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitImplCopyWithImpl<$Res>
    extends _$LaunchStateCopyWithImpl<$Res, _$InitImpl>
    implements _$$InitImplCopyWith<$Res> {
  __$$InitImplCopyWithImpl(_$InitImpl _value, $Res Function(_$InitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitImpl implements Init {
  const _$InitImpl();

  @override
  String toString() {
    return 'LaunchState.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() needOnboarding,
    required TResult Function() needHome,
    required TResult Function() geminiError,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? needOnboarding,
    TResult? Function()? needHome,
    TResult? Function()? geminiError,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? needOnboarding,
    TResult Function()? needHome,
    TResult Function()? geminiError,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(NeedOnBoarding value) needOnboarding,
    required TResult Function(NeedHome value) needHome,
    required TResult Function(GeminiError value) geminiError,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(NeedOnBoarding value)? needOnboarding,
    TResult? Function(NeedHome value)? needHome,
    TResult? Function(GeminiError value)? geminiError,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(NeedOnBoarding value)? needOnboarding,
    TResult Function(NeedHome value)? needHome,
    TResult Function(GeminiError value)? geminiError,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init implements LaunchState {
  const factory Init() = _$InitImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$LaunchStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'LaunchState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() needOnboarding,
    required TResult Function() needHome,
    required TResult Function() geminiError,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? needOnboarding,
    TResult? Function()? needHome,
    TResult? Function()? geminiError,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? needOnboarding,
    TResult Function()? needHome,
    TResult Function()? geminiError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(NeedOnBoarding value) needOnboarding,
    required TResult Function(NeedHome value) needHome,
    required TResult Function(GeminiError value) geminiError,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(NeedOnBoarding value)? needOnboarding,
    TResult? Function(NeedHome value)? needHome,
    TResult? Function(GeminiError value)? geminiError,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(NeedOnBoarding value)? needOnboarding,
    TResult Function(NeedHome value)? needHome,
    TResult Function(GeminiError value)? geminiError,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements LaunchState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$NeedOnBoardingImplCopyWith<$Res> {
  factory _$$NeedOnBoardingImplCopyWith(_$NeedOnBoardingImpl value,
          $Res Function(_$NeedOnBoardingImpl) then) =
      __$$NeedOnBoardingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NeedOnBoardingImplCopyWithImpl<$Res>
    extends _$LaunchStateCopyWithImpl<$Res, _$NeedOnBoardingImpl>
    implements _$$NeedOnBoardingImplCopyWith<$Res> {
  __$$NeedOnBoardingImplCopyWithImpl(
      _$NeedOnBoardingImpl _value, $Res Function(_$NeedOnBoardingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NeedOnBoardingImpl implements NeedOnBoarding {
  const _$NeedOnBoardingImpl();

  @override
  String toString() {
    return 'LaunchState.needOnboarding()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NeedOnBoardingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() needOnboarding,
    required TResult Function() needHome,
    required TResult Function() geminiError,
  }) {
    return needOnboarding();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? needOnboarding,
    TResult? Function()? needHome,
    TResult? Function()? geminiError,
  }) {
    return needOnboarding?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? needOnboarding,
    TResult Function()? needHome,
    TResult Function()? geminiError,
    required TResult orElse(),
  }) {
    if (needOnboarding != null) {
      return needOnboarding();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(NeedOnBoarding value) needOnboarding,
    required TResult Function(NeedHome value) needHome,
    required TResult Function(GeminiError value) geminiError,
  }) {
    return needOnboarding(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(NeedOnBoarding value)? needOnboarding,
    TResult? Function(NeedHome value)? needHome,
    TResult? Function(GeminiError value)? geminiError,
  }) {
    return needOnboarding?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(NeedOnBoarding value)? needOnboarding,
    TResult Function(NeedHome value)? needHome,
    TResult Function(GeminiError value)? geminiError,
    required TResult orElse(),
  }) {
    if (needOnboarding != null) {
      return needOnboarding(this);
    }
    return orElse();
  }
}

abstract class NeedOnBoarding implements LaunchState {
  const factory NeedOnBoarding() = _$NeedOnBoardingImpl;
}

/// @nodoc
abstract class _$$NeedHomeImplCopyWith<$Res> {
  factory _$$NeedHomeImplCopyWith(
          _$NeedHomeImpl value, $Res Function(_$NeedHomeImpl) then) =
      __$$NeedHomeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NeedHomeImplCopyWithImpl<$Res>
    extends _$LaunchStateCopyWithImpl<$Res, _$NeedHomeImpl>
    implements _$$NeedHomeImplCopyWith<$Res> {
  __$$NeedHomeImplCopyWithImpl(
      _$NeedHomeImpl _value, $Res Function(_$NeedHomeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NeedHomeImpl implements NeedHome {
  const _$NeedHomeImpl();

  @override
  String toString() {
    return 'LaunchState.needHome()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NeedHomeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() needOnboarding,
    required TResult Function() needHome,
    required TResult Function() geminiError,
  }) {
    return needHome();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? needOnboarding,
    TResult? Function()? needHome,
    TResult? Function()? geminiError,
  }) {
    return needHome?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? needOnboarding,
    TResult Function()? needHome,
    TResult Function()? geminiError,
    required TResult orElse(),
  }) {
    if (needHome != null) {
      return needHome();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(NeedOnBoarding value) needOnboarding,
    required TResult Function(NeedHome value) needHome,
    required TResult Function(GeminiError value) geminiError,
  }) {
    return needHome(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(NeedOnBoarding value)? needOnboarding,
    TResult? Function(NeedHome value)? needHome,
    TResult? Function(GeminiError value)? geminiError,
  }) {
    return needHome?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(NeedOnBoarding value)? needOnboarding,
    TResult Function(NeedHome value)? needHome,
    TResult Function(GeminiError value)? geminiError,
    required TResult orElse(),
  }) {
    if (needHome != null) {
      return needHome(this);
    }
    return orElse();
  }
}

abstract class NeedHome implements LaunchState {
  const factory NeedHome() = _$NeedHomeImpl;
}

/// @nodoc
abstract class _$$GeminiErrorImplCopyWith<$Res> {
  factory _$$GeminiErrorImplCopyWith(
          _$GeminiErrorImpl value, $Res Function(_$GeminiErrorImpl) then) =
      __$$GeminiErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GeminiErrorImplCopyWithImpl<$Res>
    extends _$LaunchStateCopyWithImpl<$Res, _$GeminiErrorImpl>
    implements _$$GeminiErrorImplCopyWith<$Res> {
  __$$GeminiErrorImplCopyWithImpl(
      _$GeminiErrorImpl _value, $Res Function(_$GeminiErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GeminiErrorImpl implements GeminiError {
  const _$GeminiErrorImpl();

  @override
  String toString() {
    return 'LaunchState.geminiError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GeminiErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function() needOnboarding,
    required TResult Function() needHome,
    required TResult Function() geminiError,
  }) {
    return geminiError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loading,
    TResult? Function()? needOnboarding,
    TResult? Function()? needHome,
    TResult? Function()? geminiError,
  }) {
    return geminiError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function()? needOnboarding,
    TResult Function()? needHome,
    TResult Function()? geminiError,
    required TResult orElse(),
  }) {
    if (geminiError != null) {
      return geminiError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(Loading value) loading,
    required TResult Function(NeedOnBoarding value) needOnboarding,
    required TResult Function(NeedHome value) needHome,
    required TResult Function(GeminiError value) geminiError,
  }) {
    return geminiError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
    TResult? Function(Loading value)? loading,
    TResult? Function(NeedOnBoarding value)? needOnboarding,
    TResult? Function(NeedHome value)? needHome,
    TResult? Function(GeminiError value)? geminiError,
  }) {
    return geminiError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(Loading value)? loading,
    TResult Function(NeedOnBoarding value)? needOnboarding,
    TResult Function(NeedHome value)? needHome,
    TResult Function(GeminiError value)? geminiError,
    required TResult orElse(),
  }) {
    if (geminiError != null) {
      return geminiError(this);
    }
    return orElse();
  }
}

abstract class GeminiError implements LaunchState {
  const factory GeminiError() = _$GeminiErrorImpl;
}
