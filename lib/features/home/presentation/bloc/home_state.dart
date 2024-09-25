part of 'home_bloc.dart';

abstract class CurrenciesState extends Equatable {
  const CurrenciesState();
}

class GetCurrenciesInitialState extends CurrenciesState {
  @override
  List<Object> get props => [];
}

class LoadingRefreshCurrenciesState extends CurrenciesState {
  @override
  List<Object?> get props => [];
}

class SuccessRefreshCurrenciesState extends CurrenciesState {
  @override
  List<Object?> get props => [];
}
class ErrorRefreshWithLocalCurrenciesState extends CurrenciesState {
  @override
  List<Object?> get props => [];
}

class GetLoadingCurrenciesState extends CurrenciesState {
  @override
  List<Object?> get props => [];
}

class SuccessCurrenciesState extends CurrenciesState {
  @override
  List<Object?> get props => [];
}

class GetLoadingDropDownCurrenciesState extends CurrenciesState {
  @override
  List<Object?> get props => [];
}

class SuccessDropDownCurrenciesState extends CurrenciesState {
  @override
  List<Object?> get props => [];
}

class HomeErrorState extends CurrenciesState {
  final String message;

  const HomeErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

class FilterCurrenciesState extends CurrenciesState {
  @override
  List<Object?> get props => [];
}

