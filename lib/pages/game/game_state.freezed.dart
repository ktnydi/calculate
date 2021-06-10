// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'game_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GameStateTearOff {
  const _$GameStateTearOff();

  _GameState call(
      {List<Quiz> figuresList = const [],
      int index = 0,
      List<int> answer = const [],
      List<bool> correctList = const [],
      List<Answer> answerList = const [],
      int leftTime = 180,
      bool isFinished = false}) {
    return _GameState(
      figuresList: figuresList,
      index: index,
      answer: answer,
      correctList: correctList,
      answerList: answerList,
      leftTime: leftTime,
      isFinished: isFinished,
    );
  }
}

/// @nodoc
const $GameState = _$GameStateTearOff();

/// @nodoc
mixin _$GameState {
  List<Quiz> get figuresList => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  List<int> get answer => throw _privateConstructorUsedError;
  List<bool> get correctList => throw _privateConstructorUsedError;
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
      _$GameStateCopyWithImpl<$Res>;
  $Res call(
      {List<Quiz> figuresList,
      int index,
      List<int> answer,
      List<bool> correctList,
      List<Answer> answerList,
      int leftTime,
      bool isFinished});
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res> implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  final GameState _value;
  // ignore: unused_field
  final $Res Function(GameState) _then;

  @override
  $Res call({
    Object? figuresList = freezed,
    Object? index = freezed,
    Object? answer = freezed,
    Object? correctList = freezed,
    Object? answerList = freezed,
    Object? leftTime = freezed,
    Object? isFinished = freezed,
  }) {
    return _then(_value.copyWith(
      figuresList: figuresList == freezed
          ? _value.figuresList
          : figuresList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as List<int>,
      correctList: correctList == freezed
          ? _value.correctList
          : correctList // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      answerList: answerList == freezed
          ? _value.answerList
          : answerList // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      leftTime: leftTime == freezed
          ? _value.leftTime
          : leftTime // ignore: cast_nullable_to_non_nullable
              as int,
      isFinished: isFinished == freezed
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(
          _GameState value, $Res Function(_GameState) then) =
      __$GameStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Quiz> figuresList,
      int index,
      List<int> answer,
      List<bool> correctList,
      List<Answer> answerList,
      int leftTime,
      bool isFinished});
}

/// @nodoc
class __$GameStateCopyWithImpl<$Res> extends _$GameStateCopyWithImpl<$Res>
    implements _$GameStateCopyWith<$Res> {
  __$GameStateCopyWithImpl(_GameState _value, $Res Function(_GameState) _then)
      : super(_value, (v) => _then(v as _GameState));

  @override
  _GameState get _value => super._value as _GameState;

  @override
  $Res call({
    Object? figuresList = freezed,
    Object? index = freezed,
    Object? answer = freezed,
    Object? correctList = freezed,
    Object? answerList = freezed,
    Object? leftTime = freezed,
    Object? isFinished = freezed,
  }) {
    return _then(_GameState(
      figuresList: figuresList == freezed
          ? _value.figuresList
          : figuresList // ignore: cast_nullable_to_non_nullable
              as List<Quiz>,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as List<int>,
      correctList: correctList == freezed
          ? _value.correctList
          : correctList // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      answerList: answerList == freezed
          ? _value.answerList
          : answerList // ignore: cast_nullable_to_non_nullable
              as List<Answer>,
      leftTime: leftTime == freezed
          ? _value.leftTime
          : leftTime // ignore: cast_nullable_to_non_nullable
              as int,
      isFinished: isFinished == freezed
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_GameState implements _GameState {
  const _$_GameState(
      {this.figuresList = const [],
      this.index = 0,
      this.answer = const [],
      this.correctList = const [],
      this.answerList = const [],
      this.leftTime = 180,
      this.isFinished = false});

  @JsonKey(defaultValue: const [])
  @override
  final List<Quiz> figuresList;
  @JsonKey(defaultValue: 0)
  @override
  final int index;
  @JsonKey(defaultValue: const [])
  @override
  final List<int> answer;
  @JsonKey(defaultValue: const [])
  @override
  final List<bool> correctList;
  @JsonKey(defaultValue: const [])
  @override
  final List<Answer> answerList;
  @JsonKey(defaultValue: 180)
  @override
  final int leftTime;
  @JsonKey(defaultValue: false)
  @override
  final bool isFinished;

  @override
  String toString() {
    return 'GameState(figuresList: $figuresList, index: $index, answer: $answer, correctList: $correctList, answerList: $answerList, leftTime: $leftTime, isFinished: $isFinished)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GameState &&
            (identical(other.figuresList, figuresList) ||
                const DeepCollectionEquality()
                    .equals(other.figuresList, figuresList)) &&
            (identical(other.index, index) ||
                const DeepCollectionEquality().equals(other.index, index)) &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)) &&
            (identical(other.correctList, correctList) ||
                const DeepCollectionEquality()
                    .equals(other.correctList, correctList)) &&
            (identical(other.answerList, answerList) ||
                const DeepCollectionEquality()
                    .equals(other.answerList, answerList)) &&
            (identical(other.leftTime, leftTime) ||
                const DeepCollectionEquality()
                    .equals(other.leftTime, leftTime)) &&
            (identical(other.isFinished, isFinished) ||
                const DeepCollectionEquality()
                    .equals(other.isFinished, isFinished)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(figuresList) ^
      const DeepCollectionEquality().hash(index) ^
      const DeepCollectionEquality().hash(answer) ^
      const DeepCollectionEquality().hash(correctList) ^
      const DeepCollectionEquality().hash(answerList) ^
      const DeepCollectionEquality().hash(leftTime) ^
      const DeepCollectionEquality().hash(isFinished);

  @JsonKey(ignore: true)
  @override
  _$GameStateCopyWith<_GameState> get copyWith =>
      __$GameStateCopyWithImpl<_GameState>(this, _$identity);
}

abstract class _GameState implements GameState {
  const factory _GameState(
      {List<Quiz> figuresList,
      int index,
      List<int> answer,
      List<bool> correctList,
      List<Answer> answerList,
      int leftTime,
      bool isFinished}) = _$_GameState;

  @override
  List<Quiz> get figuresList => throw _privateConstructorUsedError;
  @override
  int get index => throw _privateConstructorUsedError;
  @override
  List<int> get answer => throw _privateConstructorUsedError;
  @override
  List<bool> get correctList => throw _privateConstructorUsedError;
  @override
  List<Answer> get answerList => throw _privateConstructorUsedError;
  @override
  int get leftTime => throw _privateConstructorUsedError;
  @override
  bool get isFinished => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$GameStateCopyWith<_GameState> get copyWith =>
      throw _privateConstructorUsedError;
}
