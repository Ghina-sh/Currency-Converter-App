import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kib_challenge/features/history_currency/data/mapper/history_currency_mapper.dart';

import '../../../../core/data_sources/utils/error_handler/error_handler.dart';
import '../../../../core/data_sources/utils/network/base_network_info.dart';

import '../../../../core/domain/entities/failure.dart';
import '../../../../core/utils/resources/local_messages_strings_manager.dart';
import '../../domain/entities/history_currency_entity.dart';
import '../../domain/repositories/history_currency_repository.dart';
import '../../domain/use_cases/get_history_currency_usecase.dart';
import '../data_sources/history_currency_remote_data_source.dart';

class HistoryCurrencyRepositoryImpl extends BaseHistoryCurrencyRepository {
  final HistoryCurrencyRemoteDataSource _homeRemoteDataSource;
  final NetworkInfo _networkInfo;

  HistoryCurrencyRepositoryImpl(this._homeRemoteDataSource, this._networkInfo);

  @override
  Future<Either<FailureInterface, HistoryCurrencyEntity>> getHistoryCurrency(
      GetHistoryCurrencyParams params) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _homeRemoteDataSource.getHistoryCurrency(params);
        // success
        return Right(response.data!.toDomain());
      } on DioException catch (e) {
        return Left(ServerFailure(
            e.message ?? AppLocalMessagesStringsManager().badRequestError));
      } catch (e) {
        return Left(GeneralFailure(e.toString()));
      }
    } else {
      // return internet connection error
      return Left(
          GeneralFailure(AppLocalMessagesStringsManager().internalServerError));
    }
  }
}
