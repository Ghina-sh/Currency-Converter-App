import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kib_challenge/core/data_sources/models/empty_model.dart';

import '../../../../core/const/api_routes.dart';
import '../../../../core/data_sources/api_helper/app_api_helper.dart';
import '../../../../core/data_sources/models/base_response/base_response.dart';
import '../../domain/use_cases/convert_currency_from_two_country_usecase.dart';

abstract class ConverterRemoteDataSource {
  Future<BaseResponse> convertCurrencyFromTwoCountry(
      ConvertCurrencyFromTwoCountryParams params);
}

class ConverterRemoteDataSourceImpl extends ConverterRemoteDataSource {
  final AppApiHelper _appApiHelper;

  ConverterRemoteDataSourceImpl(this._appApiHelper);

  @override
  Future<BaseResponse> convertCurrencyFromTwoCountry(
      ConvertCurrencyFromTwoCountryParams params) async {
    Map<String, dynamic> thirdMap = {};
    final data = params.toJson();
    thirdMap.addAll(data);
    thirdMap.addAll({'access_key': dotenv.env['ACCESS_KEY']});
    return await _appApiHelper.performGetRequest(
      endpoint: AppUrls.convertCurrencyUrl,
      fromJson: EmptyModel.fromJson,
      queryParameters: thirdMap,
    );
  }
}
