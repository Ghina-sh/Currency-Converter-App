import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kib_challenge/core/utils/extensions.dart';

import '../../../../core/data_sources/utils/error_handler/error_handler.dart';
import '../../domain/entities/history_currency_entity.dart';
import '../../domain/use_cases/get_history_currency_usecase.dart';

part 'history_currency_event.dart';

part 'history_currency_state.dart';

class HistoryCurrencyBloc
    extends Bloc<HistoryCurrencyEvent, HistoryCurrencyState> {
  final GetHistoryCurrencyUseCase getHistoryCurrencyUseCase;
  late HistoryCurrencyEntity historyCurrencyEntity =
      HistoryCurrencyEntity(historyCurrency: <String, double>{});
  List<List<String>> data = [];
  String fromCurrency = "";
  String toCurrency = "";

  HistoryCurrencyBloc({
    required this.getHistoryCurrencyUseCase,
  }) : super(HistoryCurrencyInitialState()) {
    on<HistoryCurrencyEvent>((event, emit) async {
      if (event is GetHistoryCurrenciesEvent) {
        emit(HistoryCurrencyLoadingState());
        var response = await getHistoryCurrencyUseCase.call(
          params: GetHistoryCurrencyParams(
            start_date: event.start_date,
            end_date: event.end_date,
            currencies: event.currencies,
            source: event.source,
          ),
        );
        response.fold(
          (FailureInterface failure) => {
            emit(HistoryCurrencyErrorState(message: failure.message.orEmpty()))
          },
          (HistoryCurrencyEntity success) {
            historyCurrencyEntity = success;
            // Add the currency changes with their date in each list
            historyCurrencyEntity.historyCurrency.forEach((date, changes) {
              data.add([changes.toString(), date]);
            });
            emit(HistoryCurrencyCompleteState());
          },
        );
      }
    });
  }

  onTapSearch() {
    // Get current date
    DateTime currentDate = DateTime.now();

    // Get the date 7 days ago
    DateTime last7DaysDate = currentDate.subtract(const Duration(days: 7));

    // Format the dates
    String formattedCurrentDate = DateFormat('yyyy-MM-dd').format(currentDate);
    String formattedLast7DaysDate =
        DateFormat('yyyy-MM-dd').format(last7DaysDate);
    add(
      GetHistoryCurrenciesEvent(
        start_date: formattedLast7DaysDate,
        end_date: formattedCurrentDate,
        currencies: fromCurrency,
        source: toCurrency,
      ),
    );
  }
}
