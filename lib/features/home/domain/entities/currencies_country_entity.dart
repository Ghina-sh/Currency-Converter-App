import 'package:hive_flutter/hive_flutter.dart';

part 'currencies_country_entity.g.dart';

@HiveType(typeId: 2)
class CurrenciesCountriesEntity {
  @HiveField(0)
  List<CurrenciesCountryEntity> currencies;

  CurrenciesCountriesEntity({required this.currencies});
}

@HiveType(typeId: 1)
class CurrenciesCountryEntity {
  @HiveField(0)
  String symbol;
  @HiveField(1)
  String name;
  @HiveField(2)
  String code;
  @HiveField(3)
  String countries;

  CurrenciesCountryEntity({
    required this.symbol,
    required this.name,
    required this.code,
    required this.countries,
  });
}
