import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kib_challenge/core/utils/extensions.dart';
import 'package:kib_challenge/features/currency_converter/domain/entities/converter_entity.dart';

import '../../domain/use_cases/convert_currency_from_two_country_usecase.dart';

part 'currency_converter_event.dart';

part 'currency_converter_state.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  final ConvertCurrencyFromTwoCountryUseCase
      convertCurrencyFromTwoCountryUseCase;
  String fromCurrency = "";
  String toCurrency = "";
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  ConverterBloc({
    required this.convertCurrencyFromTwoCountryUseCase,
  }) : super(ConverterInitialState()) {
    on<InitDialogEvent>((event, emit) async {
      fromController.clear();
      toController.clear();
    });
    on<GetConvertCurrencyEvent>((event, emit) async {
      emit(ConverterLoadingState());
      var response = await convertCurrencyFromTwoCountryUseCase.call(
        params: ConvertCurrencyFromTwoCountryParams(
          from: event.from,
          to: event.to,
          amount: event.amount,
        ),
      );
      response.fold(
        (failure) =>
            {emit(ConverterErrorState(message: failure.message.orEmpty()))},
        (ConverterEntity success) {
          toController.text = success.result;
          emit(ConverterCompleteState());
        },
      );
    });
  }

  getConvertResult() {
    add(GetConvertCurrencyEvent(
      from: fromCurrency,
      to: toCurrency,
      amount: fromController.text,
    ));
  }
}
