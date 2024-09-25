import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/data_sources/utils/error_handler/error_handler.dart';
import '../../../../core/data_sources/utils/network/base_network_info.dart';

import '../../../../core/domain/entities/failure.dart';
import '../../../../core/utils/resources/local_messages_strings_manager.dart';
import '../../domain/entities/converter_entity.dart';
import '../../domain/repositories/converter_repository.dart';
import '../../domain/use_cases/convert_currency_from_two_country_usecase.dart';
import '../data_sources/converter_remote_data_source.dart';

class ConverterRepositoryImpl extends BaseConverterRepository {
  final ConverterRemoteDataSource _converterRemoteDataSource;
  final NetworkInfo _networkInfo;

  ConverterRepositoryImpl(this._converterRemoteDataSource, this._networkInfo);

  @override
  Future<Either<FailureInterface, ConverterEntity>>
      convertCurrencyFromTwoCountry(
          ConvertCurrencyFromTwoCountryParams params) async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _converterRemoteDataSource
            .convertCurrencyFromTwoCountry(params);
        if (response.result != null) {
          // success
          // return Right(response.data!.toDomain());
          return Right(ConverterEntity(result: response.result.toString()));
        } else {
          return Left(GeneralFailure(response.error!.info.toString()));
        }
      } on DioException catch (e) {
        return Left(ServerFailure(e.message ?? AppLocalMessagesStringsManager().badRequestError));
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
