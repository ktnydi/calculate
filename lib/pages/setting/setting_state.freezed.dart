// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'setting_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SettingStateTearOff {
  const _$SettingStateTearOff();

  _SettingState call(
      {bool isRandom = false,
      int limit = 180,
      int quizLength = 100,
      int keyboardLocation = 0}) {
    return _SettingState(
      isRandom: isRandom,
      limit: limit,
      quizLength: quizLength,
      keyboardLocation: keyboardLocation,
    );
  }
}

/// @nodoc
const $SettingState = _$SettingStateTearOff();

/// @nodoc
mixin _$SettingState {
  bool get isRandom => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get quizLength => throw _privateConstructorUsedError;
  int get keyboardLocation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingStateCopyWith<SettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingStateCopyWith<$Res> {
  factory $SettingStateCopyWith(
          SettingState value, $Res Function(SettingState) then) =
      _$SettingStateCopyWithImpl<$Res>;
  $Res call({bool isRandom, int limit, int quizLength, int keyboardLocation});
}

/// @nodoc
class _$SettingStateCopyWithImpl<$Res> implements $SettingStateCopyWith<$Res> {
  _$SettingStateCopyWithImpl(this._value, this._then);

  final SettingState _value;
  // ignore: unused_field
  final $Res Function(SettingState) _then;

  @override
  $Res call({
    Object? isRandom = freezed,
    Object? limit = freezed,
    Object? quizLength = freezed,
    Object? keyboardLocation = freezed,
  }) {
    return _then(_value.copyWith(
      isRandom: isRandom == freezed
          ? _value.isRandom
          : isRandom // ignore: cast_nullable_to_non_nullable
              as bool,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      quizLength: quizLength == freezed
          ? _value.quizLength
          : quizLength // ignore: cast_nullable_to_non_nullable
              as int,
      keyboardLocation: keyboardLocation == freezed
          ? _value.keyboardLocation
          : keyboardLocation // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$SettingStateCopyWith<$Res>
    implements $SettingStateCopyWith<$Res> {
  factory _$SettingStateCopyWith(
          _SettingState value, $Res Function(_SettingState) then) =
      __$SettingStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isRandom, int limit, int quizLength, int keyboardLocation});
}

/// @nodoc
class __$SettingStateCopyWithImpl<$Res> extends _$SettingStateCopyWithImpl<$Res>
    implements _$SettingStateCopyWith<$Res> {
  __$SettingStateCopyWithImpl(
      _SettingState _value, $Res Function(_SettingState) _then)
      : super(_value, (v) => _then(v as _SettingState));

  @override
  _SettingState get _value => super._value as _SettingState;

  @override
  $Res call({
    Object? isRandom = freezed,
    Object? limit = freezed,
    Object? quizLength = freezed,
    Object? keyboardLocation = freezed,
  }) {
    return _then(_SettingState(
      isRandom: isRandom == freezed
          ? _value.isRandom
          : isRandom // ignore: cast_nullable_to_non_nullable
              as bool,
      limit: limit == freezed
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      quizLength: quizLength == freezed
          ? _value.quizLength
          : quizLength // ignore: cast_nullable_to_non_nullable
              as int,
      keyboardLocation: keyboardLocation == freezed
          ? _value.keyboardLocation
          : keyboardLocation // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SettingState implements _SettingState {
  const _$_SettingState(
      {this.isRandom = false,
      this.limit = 180,
      this.quizLength = 100,
      this.keyboardLocation = 0});

  @JsonKey(defaultValue: false)
  @override
  final bool isRandom;
  @JsonKey(defaultValue: 180)
  @override
  final int limit;
  @JsonKey(defaultValue: 100)
  @override
  final int quizLength;
  @JsonKey(defaultValue: 0)
  @override
  final int keyboardLocation;

  @override
  String toString() {
    return 'SettingState(isRandom: $isRandom, limit: $limit, quizLength: $quizLength, keyboardLocation: $keyboardLocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SettingState &&
            (identical(other.isRandom, isRandom) ||
                const DeepCollectionEquality()
                    .equals(other.isRandom, isRandom)) &&
            (identical(other.limit, limit) ||
                const DeepCollectionEquality().equals(other.limit, limit)) &&
            (identical(other.quizLength, quizLength) ||
                const DeepCollectionEquality()
                    .equals(other.quizLength, quizLength)) &&
            (identical(other.keyboardLocation, keyboardLocation) ||
                const DeepCollectionEquality()
                    .equals(other.keyboardLocation, keyboardLocation)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isRandom) ^
      const DeepCollectionEquality().hash(limit) ^
      const DeepCollectionEquality().hash(quizLength) ^
      const DeepCollectionEquality().hash(keyboardLocation);

  @JsonKey(ignore: true)
  @override
  _$SettingStateCopyWith<_SettingState> get copyWith =>
      __$SettingStateCopyWithImpl<_SettingState>(this, _$identity);
}

abstract class _SettingState implements SettingState {
  const factory _SettingState(
      {bool isRandom,
      int limit,
      int quizLength,
      int keyboardLocation}) = _$_SettingState;

  @override
  bool get isRandom => throw _privateConstructorUsedError;
  @override
  int get limit => throw _privateConstructorUsedError;
  @override
  int get quizLength => throw _privateConstructorUsedError;
  @override
  int get keyboardLocation => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SettingStateCopyWith<_SettingState> get copyWith =>
      throw _privateConstructorUsedError;
}
