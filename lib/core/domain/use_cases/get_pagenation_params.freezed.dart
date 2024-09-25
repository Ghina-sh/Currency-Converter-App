// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_pagenation_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetPaginationParams _$GetPaginationParamsFromJson(Map<String, dynamic> json) {
  return _GetPaginationParams.fromJson(json);
}

/// @nodoc
mixin _$GetPaginationParams {
  int get page => throw _privateConstructorUsedError;
  int? get per_page => throw _privateConstructorUsedError;

  /// Serializes this GetPaginationParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetPaginationParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetPaginationParamsCopyWith<GetPaginationParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPaginationParamsCopyWith<$Res> {
  factory $GetPaginationParamsCopyWith(
          GetPaginationParams value, $Res Function(GetPaginationParams) then) =
      _$GetPaginationParamsCopyWithImpl<$Res, GetPaginationParams>;
  @useResult
  $Res call({int page, int? per_page});
}

/// @nodoc
class _$GetPaginationParamsCopyWithImpl<$Res, $Val extends GetPaginationParams>
    implements $GetPaginationParamsCopyWith<$Res> {
  _$GetPaginationParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetPaginationParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? per_page = freezed,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      per_page: freezed == per_page
          ? _value.per_page
          : per_page // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetPaginationParamsImplCopyWith<$Res>
    implements $GetPaginationParamsCopyWith<$Res> {
  factory _$$GetPaginationParamsImplCopyWith(_$GetPaginationParamsImpl value,
          $Res Function(_$GetPaginationParamsImpl) then) =
      __$$GetPaginationParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int? per_page});
}

/// @nodoc
class __$$GetPaginationParamsImplCopyWithImpl<$Res>
    extends _$GetPaginationParamsCopyWithImpl<$Res, _$GetPaginationParamsImpl>
    implements _$$GetPaginationParamsImplCopyWith<$Res> {
  __$$GetPaginationParamsImplCopyWithImpl(_$GetPaginationParamsImpl _value,
      $Res Function(_$GetPaginationParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetPaginationParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? per_page = freezed,
  }) {
    return _then(_$GetPaginationParamsImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      per_page: freezed == per_page
          ? _value.per_page
          : per_page // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetPaginationParamsImpl implements _GetPaginationParams {
  const _$GetPaginationParamsImpl({required this.page, this.per_page = 30});

  factory _$GetPaginationParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetPaginationParamsImplFromJson(json);

  @override
  final int page;
  @override
  @JsonKey()
  final int? per_page;

  @override
  String toString() {
    return 'GetPaginationParams(page: $page, per_page: $per_page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPaginationParamsImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.per_page, per_page) ||
                other.per_page == per_page));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page, per_page);

  /// Create a copy of GetPaginationParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPaginationParamsImplCopyWith<_$GetPaginationParamsImpl> get copyWith =>
      __$$GetPaginationParamsImplCopyWithImpl<_$GetPaginationParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetPaginationParamsImplToJson(
      this,
    );
  }
}

abstract class _GetPaginationParams implements GetPaginationParams {
  const factory _GetPaginationParams(
      {required final int page,
      final int? per_page}) = _$GetPaginationParamsImpl;

  factory _GetPaginationParams.fromJson(Map<String, dynamic> json) =
      _$GetPaginationParamsImpl.fromJson;

  @override
  int get page;
  @override
  int? get per_page;

  /// Create a copy of GetPaginationParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetPaginationParamsImplCopyWith<_$GetPaginationParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
