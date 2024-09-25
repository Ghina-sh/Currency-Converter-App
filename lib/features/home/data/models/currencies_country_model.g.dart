// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currencies_country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrenciesCountryModel _$CurrenciesCountryModelFromJson(
        Map<String, dynamic> json) =>
    CurrenciesCountryModel(
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      countries:
          CurrenciesCountryModel._countriesFromJson(json['countries'] as List),
    );

Map<String, dynamic> _$CurrenciesCountryModelToJson(
        CurrenciesCountryModel instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'name': instance.name,
      'code': instance.code,
      'countries': instance.countries,
    };
