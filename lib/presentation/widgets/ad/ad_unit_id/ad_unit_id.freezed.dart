// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad_unit_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AdUnitId {
  String get android => throw _privateConstructorUsedError;
  String get ios => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdUnitIdCopyWith<AdUnitId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdUnitIdCopyWith<$Res> {
  factory $AdUnitIdCopyWith(AdUnitId value, $Res Function(AdUnitId) then) =
      _$AdUnitIdCopyWithImpl<$Res, AdUnitId>;
  @useResult
  $Res call({String android, String ios});
}

/// @nodoc
class _$AdUnitIdCopyWithImpl<$Res, $Val extends AdUnitId>
    implements $AdUnitIdCopyWith<$Res> {
  _$AdUnitIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? android = null,
    Object? ios = null,
  }) {
    return _then(_value.copyWith(
      android: null == android
          ? _value.android
          : android // ignore: cast_nullable_to_non_nullable
              as String,
      ios: null == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdUnitIdCopyWith<$Res> implements $AdUnitIdCopyWith<$Res> {
  factory _$$_AdUnitIdCopyWith(
          _$_AdUnitId value, $Res Function(_$_AdUnitId) then) =
      __$$_AdUnitIdCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String android, String ios});
}

/// @nodoc
class __$$_AdUnitIdCopyWithImpl<$Res>
    extends _$AdUnitIdCopyWithImpl<$Res, _$_AdUnitId>
    implements _$$_AdUnitIdCopyWith<$Res> {
  __$$_AdUnitIdCopyWithImpl(
      _$_AdUnitId _value, $Res Function(_$_AdUnitId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? android = null,
    Object? ios = null,
  }) {
    return _then(_$_AdUnitId(
      android: null == android
          ? _value.android
          : android // ignore: cast_nullable_to_non_nullable
              as String,
      ios: null == ios
          ? _value.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AdUnitId extends _AdUnitId with DiagnosticableTreeMixin {
  const _$_AdUnitId({required this.android, required this.ios}) : super._();

  @override
  final String android;
  @override
  final String ios;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AdUnitId(android: $android, ios: $ios)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AdUnitId'))
      ..add(DiagnosticsProperty('android', android))
      ..add(DiagnosticsProperty('ios', ios));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdUnitId &&
            (identical(other.android, android) || other.android == android) &&
            (identical(other.ios, ios) || other.ios == ios));
  }

  @override
  int get hashCode => Object.hash(runtimeType, android, ios);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdUnitIdCopyWith<_$_AdUnitId> get copyWith =>
      __$$_AdUnitIdCopyWithImpl<_$_AdUnitId>(this, _$identity);
}

abstract class _AdUnitId extends AdUnitId {
  const factory _AdUnitId(
      {required final String android, required final String ios}) = _$_AdUnitId;
  const _AdUnitId._() : super._();

  @override
  String get android;
  @override
  String get ios;
  @override
  @JsonKey(ignore: true)
  _$$_AdUnitIdCopyWith<_$_AdUnitId> get copyWith =>
      throw _privateConstructorUsedError;
}
