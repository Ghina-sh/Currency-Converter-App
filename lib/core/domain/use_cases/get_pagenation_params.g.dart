// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pagenation_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetPaginationParamsImpl _$$GetPaginationParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$GetPaginationParamsImpl(
      page: (json['page'] as num).toInt(),
      per_page: (json['per_page'] as num?)?.toInt() ?? 30,
    );

Map<String, dynamic> _$$GetPaginationParamsImplToJson(
        _$GetPaginationParamsImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.per_page,
    };
