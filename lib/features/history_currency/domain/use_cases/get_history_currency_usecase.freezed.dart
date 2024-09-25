// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_history_currency_usecase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetHistoryCurrencyParams _$GetHistoryCurrencyParamsFromJson(
    Map<String, dynamic> json) {
  return _GetHistoryCurrencyParams.fromJson(json);
}

/// @nodoc
mixin _$GetHistoryCurrencyParams {
  String get start_date => throw _privateConstructorUsedError;
  String get end_date => throw _privateConstructorUsedError;
  String get currencies => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;

  /// Serializes this GetHistoryCurrencyParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetHistoryCurrencyParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetHistoryCurrencyParamsCopyWith<GetHistoryCurrencyParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetHistoryCurrencyParamsCopyWith<$Res> {
  factory $GetHistoryCurrencyParamsCopyWith(GetHistoryCurrencyParams value,
          $Res Function(GetHistoryCurrencyParams) then) =
      _$GetHistoryCurrencyParamsCopyWithImpl<$Res, GetHistoryCurrencyParams>;
  @useResult
  $Res call(
      {String start_date, String end_date, String currencies, String source});
}

/// @nodoc
class _$GetHistoryCurrencyParamsCopyWithImpl<$Res,
        $Val extends GetHistoryCurrencyParams>
    implements $GetHistoryCurrencyParamsCopyWith<$Res> {
  _$GetHistoryCurrencyParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetHistoryCurrencyParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start_date = null,
    Object? end_date = null,
    Object? currencies = null,
    Object? source = null,
  }) {
    return _then(_value.copyWith(
      start_date: null == start_date
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as String,
      end_date: null == end_date
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as String,
      currencies: null == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetHistoryCurrencyParamsImplCopyWith<$Res>
    implements $GetHistoryCurrencyParamsCopyWith<$Res> {
  factory _$$GetHistoryCurrencyParamsImplCopyWith(
          _$GetHistoryCurrencyParamsImpl value,
          $Res Function(_$GetHistoryCurrencyParamsImpl) then) =
      __$$GetHistoryCurrencyParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String start_date, String end_date, String currencies, String source});
}

/// @nodoc
class __$$GetHistoryCurrencyParamsImplCopyWithImpl<$Res>
    extends _$GetHistoryCurrencyParamsCopyWithImpl<$Res,
        _$GetHistoryCurrencyParamsImpl>
    implements _$$GetHistoryCurrencyParamsImplCopyWith<$Res> {
  __$$GetHistoryCurrencyParamsImplCopyWithImpl(
      _$GetHistoryCurrencyParamsImpl _value,
      $Res Function(_$GetHistoryCurrencyParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetHistoryCurrencyParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start_date = null,
    Object? end_date = null,
    Object? currencies = null,
    Object? source = null,
  }) {
    return _then(_$GetHistoryCurrencyParamsImpl(
      start_date: null == start_date
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as String,
      end_date: null == end_date
          ? _value.end_date
          : end_date // ignore: cast_nullable_to_non_nullable
              as String,
      currencies: null == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetHistoryCurrencyParamsImpl implements _GetHistoryCurrencyParams {
  const _$GetHistoryCurrencyParamsImpl(
      {required this.start_date,
      required this.end_date,
      required this.currencies,
      required this.source});

  factory _$GetHistoryCurrencyParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetHistoryCurrencyParamsImplFromJson(json);

  @override
  final String start_date;
  @override
  final String end_date;
  @override
  final String currencies;
  @override
  final String source;

  @override
  String toString() {
    return 'GetHistoryCurrencyParams(start_date: $start_date, end_date: $end_date, currencies: $currencies, source: $source)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetHistoryCurrencyParamsImpl &&
            (identical(other.start_date, start_date) ||
                other.start_date == start_date) &&
            (identical(other.end_date, end_date) ||
                other.end_date == end_date) &&
            (identical(other.currencies, currencies) ||
                other.currencies == currencies) &&
            (identical(other.source, source) || other.source == source));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, start_date, end_date, currencies, source);

  /// Create a copy of GetHistoryCurrencyParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetHistoryCurrencyParamsImplCopyWith<_$GetHistoryCurrencyParamsImpl>
      get copyWith => __$$GetHistoryCurrencyParamsImplCopyWithImpl<
          _$GetHistoryCurrencyParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetHistoryCurrencyParamsImplToJson(
      this,
    );
  }
}

abstract class _GetHistoryCurrencyParams implements GetHistoryCurrencyParams {
  const factory _GetHistoryCurrencyParams(
      {required final String start_date,
      required final String end_date,
      required final String currencies,
      required final String source}) = _$GetHistoryCurrencyParamsImpl;

  factory _GetHistoryCurrencyParams.fromJson(Map<String, dynamic> json) =
      _$GetHistoryCurrencyParamsImpl.fromJson;

  @override
  String get start_date;
  @override
  String get end_date;
  @override
  String get currencies;
  @override
  String get source;

  /// Create a copy of GetHistoryCurrencyParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetHistoryCurrencyParamsImplCopyWith<_$GetHistoryCurrencyParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
