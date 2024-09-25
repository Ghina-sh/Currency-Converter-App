// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasePaginationModel<T> _$BasePaginationModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BasePaginationModel<T>(
      data: (json['data'] as List<dynamic>).map(fromJsonT).toList(),
      total: (json['total'] as num).toInt(),
      page: (json['page'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
      perPage: json['per_page'] as String,
      paginationType:
          $enumDecodeNullable(_$PaginationTypesEnumMap, json['paginationType']),
    );

Map<String, dynamic> _$BasePaginationModelToJson<T>(
  BasePaginationModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data.map(toJsonT).toList(),
      'total': instance.total,
      'page': instance.page,
      'pages': instance.pages,
      'per_page': instance.perPage,
      'paginationType': _$PaginationTypesEnumMap[instance.paginationType],
    };

const _$PaginationTypesEnumMap = {
  PaginationTypes.country: 'country',
};
