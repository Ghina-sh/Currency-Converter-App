part of 'history_currency_bloc.dart';

abstract class HistoryCurrencyState extends Equatable {
  const HistoryCurrencyState();
}

class HistoryCurrencyInitialState extends HistoryCurrencyState {
  @override
  List<Object> get props => [];
}

class HistoryCurrencyLoadingState extends HistoryCurrencyState {
  @override
  List<Object?> get props => [];
}

class HistoryCurrencyCompleteState extends HistoryCurrencyState {
  @override
  List<Object?> get props => [];
}


class HistoryCurrencyErrorState extends HistoryCurrencyState {
  final String? message;

  @override
  List<Object?> get props => [];

  const HistoryCurrencyErrorState({this.message});
}
