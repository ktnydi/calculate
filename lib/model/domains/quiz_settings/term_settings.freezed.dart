// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'term_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Term {

@DigitMapConverter() Digit get addition;@DigitMapConverter() Digit get subtraction;@DigitMapConverter() Digit get division;@DigitMapConverter() Digit get multiplication;
/// Create a copy of Term
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TermCopyWith<Term> get copyWith => _$TermCopyWithImpl<Term>(this as Term, _$identity);

  /// Serializes this Term to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Term&&(identical(other.addition, addition) || other.addition == addition)&&(identical(other.subtraction, subtraction) || other.subtraction == subtraction)&&(identical(other.division, division) || other.division == division)&&(identical(other.multiplication, multiplication) || other.multiplication == multiplication));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,addition,subtraction,division,multiplication);

@override
String toString() {
  return 'Term(addition: $addition, subtraction: $subtraction, division: $division, multiplication: $multiplication)';
}


}

/// @nodoc
abstract mixin class $TermCopyWith<$Res>  {
  factory $TermCopyWith(Term value, $Res Function(Term) _then) = _$TermCopyWithImpl;
@useResult
$Res call({
@DigitMapConverter() Digit addition,@DigitMapConverter() Digit subtraction,@DigitMapConverter() Digit division,@DigitMapConverter() Digit multiplication
});


$DigitCopyWith<$Res> get addition;$DigitCopyWith<$Res> get subtraction;$DigitCopyWith<$Res> get division;$DigitCopyWith<$Res> get multiplication;

}
/// @nodoc
class _$TermCopyWithImpl<$Res>
    implements $TermCopyWith<$Res> {
  _$TermCopyWithImpl(this._self, this._then);

  final Term _self;
  final $Res Function(Term) _then;

/// Create a copy of Term
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? addition = null,Object? subtraction = null,Object? division = null,Object? multiplication = null,}) {
  return _then(_self.copyWith(
addition: null == addition ? _self.addition : addition // ignore: cast_nullable_to_non_nullable
as Digit,subtraction: null == subtraction ? _self.subtraction : subtraction // ignore: cast_nullable_to_non_nullable
as Digit,division: null == division ? _self.division : division // ignore: cast_nullable_to_non_nullable
as Digit,multiplication: null == multiplication ? _self.multiplication : multiplication // ignore: cast_nullable_to_non_nullable
as Digit,
  ));
}
/// Create a copy of Term
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DigitCopyWith<$Res> get addition {
  
  return $DigitCopyWith<$Res>(_self.addition, (value) {
    return _then(_self.copyWith(addition: value));
  });
}/// Create a copy of Term
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DigitCopyWith<$Res> get subtraction {
  
  return $DigitCopyWith<$Res>(_self.subtraction, (value) {
    return _then(_self.copyWith(subtraction: value));
  });
}/// Create a copy of Term
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DigitCopyWith<$Res> get division {
  
  return $DigitCopyWith<$Res>(_self.division, (value) {
    return _then(_self.copyWith(division: value));
  });
}/// Create a copy of Term
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DigitCopyWith<$Res> get multiplication {
  
  return $DigitCopyWith<$Res>(_self.multiplication, (value) {
    return _then(_self.copyWith(multiplication: value));
  });
}
}


/// Adds pattern-matching-related methods to [Term].
extension TermPatterns on Term {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Term value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Term() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Term value)  $default,){
final _that = this;
switch (_that) {
case _Term():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Term value)?  $default,){
final _that = this;
switch (_that) {
case _Term() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@DigitMapConverter()  Digit addition, @DigitMapConverter()  Digit subtraction, @DigitMapConverter()  Digit division, @DigitMapConverter()  Digit multiplication)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Term() when $default != null:
return $default(_that.addition,_that.subtraction,_that.division,_that.multiplication);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@DigitMapConverter()  Digit addition, @DigitMapConverter()  Digit subtraction, @DigitMapConverter()  Digit division, @DigitMapConverter()  Digit multiplication)  $default,) {final _that = this;
switch (_that) {
case _Term():
return $default(_that.addition,_that.subtraction,_that.division,_that.multiplication);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@DigitMapConverter()  Digit addition, @DigitMapConverter()  Digit subtraction, @DigitMapConverter()  Digit division, @DigitMapConverter()  Digit multiplication)?  $default,) {final _that = this;
switch (_that) {
case _Term() when $default != null:
return $default(_that.addition,_that.subtraction,_that.division,_that.multiplication);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Term implements Term {
  const _Term({@DigitMapConverter() this.addition = const Digit(), @DigitMapConverter() this.subtraction = const Digit(), @DigitMapConverter() this.division = const Digit(), @DigitMapConverter() this.multiplication = const Digit()});
  factory _Term.fromJson(Map<String, dynamic> json) => _$TermFromJson(json);

@override@JsonKey()@DigitMapConverter() final  Digit addition;
@override@JsonKey()@DigitMapConverter() final  Digit subtraction;
@override@JsonKey()@DigitMapConverter() final  Digit division;
@override@JsonKey()@DigitMapConverter() final  Digit multiplication;

/// Create a copy of Term
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TermCopyWith<_Term> get copyWith => __$TermCopyWithImpl<_Term>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TermToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Term&&(identical(other.addition, addition) || other.addition == addition)&&(identical(other.subtraction, subtraction) || other.subtraction == subtraction)&&(identical(other.division, division) || other.division == division)&&(identical(other.multiplication, multiplication) || other.multiplication == multiplication));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,addition,subtraction,division,multiplication);

@override
String toString() {
  return 'Term(addition: $addition, subtraction: $subtraction, division: $division, multiplication: $multiplication)';
}


}

