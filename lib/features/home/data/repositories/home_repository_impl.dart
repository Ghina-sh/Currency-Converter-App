import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kib_challenge/core/data_sources/mapper/pagination_mapper.dart';
import 'package:kib_challenge/features/home/data/mapper/home_mapper.dart';

import '../../../../core/const/data_store_keys.dart';
import '../../../../core/data_sources/data_base_config.dart';
import '../../../../core/data_sources/utils/error_handler/error_handler.dart';
import '../../../../core/data_sources/utils/network/base_network_info.dart';

import '../../../../core/domain/entities/base_pagenation_entity.dart';
import '../../../../core/domain/entities/failure.dart';
import '../../../../core/domain/use_cases/get_pagenation_params.dart';
import '../../../../core/utils/resources/local_messages_strings_manager.dart';
import '../../domain/entities/currencies_country_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../data_sources/home_remote_data_source.dart';

class HomeRepositoryImpl extends BaseHomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final NetworkInfo _networkInfo;

  HomeRepositoryImpl(this._homeRemoteDataSource, this._networkInfo);

  // @override
  // Future<Either<Failure, BasePaginationEntity>> getCurrenciesCountry() async {
  //   if (await _networkInfo.isConnected) {
  //     // its connected to internet, its safe to call API
  //     // try {
  //     final response = await _homeRemoteDataSource.getCurrenciesCountry();
  //     // success
  //     return Right(response.toDomain());
  //     // } catch (error) {
  //     //   log(error.toString());
  //     //   return Left(ErrorHandler.handle(error).failure);
  //     // }
  //   } else {
  //     // return internet connection error
  //     return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
  //   }
  // }

  @override
  Future<Either<FailureInterface, List<CurrenciesCountryEntity>>>
      getCurrenciesCountry() async {
    if (await _networkInfo.isConnected) {
      // its connected to internet, its safe to call API
      try {
        final response = await _homeRemoteDataSource.getCurrenciesCountry();
        // success
        CurrenciesCountriesEntity currenciesCountries =
            CurrenciesCountriesEntity(currencies: response.data!.toDomain());
        DataBaseConfig.instance.setDynamicData<CurrenciesCountriesEntity>(
            DataStoreKeys.currenciesCountry, currenciesCountries);
        return Right(response.data!.toDomain());
      } on DioException catch (e) {
        // Use e.message here instead of e.error
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
