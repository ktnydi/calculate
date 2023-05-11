// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'update_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateInfo _$UpdateInfoFromJson(Map<String, dynamic> json) {
  return _UpdateInfo.fromJson(json);
}

/// @nodoc
class _$UpdateInfoTearOff {
  const _$UpdateInfoTearOff();

  _UpdateInfo call(
      {required String requiredVersion,
      bool canCancel = false,
      required DateTime enabledAt}) {
    return _UpdateInfo(
      requiredVersion: requiredVersion,
      canCancel: canCancel,
      enabledAt: enabledAt,
    );
  }

  UpdateInfo fromJson(Map<String, Object> json) {
    return UpdateInfo.fromJson(json);
  }
}

/// @nodoc
const $UpdateInfo = _$UpdateInfoTearOff();

/// @nodoc
mixin _$UpdateInfo {
  String get requiredVersion => throw _privateConstructorUsedError;
  bool get canCancel => throw _privateConstructorUsedError;
  DateTime get enabledAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateInfoCopyWith<UpdateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateInfoCopyWith<$Res> {
  factory $UpdateInfoCopyWith(
          UpdateInfo value, $Res Function(UpdateInfo) then) =
      _$UpdateInfoCopyWithImpl<$Res>;
  $Res call({String requiredVersion, bool canCancel, DateTime enabledAt});
}

/// @nodoc
class _$UpdateInfoCopyWithImpl<$Res> implements $UpdateInfoCopyWith<$Res> {
  _$UpdateInfoCopyWithImpl(this._value, this._then);

  final UpdateInfo _value;
  // ignore: unused_field
  final $Res Function(UpdateInfo) _then;

  @override
  $Res call({
    Object? requiredVersion = freezed,
    Object? canCancel = freezed,
    Object? enabledAt = freezed,
  }) {
    return _then(_value.copyWith(
      requiredVersion: requiredVersion == freezed
          ? _value.requiredVersion
          : requiredVersion // ignore: cast_nullable_to_non_nullable
              as String,
      canCancel: canCancel == freezed
          ? _value.canCancel
          : canCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      enabledAt: enabledAt == freezed
          ? _value.enabledAt
          : enabledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$UpdateInfoCopyWith<$Res> implements $UpdateInfoCopyWith<$Res> {
  factory _$UpdateInfoCopyWith(
          _UpdateInfo value, $Res Function(_UpdateInfo) then) =
      __$UpdateInfoCopyWithImpl<$Res>;
  @override
  $Res call({String requiredVersion, bool canCancel, DateTime enabledAt});
}

/// @nodoc
class __$UpdateInfoCopyWithImpl<$Res> extends _$UpdateInfoCopyWithImpl<$Res>
    implements _$UpdateInfoCopyWith<$Res> {
  __$UpdateInfoCopyWithImpl(
      _UpdateInfo _value, $Res Function(_UpdateInfo) _then)
      : super(_value, (v) => _then(v as _UpdateInfo));

  @override
  _UpdateInfo get _value => super._value as _UpdateInfo;

  @override
  $Res call({
    Object? requiredVersion = freezed,
    Object? canCancel = freezed,
    Object? enabledAt = freezed,
  }) {
    return _then(_UpdateInfo(
      requiredVersion: requiredVersion == freezed
          ? _value.requiredVersion
          : requiredVersion // ignore: cast_nullable_to_non_nullable
              as String,
      canCancel: canCancel == freezed
          ? _value.canCancel
          : canCancel // ignore: cast_nullable_to_non_nullable
              as bool,
      enabledAt: enabledAt == freezed
          ? _value.enabledAt
          : enabledAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateInfo implements _UpdateInfo {
  const _$_UpdateInfo(
      {required this.requiredVersion,
      this.canCancel = false,
      required this.enabledAt});

  factory _$_UpdateInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_UpdateInfoFromJson(json);

  @override
  final String requiredVersion;
  @JsonKey(defaultValue: false)
  @override
  final bool canCancel;
  @override
  final DateTime enabledAt;

  @override
  String toString() {
    return 'UpdateInfo(requiredVersion: $requiredVersion, canCancel: $canCancel, enabledAt: $enabledAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateInfo &&
            (identical(other.requiredVersion, requiredVersion) ||
                const DeepCollectionEquality()
                    .equals(other.requiredVersion, requiredVersion)) &&
            (identical(other.canCancel, canCancel) ||
                const DeepCollectionEquality()
                    .equals(other.canCancel, canCancel)) &&
            (identical(other.enabledAt, enabledAt) ||
                const DeepCollectionEquality()
                    .equals(other.enabledAt, enabledAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(requiredVersion) ^
      const DeepCollectionEquality().hash(canCancel) ^
      const DeepCollectionEquality().hash(enabledAt);

  @JsonKey(ignore: true)
  @override
  _$UpdateInfoCopyWith<_UpdateInfo> get copyWith =>
      __$UpdateInfoCopyWithImpl<_UpdateInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UpdateInfoToJson(this);
  }
}

abstract class _UpdateInfo implements UpdateInfo {
  const factory _UpdateInfo(
      {required String requiredVersion,
      bool canCancel,
      required DateTime enabledAt}) = _$_UpdateInfo;

  factory _UpdateInfo.fromJson(Map<String, dynamic> json) =
      _$_UpdateInfo.fromJson;

  @override
  String get requiredVersion => throw _privateConstructorUsedError;
  @override
  bool get canCancel => throw _privateConstructorUsedError;
  @override
  DateTime get enabledAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UpdateInfoCopyWith<_UpdateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
