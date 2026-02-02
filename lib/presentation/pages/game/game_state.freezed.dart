// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameState {

 List<Quiz> get figuresList; int get index; String get answer; List<Answer> get answerList; int get time; bool get isFinished; bool get isRetired;
/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameStateCopyWith<GameState> get copyWith => _$GameStateCopyWithImpl<GameState>(this as GameState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameState&&const DeepCollectionEquality().equals(other.figuresList, figuresList)&&(identical(other.index, index) || other.index == index)&&(identical(other.answer, answer) || other.answer == answer)&&const DeepCollectionEquality().equals(other.answerList, answerList)&&(identical(other.time, time) || other.time == time)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.isRetired, isRetired) || other.isRetired == isRetired));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(figuresList),index,answer,const DeepCollectionEquality().hash(answerList),time,isFinished,isRetired);

@override
String toString() {
  return 'GameState(figuresList: $figuresList, index: $index, answer: $answer, answerList: $answerList, time: $time, isFinished: $isFinished, isRetired: $isRetired)';
}


}

/// @nodoc
abstract mixin class $GameStateCopyWith<$Res>  {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) _then) = _$GameStateCopyWithImpl;
@useResult
$Res call({
 List<Quiz> figuresList, int index, String answer, List<Answer> answerList, int time, bool isFinished, bool isRetired
});




}
/// @nodoc
class _$GameStateCopyWithImpl<$Res>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._self, this._then);

  final GameState _self;
  final $Res Function(GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? figuresList = null,Object? index = null,Object? answer = null,Object? answerList = null,Object? time = null,Object? isFinished = null,Object? isRetired = null,}) {
  return _then(_self.copyWith(
figuresList: null == figuresList ? _self.figuresList : figuresList // ignore: cast_nullable_to_non_nullable
as List<Quiz>,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,answerList: null == answerList ? _self.answerList : answerList // ignore: cast_nullable_to_non_nullable
as List<Answer>,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as int,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,isRetired: null == isRetired ? _self.isRetired : isRetired // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GameState].
extension GameStatePatterns on GameState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameState value)  $default,){
final _that = this;
switch (_that) {
case _GameState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameState value)?  $default,){
final _that = this;
switch (_that) {
case _GameState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Quiz> figuresList,  int index,  String answer,  List<Answer> answerList,  int time,  bool isFinished,  bool isRetired)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.figuresList,_that.index,_that.answer,_that.answerList,_that.time,_that.isFinished,_that.isRetired);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Quiz> figuresList,  int index,  String answer,  List<Answer> answerList,  int time,  bool isFinished,  bool isRetired)  $default,) {final _that = this;
switch (_that) {
case _GameState():
return $default(_that.figuresList,_that.index,_that.answer,_that.answerList,_that.time,_that.isFinished,_that.isRetired);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Quiz> figuresList,  int index,  String answer,  List<Answer> answerList,  int time,  bool isFinished,  bool isRetired)?  $default,) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.figuresList,_that.index,_that.answer,_that.answerList,_that.time,_that.isFinished,_that.isRetired);case _:
  return null;

}
}

}

/// @nodoc


class _GameState extends GameState {
  const _GameState({final  List<Quiz> figuresList = const [], this.index = 0, this.answer = '', final  List<Answer> answerList = const [], this.time = 0, this.isFinished = false, this.isRetired = false}): _figuresList = figuresList,_answerList = answerList,super._();
  

 final  List<Quiz> _figuresList;
@override@JsonKey() List<Quiz> get figuresList {
  if (_figuresList is EqualUnmodifiableListView) return _figuresList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_figuresList);
}

@override@JsonKey() final  int index;
@override@JsonKey() final  String answer;
 final  List<Answer> _answerList;
@override@JsonKey() List<Answer> get answerList {
  if (_answerList is EqualUnmodifiableListView) return _answerList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_answerList);
}

@override@JsonKey() final  int time;
@override@JsonKey() final  bool isFinished;
@override@JsonKey() final  bool isRetired;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameStateCopyWith<_GameState> get copyWith => __$GameStateCopyWithImpl<_GameState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameState&&const DeepCollectionEquality().equals(other._figuresList, _figuresList)&&(identical(other.index, index) || other.index == index)&&(identical(other.answer, answer) || other.answer == answer)&&const DeepCollectionEquality().equals(other._answerList, _answerList)&&(identical(other.time, time) || other.time == time)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.isRetired, isRetired) || other.isRetired == isRetired));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_figuresList),index,answer,const DeepCollectionEquality().hash(_answerList),time,isFinished,isRetired);

@override
String toString() {
  return 'GameState(figuresList: $figuresList, index: $index, answer: $answer, answerList: $answerList, time: $time, isFinished: $isFinished, isRetired: $isRetired)';
}


}

/// @nodoc
abstract mixin class _$GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(_GameState value, $Res Function(_GameState) _then) = __$GameStateCopyWithImpl;
@override @useResult
$Res call({
 List<Quiz> figuresList, int index, String answer, List<Answer> answerList, int time, bool isFinished, bool isRetired
});




}
/// @nodoc
class __$GameStateCopyWithImpl<$Res>
    implements _$GameStateCopyWith<$Res> {
  __$GameStateCopyWithImpl(this._self, this._then);

  final _GameState _self;
  final $Res Function(_GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? figuresList = null,Object? index = null,Object? answer = null,Object? answerList = null,Object? time = null,Object? isFinished = null,Object? isRetired = null,}) {
  return _then(_GameState(
figuresList: null == figuresList ? _self._figuresList : figuresList // ignore: cast_nullable_to_non_nullable
as List<Quiz>,index: null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,answerList: null == answerList ? _self._answerList : answerList // ignore: cast_nullable_to_non_nullable
as List<Answer>,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as int,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,isRetired: null == isRetired ? _self.isRetired : isRetired // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
