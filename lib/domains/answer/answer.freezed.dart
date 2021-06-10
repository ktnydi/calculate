// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AnswerTearOff {
  const _$AnswerTearOff();

  _Answer call(
      {required Quiz quiz, required String answer, required bool isCorrect}) {
    return _Answer(
      quiz: quiz,
      answer: answer,
      isCorrect: isCorrect,
    );
  }
}

/// @nodoc
const $Answer = _$AnswerTearOff();

/// @nodoc
mixin _$Answer {
  Quiz get quiz => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  bool get isCorrect => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnswerCopyWith<Answer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnswerCopyWith<$Res> {
  factory $AnswerCopyWith(Answer value, $Res Function(Answer) then) =
      _$AnswerCopyWithImpl<$Res>;
  $Res call({Quiz quiz, String answer, bool isCorrect});

  $QuizCopyWith<$Res> get quiz;
}

/// @nodoc
class _$AnswerCopyWithImpl<$Res> implements $AnswerCopyWith<$Res> {
  _$AnswerCopyWithImpl(this._value, this._then);

  final Answer _value;
  // ignore: unused_field
  final $Res Function(Answer) _then;

  @override
  $Res call({
    Object? quiz = freezed,
    Object? answer = freezed,
    Object? isCorrect = freezed,
  }) {
    return _then(_value.copyWith(
      quiz: quiz == freezed
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as Quiz,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: isCorrect == freezed
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $QuizCopyWith<$Res> get quiz {
    return $QuizCopyWith<$Res>(_value.quiz, (value) {
      return _then(_value.copyWith(quiz: value));
    });
  }
}

/// @nodoc
abstract class _$AnswerCopyWith<$Res> implements $AnswerCopyWith<$Res> {
  factory _$AnswerCopyWith(_Answer value, $Res Function(_Answer) then) =
      __$AnswerCopyWithImpl<$Res>;
  @override
  $Res call({Quiz quiz, String answer, bool isCorrect});

  @override
  $QuizCopyWith<$Res> get quiz;
}

/// @nodoc
class __$AnswerCopyWithImpl<$Res> extends _$AnswerCopyWithImpl<$Res>
    implements _$AnswerCopyWith<$Res> {
  __$AnswerCopyWithImpl(_Answer _value, $Res Function(_Answer) _then)
      : super(_value, (v) => _then(v as _Answer));

  @override
  _Answer get _value => super._value as _Answer;

  @override
  $Res call({
    Object? quiz = freezed,
    Object? answer = freezed,
    Object? isCorrect = freezed,
  }) {
    return _then(_Answer(
      quiz: quiz == freezed
          ? _value.quiz
          : quiz // ignore: cast_nullable_to_non_nullable
              as Quiz,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      isCorrect: isCorrect == freezed
          ? _value.isCorrect
          : isCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Answer implements _Answer {
  const _$_Answer(
      {required this.quiz, required this.answer, required this.isCorrect});

  @override
  final Quiz quiz;
  @override
  final String answer;
  @override
  final bool isCorrect;

  @override
  String toString() {
    return 'Answer(quiz: $quiz, answer: $answer, isCorrect: $isCorrect)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Answer &&
            (identical(other.quiz, quiz) ||
                const DeepCollectionEquality().equals(other.quiz, quiz)) &&
            (identical(other.answer, answer) ||
                const DeepCollectionEquality().equals(other.answer, answer)) &&
            (identical(other.isCorrect, isCorrect) ||
                const DeepCollectionEquality()
                    .equals(other.isCorrect, isCorrect)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(quiz) ^
      const DeepCollectionEquality().hash(answer) ^
      const DeepCollectionEquality().hash(isCorrect);

  @JsonKey(ignore: true)
  @override
  _$AnswerCopyWith<_Answer> get copyWith =>
      __$AnswerCopyWithImpl<_Answer>(this, _$identity);
}

abstract class _Answer implements Answer {
  const factory _Answer(
      {required Quiz quiz,
      required String answer,
      required bool isCorrect}) = _$_Answer;

  @override
  Quiz get quiz => throw _privateConstructorUsedError;
  @override
  String get answer => throw _privateConstructorUsedError;
  @override
  bool get isCorrect => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AnswerCopyWith<_Answer> get copyWith => throw _privateConstructorUsedError;
}
