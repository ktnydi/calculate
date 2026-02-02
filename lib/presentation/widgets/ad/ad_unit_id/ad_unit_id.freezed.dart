// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ad_unit_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdUnitId implements DiagnosticableTreeMixin {

 String get android; String get ios;
/// Create a copy of AdUnitId
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdUnitIdCopyWith<AdUnitId> get copyWith => _$AdUnitIdCopyWithImpl<AdUnitId>(this as AdUnitId, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AdUnitId'))
    ..add(DiagnosticsProperty('android', android))..add(DiagnosticsProperty('ios', ios));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdUnitId&&(identical(other.android, android) || other.android == android)&&(identical(other.ios, ios) || other.ios == ios));
}


@override
int get hashCode => Object.hash(runtimeType,android,ios);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AdUnitId(android: $android, ios: $ios)';
}


}

/// @nodoc
abstract mixin class $AdUnitIdCopyWith<$Res>  {
  factory $AdUnitIdCopyWith(AdUnitId value, $Res Function(AdUnitId) _then) = _$AdUnitIdCopyWithImpl;
@useResult
$Res call({
 String android, String ios
});




}
/// @nodoc
class _$AdUnitIdCopyWithImpl<$Res>
    implements $AdUnitIdCopyWith<$Res> {
  _$AdUnitIdCopyWithImpl(this._self, this._then);

  final AdUnitId _self;
  final $Res Function(AdUnitId) _then;

/// Create a copy of AdUnitId
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? android = null,Object? ios = null,}) {
  return _then(_self.copyWith(
android: null == android ? _self.android : android // ignore: cast_nullable_to_non_nullable
as String,ios: null == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AdUnitId].
extension AdUnitIdPatterns on AdUnitId {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdUnitId value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdUnitId() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdUnitId value)  $default,){
final _that = this;
switch (_that) {
case _AdUnitId():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdUnitId value)?  $default,){
final _that = this;
switch (_that) {
case _AdUnitId() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String android,  String ios)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdUnitId() when $default != null:
return $default(_that.android,_that.ios);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String android,  String ios)  $default,) {final _that = this;
switch (_that) {
case _AdUnitId():
return $default(_that.android,_that.ios);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String android,  String ios)?  $default,) {final _that = this;
switch (_that) {
case _AdUnitId() when $default != null:
return $default(_that.android,_that.ios);case _:
  return null;

}
}

}

/// @nodoc


class _AdUnitId extends AdUnitId with DiagnosticableTreeMixin {
  const _AdUnitId({required this.android, required this.ios}): super._();
  

@override final  String android;
@override final  String ios;

/// Create a copy of AdUnitId
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdUnitIdCopyWith<_AdUnitId> get copyWith => __$AdUnitIdCopyWithImpl<_AdUnitId>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'AdUnitId'))
    ..add(DiagnosticsProperty('android', android))..add(DiagnosticsProperty('ios', ios));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdUnitId&&(identical(other.android, android) || other.android == android)&&(identical(other.ios, ios) || other.ios == ios));
}


@override
int get hashCode => Object.hash(runtimeType,android,ios);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AdUnitId(android: $android, ios: $ios)';
}


}

/// @nodoc
abstract mixin class _$AdUnitIdCopyWith<$Res> implements $AdUnitIdCopyWith<$Res> {
  factory _$AdUnitIdCopyWith(_AdUnitId value, $Res Function(_AdUnitId) _then) = __$AdUnitIdCopyWithImpl;
@override @useResult
$Res call({
 String android, String ios
});




}
/// @nodoc
class __$AdUnitIdCopyWithImpl<$Res>
    implements _$AdUnitIdCopyWith<$Res> {
  __$AdUnitIdCopyWithImpl(this._self, this._then);

  final _AdUnitId _self;
  final $Res Function(_AdUnitId) _then;

/// Create a copy of AdUnitId
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? android = null,Object? ios = null,}) {
  return _then(_AdUnitId(
android: null == android ? _self.android : android // ignore: cast_nullable_to_non_nullable
as String,ios: null == ios ? _self.ios : ios // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
