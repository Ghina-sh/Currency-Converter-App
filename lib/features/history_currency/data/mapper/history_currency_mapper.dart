import '../../domain/entities/history_currency_entity.dart';
import '../models/history_currency_model.dart';

extension HistoryCurrencyMapper on HistoryCurrencyModel {
  HistoryCurrencyEntity toDomain() {
    return HistoryCurrencyEntity(historyCurrency: historyCurrency);
  }
}
