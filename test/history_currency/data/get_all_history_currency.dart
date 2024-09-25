import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kib_challenge/core/const/api_routes.dart';
import 'package:kib_challenge/core/data_sources/models/base_response/base_response.dart';
import 'package:kib_challenge/core/data_sources/utils/error_handler/error_handler.dart';
import 'package:kib_challenge/features/history_currency/data/data_sources/history_currency_remote_data_source.dart';
import 'package:kib_challenge/features/history_currency/data/models/history_currency_model.dart';
import 'package:kib_challenge/features/history_currency/data/repositories/history_currency_repository_impl.dart';
import 'package:kib_challenge/features/history_currency/domain/use_cases/get_history_currency_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../core/base_mock.dart';
import 'get_all_history_currency.mocks.dart';

class HistoryCurrencyRemoteDataSourceTest extends BaseMockClass {}

@GenerateMocks([HistoryCurrencyRemoteDataSourceImpl])
void main() {
  late HistoryCurrencyRemoteDataSourceImpl mockDataSource;
  late HistoryCurrencyRepositoryImpl repository;
  late HistoryCurrencyRemoteDataSourceImpl dataSource;
  final historyCurrencyTest = HistoryCurrencyRemoteDataSourceTest();
  GetHistoryCurrencyParams params = const GetHistoryCurrencyParams(
      start_date: '10-07-2000',
      end_date: '17-07-2000',
      currencies: 'USD',
      source: 'EUR');

  setUp(() {
    historyCurrencyTest.setUpMocks();
    mockDataSource = MockHistoryCurrencyRemoteDataSourceImpl();
    repository = HistoryCurrencyRepositoryImpl(
        mockDataSource, historyCurrencyTest.mockNetworkInfo);
    dataSource =
        HistoryCurrencyRemoteDataSourceImpl(historyCurrencyTest.mockService);
  });

  group('HistoryCurrencyRemoteDataSourceImpl', () {
    test(
        'getHistoryCurrency should return BaseResponse with HistoryCurrencyModel',
        () async {
      final expectedResponse = BaseResponse(
        success: true,
        error: null,
        data: HistoryCurrencyModel(historyCurrency: {'10-07-2000': 0.876}),
      );

      Map<String, dynamic> thirdMap = {};
      final data = params.toJson();
      thirdMap.addAll(data);
      thirdMap.addAll({'access_key': dotenv.env['ACCESS_KEY']});

      // Mock the service response
      when(historyCurrencyTest.mockService.performGetRequest(
        endpoint: anyNamed('endpoint'),
        fromJson: anyNamed('fromJson'),
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => expectedResponse);

      // Act: Call the method to actually perform the request
      final actualResponse = await dataSource.getHistoryCurrency(params);

      // Assert: Verify if the method behaves as expected
      expect(actualResponse.success, true); // Verify success status
      expect(actualResponse.data!.historyCurrency.length,
          1); // Verify data parsing
      expect(actualResponse.data!.historyCurrency['10-07-2000'],
          0.876); // Verify symbol value

      // Verify that performGetRequest was called with the correct arguments
      verify(historyCurrencyTest.mockService.performGetRequest(
        endpoint: AppUrls.getHistoryCurrencyUrl,
        fromJson: HistoryCurrencyModel.fromJson,
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

      when(historyCurrencyTest.mockNetworkInfo.isConnected)
          .thenAnswer((_) async => true);

      // Mock the data source to throw DioException
      when(mockDataSource.getHistoryCurrency(params)).thenThrow(dioError);
      print("dioError.type: ${dioError.type}");

      final result = await repository.getHistoryCurrency(params);

      result.fold((failure) => print("failure.message: ${failure.message}"),
          (data) => null);

      expect(result.isLeft(), isTrue);
      expect(result.fold((failure) => failure, (data) => null),
          isA<FailureInterface>());
    });

    test('should throw Exception', () async {
      when(historyCurrencyTest.mockNetworkInfo.isConnected)
          .thenAnswer((_) async => true);
      when(mockDataSource.getHistoryCurrency(params))
          .thenThrow(Exception('Exception Error'));

      // Call the repository method and expect it to throw a Failure
      final result = await repository.getHistoryCurrency(params);

      result.fold((failure) => print("failure.message: ${failure.message}"),
          (data) => null);
      // Verify the result is a Left(Failure)
      expect(result.isLeft(), isTrue);
      expect(result.fold((failure) => failure, (data) => null),
          isA<FailureInterface>());

      // Verify that the data source method was called
      verify(mockDataSource.getHistoryCurrency(params)).called(1);
    });
  });
}
