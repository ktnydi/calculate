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
  List<int> get answer => throw _privateConstructorUsedError;
  List<Answer> get answerList => throw _privateConstructorUsedError;
  int get leftTime => throw _privateConstructorUsedError;
  bool get isFinished => throw _privateConstructorUsedError;

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
      List<int> answer,
      List<Answer> answerList,
      int leftTime,
      bool isFinished});
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
    Object? leftTime = null,
    Object? isFinished = null,
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
              as List<int>,
      answerList: null == answerList
          ? _value.answerList
          : answerList // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      leftTime: null == leftTime
          ? _value.leftTime
          : leftTime // ignore: cast_nullable_to_non_nullable
              as int,
      isFinished: null == isFinished
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
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
      List<int> answer,
      List<Answer> answerList,
      int leftTime,
      bool isFinished});
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
    Object? leftTime = null,
    Object? isFinished = null,
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
          ? _value._answer
          : answer // ignore: cast_nullable_to_non_nullable
              as List<int>,
      answerList: null == answerList
          ? _value._answerList
          : answerList // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      leftTime: null == leftTime
          ? _value.leftTime
          : leftTime // ignore: cast_nullable_to_non_nullable
              as int,
      isFinished: null == isFinished
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_GameState extends _GameState {
  const _$_GameState(
      {final List<Quiz> figuresList = const [],
      this.index = 0,
      final List<int> answer = const [],
      final List<Answer> answerList = const [],
      this.leftTime = 180,
      this.isFinished = false})
      : _figuresList = figuresList,
        _answer = answer,
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
  final List<int> _answer;
  @override
  @JsonKey()
  List<int> get answer {
    if (_answer is EqualUnmodifiableListView) return _answer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answer);
  }

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
  final int leftTime;
  @override
  @JsonKey()
  final bool isFinished;

  @override
  String toString() {
    return 'GameState(figuresList: $figuresList, index: $index, answer: $answer, answerList: $answerList, leftTime: $leftTime, isFinished: $isFinished)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameState &&
            const DeepCollectionEquality()
                .equals(other._figuresList, _figuresList) &&
            (identical(other.index, index) || other.index == index) &&
            const DeepCollectionEquality().equals(other._answer, _answer) &&
            const DeepCollectionEquality()
                .equals(other._answerList, _answerList) &&
            (identical(other.leftTime, leftTime) ||
                other.leftTime == leftTime) &&
            (identical(other.isFinished, isFinished) ||
                other.isFinished == isFinished));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_figuresList),
      index,
      const DeepCollectionEquality().hash(_answer),
      const DeepCollectionEquality().hash(_answerList),
      leftTime,
      isFinished);

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
      final List<int> answer,
      final List<Answer> answerList,
      final int leftTime,
      final bool isFinished}) = _$_GameState;
  const _GameState._() : super._();

  @override
  List<Quiz> get figuresList;
  @override
  int get index;
  @override
  List<int> get answer;
  @override
  List<Answer> get answerList;
  @override
  int get leftTime;
  @override
  bool get isFinished;
  @override
  @JsonKey(ignore: true)
  _$$_GameStateCopyWith<_$_GameState> get copyWith =>
      throw _privateConstructorUsedError;
}
