import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kib_challenge/core/data_sources/utils/error_handler/error_handler.dart';
import 'package:kib_challenge/core/domain/use_cases/get_pagenation_params.dart';
import 'package:kib_challenge/features/home/domain/use_cases/get_currencies_country_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:kib_challenge/features/home/domain/entities/currencies_country_entity.dart';
import 'package:kib_challenge/features/home/presentation/bloc/home_bloc.dart';

import 'package:dartz/dartz.dart';
import 'home_bloc.mocks.dart';

@GenerateMocks([GetCurrenciesCountryUseCase])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late CurrenciesBloc currenciesBloc;
  late MockGetCurrenciesCountryUseCase mockGetCurrenciesCountryUseCase;

  setUp(() {
    mockGetCurrenciesCountryUseCase = MockGetCurrenciesCountryUseCase();
    currenciesBloc = CurrenciesBloc(
        getCurrenciesCountryUseCase: mockGetCurrenciesCountryUseCase);
  });

  tearDown(() {
    currenciesBloc.close();
  });

  // Test initial state
  test('initial state is GetCurrenciesInitialState', () {
    expect(currenciesBloc.state, GetCurrenciesInitialState());
  });

  // Test successful refresh
  blocTest<CurrenciesBloc, CurrenciesState>(
    'emits [LoadingRefreshCurrenciesState, SuccessRefreshCurrenciesState] when data is refreshed successfully',
    build: () {
      when(mockGetCurrenciesCountryUseCase.call(params: anyNamed('params')))
          .thenAnswer((_) async => Right([
                CurrenciesCountryEntity(
                    symbol: '\$',
                    name: 'united dollar',
                    code: 'USD',
                    countries: 'America'),
                CurrenciesCountryEntity(
                    symbol: '€',
                    name: 'euro',
                    code: 'EURO',
                    countries: 'Germany'),
              ]));

      return currenciesBloc;
    },
    act: (bloc) => bloc.add(const GetRefreshCurrencyEvent()),
    expect: () => [
      LoadingRefreshCurrenciesState(),
      SuccessRefreshCurrenciesState(),
    ],
    verify: (_) {
      verify(mockGetCurrenciesCountryUseCase.call(
              params: const GetPaginationParams(page: 1)))
          .called(1);
    },
  );

  // Test error handling
  blocTest<CurrenciesBloc, CurrenciesState>(
    'emits [GetLoadingCurrenciesState, HomeErrorState] when data fetch fails',
    build: () {
      when(mockGetCurrenciesCountryUseCase.call(params: anyNamed('params')))
          .thenAnswer((_) async => Left(ServerFailure('Failed to fetch data')));

      return currenciesBloc;
    },
    act: (bloc) => bloc.add(const GetLoadingCurrencyEvent()),
    expect: () => [
      GetLoadingCurrenciesState(),
      const HomeErrorState(message: 'Failed to fetch data'),
    ],
    verify: (_) {
      verify(mockGetCurrenciesCountryUseCase.call(
              params: const GetPaginationParams(page: 1)))
          .called(1);
    },
  );

  // Test filter event
  blocTest<CurrenciesBloc, CurrenciesState>(
    'emits [FilterCurrenciesState] when filter event is triggered',
    build: () => currenciesBloc,
    act: (bloc) => bloc.add(const FilterCurrencyEvent()),
    expect: () => [
      FilterCurrenciesState(),
    ],
  );
}
