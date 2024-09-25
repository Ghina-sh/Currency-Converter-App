part of 'home_bloc.dart';

abstract class CurrenciesEvent extends Equatable {
  const CurrenciesEvent();
}
class GetLoadingCurrencyEvent extends CurrenciesEvent {
  const GetLoadingCurrencyEvent();

  @override
  List<Object?> get props => [];
}

class GetRefreshCurrencyEvent extends CurrenciesEvent {
  const GetRefreshCurrencyEvent();

  @override
  List<Object?> get props => [];
}

class GetDropDownCurrencyEvent extends CurrenciesEvent {
  const GetDropDownCurrencyEvent();

  @override
  List<Object?> get props => [];
}

class FilterCurrencyEvent extends CurrenciesEvent {
  const FilterCurrencyEvent();

  @override
  List<Object?> get props => [];
}
