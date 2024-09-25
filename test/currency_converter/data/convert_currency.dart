import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kib_challenge/core/const/api_routes.dart';
import 'package:kib_challenge/core/data_sources/models/base_response/base_response.dart';
import 'package:kib_challenge/core/data_sources/models/empty_model.dart';
import 'package:kib_challenge/core/data_sources/utils/error_handler/error_handler.dart';
import 'package:kib_challenge/features/currency_converter/data/data_sources/converter_remote_data_source.dart';
import 'package:kib_challenge/features/currency_converter/data/repositories/converter_repository_impl.dart';
import 'package:kib_challenge/features/currency_converter/domain/use_cases/convert_currency_from_two_country_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../core/base_mock.dart';
import 'convert_currency.mocks.dart';

class ConverterRemoteDataSourceTest extends BaseMockClass {}

@GenerateMocks([ConverterRemoteDataSourceImpl])
void main() {
  late ConverterRemoteDataSourceImpl mockDataSource;
  late ConverterRepositoryImpl repository;
  late ConverterRemoteDataSourceImpl dataSource;
  final convertTest = ConverterRemoteDataSourceTest();
  ConvertCurrencyFromTwoCountryParams params =
      const ConvertCurrencyFromTwoCountryParams(
          from: 'EUR', to: 'USD', amount: '100');

  setUp(() {
    convertTest.setUpMocks();
    mockDataSource = MockConverterRemoteDataSourceImpl();

    repository =
        ConverterRepositoryImpl(mockDataSource, convertTest.mockNetworkInfo);
    dataSource = ConverterRemoteDataSourceImpl(convertTest.mockService);
  });

  group('ConverterRemoteDataSourceImpl', () {
    test('convertCurrencyFromTwoCountry should return BaseResponse with result',
        () async {
      final expectedResponse = BaseResponse(
        success: true,
        error: null,
        result: 0.876,
      );

      Map<String, dynamic> thirdMap = {};
      final data = params.toJson();
      thirdMap.addAll(data);
      thirdMap.addAll({'access_key': dotenv.env['ACCESS_KEY']});

      // Mock the service response
      when(convertTest.mockService.performGetRequest(
        endpoint: anyNamed('endpoint'),
        fromJson: anyNamed('fromJson'),
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => expectedResponse);

      // Act: Call the method to actually perform the request
      final actualResponse =
          await dataSource.convertCurrencyFromTwoCountry(params);

      // Assert: Verify if the method behaves as expected
      expect(actualResponse.success, true); // Verify success status
      expect(actualResponse.result, 0.876); // Verify result

      // Verify that performGetRequest was called with the correct arguments
      verify(convertTest.mockService.performGetRequest(
        endpoint: AppUrls.convertCurrencyUrl,
        fromJson: EmptyModel.fromJson,
        queryParameters: thirdMap,
      )).called(1);
    });

    test('should throw Failure on DioError from data source', () async {
      // Create a DioException
      final dioError = DioException(
        requestOptions: RequestOptions(path: ''),
        type: DioExceptionType.badResponse,
        message: DioExceptionType.badResponse.name,
        response: Response(
          requestOptions: RequestOptions(path: ''),
          statusCode: 400, // Bad request error
          data: {},
        ),
      );

      when(convertTest.mockNetworkInfo.isConnected)
          .thenAnswer((_) async => true);

      // Mock the data source to throw DioException
      when(mockDataSource.convertCurrencyFromTwoCountry(params))
          .thenThrow(dioError);
      print("dioError.type: ${dioError.type}");

      final result = await repository.convertCurrencyFromTwoCountry(params);

      result.fold((failure) => print("failure.message: ${failure.message}"),
          (data) => null);

      expect(result.isLeft(), isTrue);
      expect(result.fold((failure) => failure, (data) => null),
          isA<FailureInterface>());
    });

    test('should throw Exception', () async {
      when(convertTest.mockNetworkInfo.isConnected)
          .thenAnswer((_) async => true);
      when(mockDataSource.convertCurrencyFromTwoCountry(params))
          .thenThrow(Exception('Exception Error'));

      // Call the repository method and expect it to throw a Failure
      final result = await repository.convertCurrencyFromTwoCountry(params);

      result.fold((failure) => print("failure.message: ${failure.message}"),
          (data) => null);
      // Verify the result is a Left(Failure)
      expect(result.isLeft(), isTrue);
      expect(result.fold((failure) => failure, (data) => null),
          isA<FailureInterface>());

      // Verify that the data source method was called
      verify(mockDataSource.convertCurrencyFromTwoCountry(params)).called(1);
    });
  });
}
