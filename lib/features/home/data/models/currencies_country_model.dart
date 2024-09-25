
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currencies_country_model.g.dart';

class CurrenciesCountriesModel {
  List<CurrenciesCountryModel> currenciesCountries;

  CurrenciesCountriesModel({required this.currenciesCountries});

  factory CurrenciesCountriesModel.fromJson(Map<String, dynamic> json) {
    // log("Parsing CurrenciesCountriesModel: $json");

    // Handle the dynamic keys inside the 'data' field
    List<CurrenciesCountryModel> currencies = [];
    json.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        // Parse each currency data using CurrenciesCountryModel
        currencies.add(CurrenciesCountryModel.fromJson(value));
      }
    });

    // log("Parsed currencies: $currencies");

    return CurrenciesCountriesModel(currenciesCountries: currencies);
  }
}

@JsonSerializable()
class CurrenciesCountryModel {
  @JsonKey()
  String symbol;
  @JsonKey()
  String name;
  @JsonKey()
  String code;
  @JsonKey(fromJson: _countriesFromJson)
  String countries;

  factory CurrenciesCountryModel.fromJson(Map<String, dynamic> json) =>
      _$CurrenciesCountryModelFromJson(json);

  CurrenciesCountryModel(
      {required this.symbol,
      required this.name,
      required this.code,
      required this.countries});

  static String _countriesFromJson(List<dynamic> countries) {
    return countries.isNotEmpty ? countries.first as String : "";
  }
}
