import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/const/api_routes.dart';
import '../../../../core/data_sources/api_helper/app_api_helper.dart';
import '../../../../core/data_sources/models/base_response/base_response.dart';
import '../../domain/use_cases/get_history_currency_usecase.dart';
import '../models/history_currency_model.dart';

abstract class HistoryCurrencyRemoteDataSource {
  Future<BaseResponse<HistoryCurrencyModel>> getHistoryCurrency(
      GetHistoryCurrencyParams params);
}

class HistoryCurrencyRemoteDataSourceImpl
    extends HistoryCurrencyRemoteDataSource {
  final AppApiHelper _appApiHelper;

  HistoryCurrencyRemoteDataSourceImpl(this._appApiHelper);

  @override
  Future<BaseResponse<HistoryCurrencyModel>> getHistoryCurrency(
      GetHistoryCurrencyParams params) async {
    Map<String, dynamic> thirdMap = {};
    final data = params.toJson();
    thirdMap.addAll(data);
    thirdMap.addAll({'access_key': dotenv.env['ACCESS_KEY']});
    return await _appApiHelper.performGetRequest(
      endpoint: AppUrls.getHistoryCurrencyUrl,
      fromJson: HistoryCurrencyModel.fromJson,
      queryParameters: thirdMap,
    );
  }
}
