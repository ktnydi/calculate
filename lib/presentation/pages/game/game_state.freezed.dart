// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameState {
  List<Quiz> get figuresList => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  List<Answer> get answerList => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;
  bool get isFinished => throw _privateConstructorUsedError;
  bool get isRetired => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameStateCopyWith<GameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
  @useResult
  $Res call(
      {List<Quiz> figuresList,
      int index,
      String answer,
      List<Answer> answerList,
      int time,
      bool isFinished,
      bool isRetired});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? figuresList = null,
    Object? index = null,
    Object? answer = null,
    Object? answerList = null,
    Object? time = null,
    Object? isFinished = null,
    Object? isRetired = null,
  }) {
    return _then(_value.copyWith(
      figuresList: null == figuresList
          ? _value.figuresList
          : figuresList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      answerList: null == answerList
          ? _value.answerList
          : answerList // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      isFinished: null == isFinished
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      isRetired: null == isRetired
          ? _value.isRetired
          : isRetired // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$$_GameStateCopyWith(
          _$_GameState value, $Res Function(_$_GameState) then) =
      __$$_GameStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Quiz> figuresList,
      int index,
      String answer,
      List<Answer> answerList,
      int time,
      bool isFinished,
      bool isRetired});
}

/// @nodoc
class __$$_GameStateCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$_GameState>
    implements _$$_GameStateCopyWith<$Res> {
  __$$_GameStateCopyWithImpl(
      _$_GameState _value, $Res Function(_$_GameState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? figuresList = null,
    Object? index = null,
    Object? answer = null,
    Object? answerList = null,
    Object? time = null,
    Object? isFinished = null,
    Object? isRetired = null,
  }) {
    return _then(_$_GameState(
      figuresList: null == figuresList
          ? _value._figuresList
          : figuresList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      answerList: null == answerList
          ? _value._answerList
          : answerList // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
      isFinished: null == isFinished
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      isRetired: null == isRetired
          ? _value.isRetired
          : isRetired // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_GameState extends _GameState {
  const _$_GameState(
      {final List<Quiz> figuresList = const [],
      this.index = 0,
      this.answer = '',
      final List<Answer> answerList = const [],
      this.time = 0,
      this.isFinished = false,
      this.isRetired = false})
      : _figuresList = figuresList,
        _answerList = answerList,
        super._();

  final List<Quiz> _figuresList;
  @override
  @JsonKey()
  List<Quiz> get figuresList {
    if (_figuresList is EqualUnmodifiableListView) return _figuresList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_figuresList);
  }

  @override
  @JsonKey()
  final int index;
  @override
  @JsonKey()
  final String answer;
  final List<Answer> _answerList;
  @override
  @JsonKey()
  List<Answer> get answerList {
    if (_answerList is EqualUnmodifiableListView) return _answerList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answerList);
  }

  @override
  @JsonKey()
  final int time;
  @override
  @JsonKey()
  final bool isFinished;
  @override
  @JsonKey()
  final bool isRetired;

  @override
  String toString() {
    return 'GameState(figuresList: $figuresList, index: $index, answer: $answer, answerList: $answerList, time: $time, isFinished: $isFinished, isRetired: $isRetired)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameState &&
            const DeepCollectionEquality()
                .equals(other._figuresList, _figuresList) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            const DeepCollectionEquality()
                .equals(other._answerList, _answerList) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.isFinished, isFinished) ||
                other.isFinished == isFinished) &&
            (identical(other.isRetired, isRetired) ||
                other.isRetired == isRetired));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_figuresList),
      index,
      answer,
      const DeepCollectionEquality().hash(_answerList),
      time,
      isFinished,
      isRetired);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GameStateCopyWith<_$_GameState> get copyWith =>
      __$$_GameStateCopyWithImpl<_$_GameState>(this, _$identity);
}

abstract class _GameState extends GameState {
  const factory _GameState(
      {final List<Quiz> figuresList,
      final int index,
      final String answer,
      final List<Answer> answerList,
      final int time,
      final bool isFinished,
      final bool isRetired}) = _$_GameState;
  const _GameState._() : super._();

  @override
  List<Quiz> get figuresList;
  @override
  int get index;
  @override
  String get answer;
  @override
  List<Answer> get answerList;
  @override
  int get time;
  @override
  bool get isFinished;
  @override
  bool get isRetired;
  @override
  @JsonKey(ignore: true)
  _$$_GameStateCopyWith<_$_GameState> get copyWith =>
      throw _privateConstructorUsedError;
}
