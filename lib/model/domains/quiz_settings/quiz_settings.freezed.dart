// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuizSettings {

@JsonKey(unknownEnumValue: QuizCategoryMode.random) QuizCategoryMode get category; int get size;
/// Create a copy of QuizSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizSettingsCopyWith<QuizSettings> get copyWith => _$QuizSettingsCopyWithImpl<QuizSettings>(this as QuizSettings, _$identity);

  /// Serializes this QuizSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizSettings&&(identical(other.category, category) || other.category == category)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,size);

@override
String toString() {
  return 'QuizSettings(category: $category, size: $size)';
}


}

/// @nodoc
abstract mixin class $QuizSettingsCopyWith<$Res>  {
  factory $QuizSettingsCopyWith(QuizSettings value, $Res Function(QuizSettings) _then) = _$QuizSettingsCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: QuizCategoryMode.random) QuizCategoryMode category, int size
});




}
/// @nodoc
class _$QuizSettingsCopyWithImpl<$Res>
    implements $QuizSettingsCopyWith<$Res> {
  _$QuizSettingsCopyWithImpl(this._self, this._then);

  final QuizSettings _self;
  final $Res Function(QuizSettings) _then;

/// Create a copy of QuizSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? size = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as QuizCategoryMode,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizSettings].
extension QuizSettingsPatterns on QuizSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizSettings value)  $default,){
final _that = this;
switch (_that) {
case _QuizSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizSettings value)?  $default,){
final _that = this;
switch (_that) {
case _QuizSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: QuizCategoryMode.random)  QuizCategoryMode category,  int size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizSettings() when $default != null:
return $default(_that.category,_that.size);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: QuizCategoryMode.random)  QuizCategoryMode category,  int size)  $default,) {final _that = this;
switch (_that) {
case _QuizSettings():
return $default(_that.category,_that.size);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: QuizCategoryMode.random)  QuizCategoryMode category,  int size)?  $default,) {final _that = this;
switch (_that) {
case _QuizSettings() when $default != null:
return $default(_that.category,_that.size);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizSettings implements QuizSettings {
  const _QuizSettings({@JsonKey(unknownEnumValue: QuizCategoryMode.random) this.category = QuizCategoryMode.random, this.size = 10});
  factory _QuizSettings.fromJson(Map<String, dynamic> json) => _$QuizSettingsFromJson(json);

@override@JsonKey(unknownEnumValue: QuizCategoryMode.random) final  QuizCategoryMode category;
@override@JsonKey() final  int size;

/// Create a copy of QuizSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizSettingsCopyWith<_QuizSettings> get copyWith => __$QuizSettingsCopyWithImpl<_QuizSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizSettings&&(identical(other.category, category) || other.category == category)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,size);

@override
String toString() {
  return 'QuizSettings(category: $category, size: $size)';
}


}

/// @nodoc
abstract mixin class _$QuizSettingsCopyWith<$Res> implements $QuizSettingsCopyWith<$Res> {
  factory _$QuizSettingsCopyWith(_QuizSettings value, $Res Function(_QuizSettings) _then) = __$QuizSettingsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: QuizCategoryMode.random) QuizCategoryMode category, int size
});




}
/// @nodoc
class __$QuizSettingsCopyWithImpl<$Res>
    implements _$QuizSettingsCopyWith<$Res> {
  __$QuizSettingsCopyWithImpl(this._self, this._then);

  final _QuizSettings _self;
  final $Res Function(_QuizSettings) _then;

/// Create a copy of QuizSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? size = null,}) {
  return _then(_QuizSettings(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as QuizCategoryMode,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
