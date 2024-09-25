import '../../domain/entities/currencies_country_entity.dart';
import '../models/currencies_country_model.dart';

extension CurrenciesCountryMapper on CurrenciesCountryModel {
  CurrenciesCountryEntity toDomain() {
    return CurrenciesCountryEntity(
        symbol: symbol, name: name, code: code, countries: countries);
  }
}

extension CurrenciesCountriesMapper on CurrenciesCountriesModel {
  List<CurrenciesCountryEntity> toDomain() {
    List<CurrenciesCountryEntity> allCurrencies = [];
    for (var element in currenciesCountries) {
      allCurrencies.add(element.toDomain());
    }
    return allCurrencies;
  }
}
