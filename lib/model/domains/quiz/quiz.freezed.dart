// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'quiz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Quiz _$QuizFromJson(Map<String, dynamic> json) {
  return _Quiz.fromJson(json);
}

/// @nodoc
class _$QuizTearOff {
  const _$QuizTearOff();

  _Quiz call({required List<int> figures, required QuizCategory type}) {
    return _Quiz(
      figures: figures,
      type: type,
    );
  }

  Quiz fromJson(Map<String, Object> json) {
    return Quiz.fromJson(json);
  }
}

/// @nodoc
const $Quiz = _$QuizTearOff();

/// @nodoc
mixin _$Quiz {
  List<int> get figures => throw _privateConstructorUsedError;
  QuizCategory get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuizCopyWith<Quiz> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizCopyWith<$Res> {
  factory $QuizCopyWith(Quiz value, $Res Function(Quiz) then) =
      _$QuizCopyWithImpl<$Res>;
  $Res call({List<int> figures, QuizCategory type});
}

/// @nodoc
class _$QuizCopyWithImpl<$Res> implements $QuizCopyWith<$Res> {
  _$QuizCopyWithImpl(this._value, this._then);

  final Quiz _value;
  // ignore: unused_field
  final $Res Function(Quiz) _then;

  @override
  $Res call({
    Object? figures = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      figures: figures == freezed
          ? _value.figures
          : figures // ignore: cast_nullable_to_non_nullable
              as List<int>,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QuizCategory,
    ));
  }
}

/// @nodoc
abstract class _$QuizCopyWith<$Res> implements $QuizCopyWith<$Res> {
  factory _$QuizCopyWith(_Quiz value, $Res Function(_Quiz) then) =
      __$QuizCopyWithImpl<$Res>;
  @override
  $Res call({List<int> figures, QuizCategory type});
}

/// @nodoc
class __$QuizCopyWithImpl<$Res> extends _$QuizCopyWithImpl<$Res>
    implements _$QuizCopyWith<$Res> {
  __$QuizCopyWithImpl(_Quiz _value, $Res Function(_Quiz) _then)
      : super(_value, (v) => _then(v as _Quiz));

  @override
  _Quiz get _value => super._value as _Quiz;

  @override
  $Res call({
    Object? figures = freezed,
    Object? type = freezed,
  }) {
    return _then(_Quiz(
      figures: figures == freezed
          ? _value.figures
          : figures // ignore: cast_nullable_to_non_nullable
              as List<int>,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as QuizCategory,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Quiz extends _Quiz {
  const _$_Quiz({required this.figures, required this.type}) : super._();

  factory _$_Quiz.fromJson(Map<String, dynamic> json) =>
      _$_$_QuizFromJson(json);

  @override
  final List<int> figures;
  @override
  final QuizCategory type;

  @override
  String toString() {
    return 'Quiz(figures: $figures, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Quiz &&
            (identical(other.figures, figures) ||
                const DeepCollectionEquality()
                    .equals(other.figures, figures)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(figures) ^
      const DeepCollectionEquality().hash(type);

  @JsonKey(ignore: true)
  @override
  _$QuizCopyWith<_Quiz> get copyWith =>
      __$QuizCopyWithImpl<_Quiz>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_QuizToJson(this);
  }
}

abstract class _Quiz extends Quiz {
  const factory _Quiz(
      {required List<int> figures, required QuizCategory type}) = _$_Quiz;
  const _Quiz._() : super._();

  factory _Quiz.fromJson(Map<String, dynamic> json) = _$_Quiz.fromJson;

  @override
  List<int> get figures => throw _privateConstructorUsedError;
  @override
  QuizCategory get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$QuizCopyWith<_Quiz> get copyWith => throw _privateConstructorUsedError;
}
