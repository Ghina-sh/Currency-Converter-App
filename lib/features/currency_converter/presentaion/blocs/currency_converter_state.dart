part of 'currency_converter_bloc.dart';

abstract class ConverterState extends Equatable {
  const ConverterState();
}

class ConverterInitialState extends ConverterState {
  @override
  List<Object> get props => [];
}

class ConverterLoadingState extends ConverterState {
  @override
  List<Object?> get props => [];
}

class ConverterCompleteState extends ConverterState {
  @override
  List<Object?> get props => [];
}

class ConverterErrorState extends ConverterState {
  String? message;

  @override
  List<Object?> get props => [];

  ConverterErrorState({this.message});
}
