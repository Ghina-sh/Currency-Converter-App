part of 'history_currency_bloc.dart';

abstract class HistoryCurrencyEvent extends Equatable {
  const HistoryCurrencyEvent();
}

class GetHistoryCurrenciesEvent extends HistoryCurrencyEvent {
  final String start_date;
  final String end_date;
  final String currencies;
  final String source;

  @override
  List<Object?> get props => [];

  const GetHistoryCurrenciesEvent(
      {required this.start_date,
      required this.end_date,
      required this.currencies,
      required this.source});
}
