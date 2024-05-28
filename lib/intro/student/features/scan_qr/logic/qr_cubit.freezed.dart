// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QrState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() scanComplete,
    required TResult Function() scanError,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? scanComplete,
    TResult? Function()? scanError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? scanComplete,
    TResult Function()? scanError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ScanComplete value) scanComplete,
    required TResult Function(ScanError value) scanError,
  }) =>
      throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ScanComplete value)? scanComplete,
    TResult? Function(ScanError value)? scanError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ScanComplete value)? scanComplete,
    TResult Function(ScanError value)? scanError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrStateCopyWith<$Res> {
  factory $QrStateCopyWith(QrState value, $Res Function(QrState) then) =
      _$QrStateCopyWithImpl<$Res, QrState>;
}

/// @nodoc
class _$QrStateCopyWithImpl<$Res, $Val extends QrState>
    implements $QrStateCopyWith<$Res> {
  _$QrStateCopyWithImpl(this._value, this._then);

// ignore: unused_field
  final $Val _value;
// ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$QrStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'QrState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() scanComplete,
    required TResult Function() scanError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? scanComplete,
    TResult? Function()? scanError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? scanComplete,
    TResult Function()? scanError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ScanComplete value) scanComplete,
    required TResult Function(ScanError value) scanError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ScanComplete value)? scanComplete,
    TResult? Function(ScanError value)? scanError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ScanComplete value)? scanComplete,
    TResult Function(ScanError value)? scanError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements QrState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$ScanCompleteImplCopyWith<$Res> {
  factory _$$ScanCompleteImplCopyWith(
          _$ScanCompleteImpl value, $Res Function(_$ScanCompleteImpl) then) =
      __$$ScanCompleteImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ScanCompleteImplCopyWithImpl<$Res>
    extends _$QrStateCopyWithImpl<$Res, _$ScanCompleteImpl>
    implements _$$ScanCompleteImplCopyWith<$Res> {
  __$$ScanCompleteImplCopyWithImpl(
      _$ScanCompleteImpl _value, $Res Function(_$ScanCompleteImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ScanCompleteImpl implements ScanComplete {
  const _$ScanCompleteImpl();

  @override
  String toString() {
    return 'QrState.scanComplete()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ScanCompleteImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() scanComplete,
    required TResult Function() scanError,
  }) {
    return scanComplete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? scanComplete,
    TResult? Function()? scanError,
  }) {
    return scanComplete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? scanComplete,
    TResult Function()? scanError,
    required TResult orElse(),
  }) {
    if (scanComplete != null) {
      return scanComplete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ScanComplete value) scanComplete,
    required TResult Function(ScanError value) scanError,
  }) {
    return scanComplete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ScanComplete value)? scanComplete,
    TResult? Function(ScanError value)? scanError,
  }) {
    return scanComplete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ScanComplete value)? scanComplete,
    TResult Function(ScanError value)? scanError,
    required TResult orElse(),
  }) {
    if (scanComplete != null) {
      return scanComplete(this);
    }
    return orElse();
  }
}

abstract class ScanComplete implements QrState {
  const factory ScanComplete() = _$ScanCompleteImpl;
}

/// @nodoc
abstract class _$$ScanErrorImplCopyWith<$Res> {
  factory _$$ScanErrorImplCopyWith(
          _$ScanErrorImpl value, $Res Function(_$ScanErrorImpl) then) =
      __$$ScanErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ScanErrorImplCopyWithImpl<$Res>
    extends _$QrStateCopyWithImpl<$Res, _$ScanErrorImpl>
    implements _$$ScanErrorImplCopyWith<$Res> {
  __$$ScanErrorImplCopyWithImpl(
      _$ScanErrorImpl _value, $Res Function(_$ScanErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ScanErrorImpl implements ScanError {
  const _$ScanErrorImpl();

  @override
  String toString() {
    return 'QrState.scanError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ScanErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() scanComplete,
    required TResult Function() scanError,
  }) {
    return scanError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? scanComplete,
    TResult? Function()? scanError,
  }) {
    return scanError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? scanComplete,
    TResult Function()? scanError,
    required TResult orElse(),
  }) {
    if (scanError != null) {
      return scanError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(ScanComplete value) scanComplete,
    required TResult Function(ScanError value) scanError,
  }) {
    return scanError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(ScanComplete value)? scanComplete,
    TResult? Function(ScanError value)? scanError,
  }) {
    return scanError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(ScanComplete value)? scanComplete,
    TResult Function(ScanError value)? scanError,
    required TResult orElse(),
  }) {
    if (scanError != null) {
      return scanError(this);
    }
    return orElse();
  }
}

abstract class ScanError implements QrState {
  const factory ScanError() = _$ScanErrorImpl;
}
