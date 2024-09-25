import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kib_challenge/core/data_sources/utils/error_handler/error_handler.dart';
import 'package:kib_challenge/features/history_currency/domain/entities/history_currency_entity.dart';
import 'package:kib_challenge/features/history_currency/domain/use_cases/get_history_currency_usecase.dart';
import 'package:kib_challenge/features/history_currency/presentaion/blocs/history_currency_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:dartz/dartz.dart';
import 'history_currency_bloc.mocks.dart';

@GenerateMocks([GetHistoryCurrencyUseCase])
void main() {
  late HistoryCurrencyBloc historyCurrencyBloc;
  late MockGetHistoryCurrencyUseCase mockGetHistoryCurrencyUseCase;

  setUp(() {
    mockGetHistoryCurrencyUseCase = MockGetHistoryCurrencyUseCase();
    historyCurrencyBloc = HistoryCurrencyBloc(
      getHistoryCurrencyUseCase: mockGetHistoryCurrencyUseCase,
    );
  });

  tearDown(() {
    historyCurrencyBloc.close();
  });

  // Test initial state
  test('initial state is HistoryCurrencyInitialState', () {
    expect(historyCurrencyBloc.state, HistoryCurrencyInitialState());
  });

  // Successful history data fetch
  blocTest<HistoryCurrencyBloc, HistoryCurrencyState>(
    'emits [HistoryCurrencyLoadingState, HistoryCurrencyCompleteState] when history data is fetched successfully',
    build: () {
      when(mockGetHistoryCurrencyUseCase.call(
        params: anyNamed('params'),
      )).thenAnswer(
        (_) async => Right(
          HistoryCurrencyEntity(historyCurrency: {
            '2023-09-19': 100.0,
            '2023-09-18': 98.5,
          }),
        ),
      );
      return historyCurrencyBloc;
    },
    act: (bloc) => bloc.add(
      const GetHistoryCurrenciesEvent(
        start_date: '2023-09-12',
        end_date: '2023-09-19',
        currencies: 'USD',
        source: 'EUR',
      ),
    ),
    expect: () => [
      HistoryCurrencyLoadingState(),
      HistoryCurrencyCompleteState(),
    ],
    verify: (_) {
      // Verify the use case was called with the correct parameters
      verify(mockGetHistoryCurrencyUseCase.call(
        params: const GetHistoryCurrencyParams(
          start_date: '2023-09-12',
          end_date: '2023-09-19',
          currencies: 'USD',
          source: 'EUR',
        ),
      )).called(1);
    },
  );

  // Error case: History data fetch failure
  blocTest<HistoryCurrencyBloc, HistoryCurrencyState>(
    'emits [HistoryCurrencyLoadingState, HistoryCurrencyErrorState] when data fetch fails',
    build: () {
      when(mockGetHistoryCurrencyUseCase.call(
        params: anyNamed('params'),
      )).thenAnswer(
        (_) async => Left(ServerFailure('Failed to fetch history data')),
      );
      return historyCurrencyBloc;
    },
    act: (bloc) => bloc.add(
      const GetHistoryCurrenciesEvent(
        start_date: '2023-09-12',
        end_date: '2023-09-19',
        currencies: 'USD',
        source: 'EUR',
      ),
    ),
    expect: () => [
      HistoryCurrencyLoadingState(),
      const HistoryCurrencyErrorState(message: 'Failed to fetch history data'),
    ],
    verify: (_) {
      // Verify the use case was called with the correct parameters
      verify(mockGetHistoryCurrencyUseCase.call(
        params: const GetHistoryCurrencyParams(
          start_date: '2023-09-12',
          end_date: '2023-09-19',
          currencies: 'USD',
          source: 'EUR',
        ),
      )).called(1);
    },
  );
}
