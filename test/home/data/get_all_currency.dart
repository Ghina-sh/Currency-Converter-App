import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kib_challenge/core/const/api_routes.dart';
import 'package:kib_challenge/core/data_sources/models/base_response/base_response.dart';
import 'package:kib_challenge/core/data_sources/utils/error_handler/error_handler.dart';
import 'package:kib_challenge/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:kib_challenge/features/home/data/models/currencies_country_model.dart';
import 'package:kib_challenge/features/home/data/repositories/home_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../core/base_mock.dart';
import 'get_all_currency.mocks.dart';

class HomeRemoteDataSourceTest extends BaseMockClass {}

@GenerateMocks([HomeRemoteDataSourceImpl])
void main() {
  late HomeRemoteDataSourceImpl mockDataSource;
  late HomeRepositoryImpl repository;
  late HomeRemoteDataSourceImpl dataSource;
  final homeTest = HomeRemoteDataSourceTest();


  setUp(() {
    homeTest.setUpMocks();
    mockDataSource = MockHomeRemoteDataSourceImpl();
    repository = HomeRepositoryImpl(mockDataSource, homeTest.mockNetworkInfo);
    dataSource = HomeRemoteDataSourceImpl(homeTest.mockService);
  });

  group('HomeRemoteDataSourceImpl', () {
    test(
        'getCurrenciesCountry should return BaseResponse with CurrenciesCountriesModel',
        () async {
      final expectedResponse = BaseResponse(
        success: true,
        error: null,
        data: CurrenciesCountriesModel(
          currenciesCountries: [
            CurrenciesCountryModel(
              symbol: "symbol",
              name: "name",
              code: "code",
              countries: "countries",
            )
          ],
        ),
      );

      when(homeTest.mockService.performGetRequest(
        endpoint: anyNamed('endpoint'),
        fromJson: anyNamed('fromJson'),
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => expectedResponse);

      // Act: Call the method to actually perform the request
      final actualResponse = await dataSource.getCurrenciesCountry();

      // Assert: Verify if the method behaves as expected
      expect(actualResponse.success, true); // Verify success status
      expect(actualResponse.data!.currenciesCountries.length,
          1); // Verify data parsing
      expect(actualResponse.data!.currenciesCountries[0].symbol,
          'symbol'); // Verify symbol value

      // Verify that performGetRequest was called with the correct arguments
      verify(homeTest.mockService.performGetRequest(
        endpoint: AppUrls.getCurrenciesCountryUrl,
        fromJson: CurrenciesCountriesModel.fromJson,
        queryParameters: {'apikey': dotenv.env['API_KEY']},
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

      when(homeTest.mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      // Mock the data source to throw DioException
      when(mockDataSource.getCurrenciesCountry()).thenThrow(dioError);
      print("dioError.type: ${dioError.type}");

      final result = await repository.getCurrenciesCountry();

      result.fold((failure) => print("failure.message: ${failure.message}"),
          (data) => null);

      expect(result.isLeft(), isTrue);
      expect(result.fold((failure) => failure, (data) => null),
          isA<FailureInterface>());
    });

    test('should throw Exception', () async {
      when(homeTest.mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockDataSource.getCurrenciesCountry())
          .thenThrow(Exception('Exception Error'));

      // Call the repository method and expect it to throw a Failure
      final result = await repository.getCurrenciesCountry();

      result.fold((failure) => print("failure.message: ${failure.message}"),
          (data) => null);
      // Verify the result is a Left(Failure)
      expect(result.isLeft(), isTrue);
      expect(result.fold((failure) => failure, (data) => null),
          isA<FailureInterface>());

      // Verify that the data source method was called
      verify(mockDataSource.getCurrenciesCountry()).called(1);
    });
  });
}
