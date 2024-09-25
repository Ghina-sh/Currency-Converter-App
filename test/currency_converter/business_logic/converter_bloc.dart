import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:kib_challenge/core/data_sources/utils/error_handler/error_handler.dart';
import 'package:kib_challenge/features/currency_converter/domain/entities/converter_entity.dart';
import 'package:kib_challenge/features/currency_converter/domain/use_cases/convert_currency_from_two_country_usecase.dart';
import 'package:kib_challenge/features/currency_converter/presentaion/blocs/currency_converter_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'converter_bloc.mocks.dart';

//
// // Mock the UseCase
// class MockConvertCurrencyUseCase extends Mock implements ConvertCurrencyFromTwoCountryUseCase {}

@GenerateMocks([ConvertCurrencyFromTwoCountryUseCase])
void main() {
  late ConverterBloc converterBloc;
  late MockConvertCurrencyFromTwoCountryUseCase mockConvertCurrencyUseCase;

  setUp(() {
    mockConvertCurrencyUseCase = MockConvertCurrencyFromTwoCountryUseCase();
    converterBloc = ConverterBloc(
      convertCurrencyFromTwoCountryUseCase: mockConvertCurrencyUseCase,
    );
  });

  tearDown(() {
    converterBloc.close();
  });

  // Test initial state
  test('initial state is ConverterInitialState', () {
    expect(converterBloc.state, ConverterInitialState());
  });

  // Successful conversion
  blocTest<ConverterBloc, ConverterState>(
    'emits [ConverterLoadingState, ConverterCompleteState] when conversion is successful',
    build: () {
      when(mockConvertCurrencyUseCase.call(
        params: anyNamed('params'),
      )).thenAnswer((_) async => Right(ConverterEntity(result: '100.00')));
      return converterBloc;
    },
    act: (bloc) => bloc.add(GetConvertCurrencyEvent(
      from: 'USD',
      to: 'EUR',
      amount: '50',
    )),
    expect: () => [
      ConverterLoadingState(),
      ConverterCompleteState(),
    ],
    verify: (_) {
      // Verify that the use case was called with the correct parameters
      verify(mockConvertCurrencyUseCase.call(
        params: const ConvertCurrencyFromTwoCountryParams(
          from: 'USD',
          to: 'EUR',
          amount: '50',
        ),
      )).called(1);
    },
  );

  // Error case
  blocTest<ConverterBloc, ConverterState>(
    'emits [ConverterLoadingState, ConverterErrorState] when conversion fails',
    build: () {
      when(mockConvertCurrencyUseCase.call(
        params: anyNamed('params'),
      )).thenAnswer(
          (_) async => Left(ServerFailure('Conversion failed')));
      return converterBloc;
    },
    act: (bloc) => bloc.add(GetConvertCurrencyEvent(
      from: 'USD',
      to: 'EUR',
      amount: '50',
    )),
    expect: () => [
      ConverterLoadingState(),
      ConverterErrorState(message: 'Conversion failed'),
    ],
    verify: (_) {
      // Verify that the use case was called with the correct parameters
      verify(mockConvertCurrencyUseCase.call(
        params: const ConvertCurrencyFromTwoCountryParams(
          from: 'USD',
          to: 'EUR',
          amount: '50',
        ),
      )).called(1);
    },
  );
}
