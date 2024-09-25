// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_history_currency_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetHistoryCurrencyParamsImpl _$$GetHistoryCurrencyParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$GetHistoryCurrencyParamsImpl(
      start_date: json['start_date'] as String,
      end_date: json['end_date'] as String,
      currencies: json['currencies'] as String,
      source: json['source'] as String,
    );

Map<String, dynamic> _$$GetHistoryCurrencyParamsImplToJson(
        _$GetHistoryCurrencyParamsImpl instance) =>
    <String, dynamic>{
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'currencies': instance.currencies,
      'source': instance.source,
    };