/// @nodoc
abstract mixin class _$TermCopyWith<$Res> implements $TermCopyWith<$Res> {
  factory _$TermCopyWith(_Term value, $Res Function(_Term) _then) = __$TermCopyWithImpl;
@override @useResult
$Res call({
@DigitMapConverter() Digit addition,@DigitMapConverter() Digit subtraction,@DigitMapConverter() Digit division,@DigitMapConverter() Digit multiplication
});


@override $DigitCopyWith<$Res> get addition;@override $DigitCopyWith<$Res> get subtraction;@override $DigitCopyWith<$Res> get division;@override $DigitCopyWith<$Res> get multiplication;

}
/// @nodoc
class __$TermCopyWithImpl<$Res>
    implements _$TermCopyWith<$Res> {
  __$TermCopyWithImpl(this._self, this._then);

  final _Term _self;
  final $Res Function(_Term) _then;

/// Create a copy of Term
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? addition = null,Object? subtraction = null,Object? division = null,Object? multiplication = null,}) {
  return _then(_Term(
addition: null == addition ? _self.addition : addition // ignore: cast_nullable_to_non_nullable
as Digit,subtraction: null == subtraction ? _self.subtraction : subtraction // ignore: cast_nullable_to_non_nullable
as Digit,division: null == division ? _self.division : division // ignore: cast_nullable_to_non_nullable
as Digit,multiplication: null == multiplication ? _self.multiplication : multiplication // ignore: cast_nullable_to_non_nullable
as Digit,
  ));
}

/// Create a copy of Term
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DigitCopyWith<$Res> get addition {
  
  return $DigitCopyWith<$Res>(_self.addition, (value) {
    return _then(_self.copyWith(addition: value));
  });
}/// Create a copy of Term
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DigitCopyWith<$Res> get subtraction {
  
  return $DigitCopyWith<$Res>(_self.subtraction, (value) {
    return _then(_self.copyWith(subtraction: value));
  });
}/// Create a copy of Term
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DigitCopyWith<$Res> get division {
  
  return $DigitCopyWith<$Res>(_self.division, (value) {
    return _then(_self.copyWith(division: value));
  });
}/// Create a copy of Term
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DigitCopyWith<$Res> get multiplication {
  
  return $DigitCopyWith<$Res>(_self.multiplication, (value) {
    return _then(_self.copyWith(multiplication: value));
  });
}
}


/// @nodoc
mixin _$Digit {

 int get first; int get second;
/// Create a copy of Digit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DigitCopyWith<Digit> get copyWith => _$DigitCopyWithImpl<Digit>(this as Digit, _$identity);

  /// Serializes this Digit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Digit&&(identical(other.first, first) || other.first == first)&&(identical(other.second, second) || other.second == second));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,first,second);

@override
String toString() {
  return 'Digit(first: $first, second: $second)';
}


}

/// @nodoc
abstract mixin class $DigitCopyWith<$Res>  {
  factory $DigitCopyWith(Digit value, $Res Function(Digit) _then) = _$DigitCopyWithImpl;
@useResult
$Res call({
 int first, int second
});




}
/// @nodoc
class _$DigitCopyWithImpl<$Res>
    implements $DigitCopyWith<$Res> {
  _$DigitCopyWithImpl(this._self, this._then);

  final Digit _self;
  final $Res Function(Digit) _then;

/// Create a copy of Digit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? first = null,Object? second = null,}) {
  return _then(_self.copyWith(
first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as int,second: null == second ? _self.second : second // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Digit].
extension DigitPatterns on Digit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Digit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Digit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Digit value)  $default,){
final _that = this;
switch (_that) {
case _Digit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Digit value)?  $default,){
final _that = this;
switch (_that) {
case _Digit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int first,  int second)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Digit() when $default != null:
return $default(_that.first,_that.second);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int first,  int second)  $default,) {final _that = this;
switch (_that) {
case _Digit():
return $default(_that.first,_that.second);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int first,  int second)?  $default,) {final _that = this;
switch (_that) {
case _Digit() when $default != null:
return $default(_that.first,_that.second);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Digit implements Digit {
  const _Digit({this.first = 2, this.second = 2});
  factory _Digit.fromJson(Map<String, dynamic> json) => _$DigitFromJson(json);

@override@JsonKey() final  int first;
@override@JsonKey() final  int second;

/// Create a copy of Digit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DigitCopyWith<_Digit> get copyWith => __$DigitCopyWithImpl<_Digit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DigitToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Digit&&(identical(other.first, first) || other.first == first)&&(identical(other.second, second) || other.second == second));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,first,second);

@override
String toString() {
  return 'Digit(first: $first, second: $second)';
}


}

/// @nodoc
abstract mixin class _$DigitCopyWith<$Res> implements $DigitCopyWith<$Res> {
  factory _$DigitCopyWith(_Digit value, $Res Function(_Digit) _then) = __$DigitCopyWithImpl;
@override @useResult
$Res call({
 int first, int second
});




}
/// @nodoc
class __$DigitCopyWithImpl<$Res>
    implements _$DigitCopyWith<$Res> {
  __$DigitCopyWithImpl(this._self, this._then);

  final _Digit _self;
  final $Res Function(_Digit) _then;

/// Create a copy of Digit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? first = null,Object? second = null,}) {
  return _then(_Digit(
first: null == first ? _self.first : first // ignore: cast_nullable_to_non_nullable
as int,second: null == second ? _self.second : second // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
