part of 'currency_converter_bloc.dart';

abstract class ConverterEvent extends Equatable {
  const ConverterEvent();
}

class GetConvertCurrencyEvent extends ConverterEvent {
  String from;
  String to;
  String amount;

  GetConvertCurrencyEvent(
      {required this.from, required this.to, required this.amount});

  @override
  List<Object?> get props => [];
}

class InitDialogEvent extends ConverterEvent{
  @override
  List<Object?> get props => [];
}
