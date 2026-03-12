// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Score {

 int get firstDigit; int get secondDigit; int get rawScore;
/// Create a copy of Score
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreCopyWith<Score> get copyWith => _$ScoreCopyWithImpl<Score>(this as Score, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Score&&(identical(other.firstDigit, firstDigit) || other.firstDigit == firstDigit)&&(identical(other.secondDigit, secondDigit) || other.secondDigit == secondDigit)&&(identical(other.rawScore, rawScore) || other.rawScore == rawScore));
}


@override
int get hashCode => Object.hash(runtimeType,firstDigit,secondDigit,rawScore);

@override
String toString() {
  return 'Score(firstDigit: $firstDigit, secondDigit: $secondDigit, rawScore: $rawScore)';
}


}

/// @nodoc
abstract mixin class $ScoreCopyWith<$Res>  {
  factory $ScoreCopyWith(Score value, $Res Function(Score) _then) = _$ScoreCopyWithImpl;
@useResult
$Res call({
 int firstDigit, int secondDigit, int rawScore
});




}
/// @nodoc
class _$ScoreCopyWithImpl<$Res>
    implements $ScoreCopyWith<$Res> {
  _$ScoreCopyWithImpl(this._self, this._then);

  final Score _self;
  final $Res Function(Score) _then;

/// Create a copy of Score
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstDigit = null,Object? secondDigit = null,Object? rawScore = null,}) {
  return _then(_self.copyWith(
firstDigit: null == firstDigit ? _self.firstDigit : firstDigit // ignore: cast_nullable_to_non_nullable
as int,secondDigit: null == secondDigit ? _self.secondDigit : secondDigit // ignore: cast_nullable_to_non_nullable
as int,rawScore: null == rawScore ? _self.rawScore : rawScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Score].
extension ScorePatterns on Score {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Score value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Score() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Score value)  $default,){
final _that = this;
switch (_that) {
case _Score():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Score value)?  $default,){
final _that = this;
switch (_that) {
case _Score() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int firstDigit,  int secondDigit,  int rawScore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Score() when $default != null:
return $default(_that.firstDigit,_that.secondDigit,_that.rawScore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int firstDigit,  int secondDigit,  int rawScore)  $default,) {final _that = this;
switch (_that) {
case _Score():
return $default(_that.firstDigit,_that.secondDigit,_that.rawScore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int firstDigit,  int secondDigit,  int rawScore)?  $default,) {final _that = this;
switch (_that) {
case _Score() when $default != null:
return $default(_that.firstDigit,_that.secondDigit,_that.rawScore);case _:
  return null;

}
}

}

/// @nodoc


class _Score implements Score {
  const _Score({required this.firstDigit, required this.secondDigit, required this.rawScore});
  

@override final  int firstDigit;
@override final  int secondDigit;
@override final  int rawScore;

/// Create a copy of Score
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScoreCopyWith<_Score> get copyWith => __$ScoreCopyWithImpl<_Score>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Score&&(identical(other.firstDigit, firstDigit) || other.firstDigit == firstDigit)&&(identical(other.secondDigit, secondDigit) || other.secondDigit == secondDigit)&&(identical(other.rawScore, rawScore) || other.rawScore == rawScore));
}


@override
int get hashCode => Object.hash(runtimeType,firstDigit,secondDigit,rawScore);

@override
String toString() {
  return 'Score(firstDigit: $firstDigit, secondDigit: $secondDigit, rawScore: $rawScore)';
}


}

/// @nodoc
abstract mixin class _$ScoreCopyWith<$Res> implements $ScoreCopyWith<$Res> {
  factory _$ScoreCopyWith(_Score value, $Res Function(_Score) _then) = __$ScoreCopyWithImpl;
@override @useResult
$Res call({
 int firstDigit, int secondDigit, int rawScore
});




}
/// @nodoc
class __$ScoreCopyWithImpl<$Res>
    implements _$ScoreCopyWith<$Res> {
  __$ScoreCopyWithImpl(this._self, this._then);

  final _Score _self;
  final $Res Function(_Score) _then;

/// Create a copy of Score
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstDigit = null,Object? secondDigit = null,Object? rawScore = null,}) {
  return _then(_Score(
firstDigit: null == firstDigit ? _self.firstDigit : firstDigit // ignore: cast_nullable_to_non_nullable
as int,secondDigit: null == secondDigit ? _self.secondDigit : secondDigit // ignore: cast_nullable_to_non_nullable
as int,rawScore: null == rawScore ? _self.rawScore : rawScore // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
