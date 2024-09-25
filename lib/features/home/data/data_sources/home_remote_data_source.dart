import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kib_challenge/core/data_sources/models/base_response/base_response.dart';
import 'package:kib_challenge/core/data_sources/utils/enum.dart';

import '../../../../core/const/api_routes.dart';
import '../../../../core/data_sources/api_helper/app_api_helper.dart';
import '../../../../core/data_sources/models/pagination_model/pagination_model.dart';
import '../../../../core/domain/use_cases/get_pagenation_params.dart';
import '../models/currencies_country_model.dart';

abstract class HomeRemoteDataSource {
  // Future<BasePaginationModel<CurrenciesCountryModel>> getCurrenciesCountry(
  //     GetPaginationParams params);

  Future<BaseResponse<CurrenciesCountriesModel>> getCurrenciesCountry();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final AppApiHelper _appApiHelper;

  HomeRemoteDataSourceImpl(this._appApiHelper);

  // @override
  // Future<BasePaginationModel<CurrenciesCountryModel>> getCurrenciesCountry(
  //     GetPaginationParams params) async {
  //   Map<String, dynamic> thirdMap = {};
  //   final data = params.toJson();
  //   thirdMap.addAll(data);
  //   thirdMap.addAll({'format': 'json'});
  //   return await _appApiHelper.performGetPagination(
  //       endpoint: AppUrls.getCurrenciesCountryUrl,
  //       fromJson: CurrenciesCountryModel.fromJson,
  //       paginationTypes: PaginationTypes.country,
  //       queryParameters: thirdMap);
  // }

  @override
  Future<BaseResponse<CurrenciesCountriesModel>> getCurrenciesCountry() async {
    Map<String, dynamic> accessMap = {};
    accessMap.addAll({'apikey': dotenv.env['API_KEY']});
    return await _appApiHelper.performGetRequest(
        endpoint: AppUrls.getCurrenciesCountryUrl,
        fromJson: CurrenciesCountriesModel.fromJson,
        queryParameters: accessMap);
  }
}
