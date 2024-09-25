// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'convert_currency_from_two_country_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConvertCurrencyFromTwoCountryParams
    _$ConvertCurrencyFromTwoCountryParamsFromJson(Map<String, dynamic> json) {
  return _ConvertCurrencyFromTwoCountryParams.fromJson(json);
}

/// @nodoc
mixin _$ConvertCurrencyFromTwoCountryParams {
  String get from => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;

  /// Serializes this ConvertCurrencyFromTwoCountryParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConvertCurrencyFromTwoCountryParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConvertCurrencyFromTwoCountryParamsCopyWith<
          ConvertCurrencyFromTwoCountryParams>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConvertCurrencyFromTwoCountryParamsCopyWith<$Res> {
  factory $ConvertCurrencyFromTwoCountryParamsCopyWith(
          ConvertCurrencyFromTwoCountryParams value,
          $Res Function(ConvertCurrencyFromTwoCountryParams) then) =
      _$ConvertCurrencyFromTwoCountryParamsCopyWithImpl<$Res,
          ConvertCurrencyFromTwoCountryParams>;
  @useResult
  $Res call({String from, String to, String amount});
}

/// @nodoc
class _$ConvertCurrencyFromTwoCountryParamsCopyWithImpl<$Res,
        $Val extends ConvertCurrencyFromTwoCountryParams>
    implements $ConvertCurrencyFromTwoCountryParamsCopyWith<$Res> {
  _$ConvertCurrencyFromTwoCountryParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConvertCurrencyFromTwoCountryParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConvertCurrencyFromTwoCountryParamsImplCopyWith<$Res>
    implements $ConvertCurrencyFromTwoCountryParamsCopyWith<$Res> {
  factory _$$ConvertCurrencyFromTwoCountryParamsImplCopyWith(
          _$ConvertCurrencyFromTwoCountryParamsImpl value,
          $Res Function(_$ConvertCurrencyFromTwoCountryParamsImpl) then) =
      __$$ConvertCurrencyFromTwoCountryParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String from, String to, String amount});
}

/// @nodoc
class __$$ConvertCurrencyFromTwoCountryParamsImplCopyWithImpl<$Res>
    extends _$ConvertCurrencyFromTwoCountryParamsCopyWithImpl<$Res,
        _$ConvertCurrencyFromTwoCountryParamsImpl>
    implements _$$ConvertCurrencyFromTwoCountryParamsImplCopyWith<$Res> {
  __$$ConvertCurrencyFromTwoCountryParamsImplCopyWithImpl(
      _$ConvertCurrencyFromTwoCountryParamsImpl _value,
      $Res Function(_$ConvertCurrencyFromTwoCountryParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConvertCurrencyFromTwoCountryParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? amount = null,
  }) {
    return _then(_$ConvertCurrencyFromTwoCountryParamsImpl(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConvertCurrencyFromTwoCountryParamsImpl
    implements _ConvertCurrencyFromTwoCountryParams {
  const _$ConvertCurrencyFromTwoCountryParamsImpl(
      {required this.from, required this.to, required this.amount});

  factory _$ConvertCurrencyFromTwoCountryParamsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ConvertCurrencyFromTwoCountryParamsImplFromJson(json);

  @override
  final String from;
  @override
  final String to;
  @override
  final String amount;

  @override
  String toString() {
    return 'ConvertCurrencyFromTwoCountryParams(from: $from, to: $to, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConvertCurrencyFromTwoCountryParamsImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, from, to, amount);

  /// Create a copy of ConvertCurrencyFromTwoCountryParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConvertCurrencyFromTwoCountryParamsImplCopyWith<
          _$ConvertCurrencyFromTwoCountryParamsImpl>
      get copyWith => __$$ConvertCurrencyFromTwoCountryParamsImplCopyWithImpl<
          _$ConvertCurrencyFromTwoCountryParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConvertCurrencyFromTwoCountryParamsImplToJson(
      this,
    );
  }
}

abstract class _ConvertCurrencyFromTwoCountryParams
    implements ConvertCurrencyFromTwoCountryParams {
  const factory _ConvertCurrencyFromTwoCountryParams(
          {required final String from,
          required final String to,
          required final String amount}) =
      _$ConvertCurrencyFromTwoCountryParamsImpl;

  factory _ConvertCurrencyFromTwoCountryParams.fromJson(
          Map<String, dynamic> json) =
      _$ConvertCurrencyFromTwoCountryParamsImpl.fromJson;

  @override
  String get from;
  @override
  String get to;
  @override
  String get amount;

  /// Create a copy of ConvertCurrencyFromTwoCountryParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConvertCurrencyFromTwoCountryParamsImplCopyWith<
          _$ConvertCurrencyFromTwoCountryParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
