import 'package:dartz/dartz.dart';

import '../../../../core/data_sources/utils/error_handler/error_handler.dart';
import '../../../../core/domain/entities/base_pagenation_entity.dart';
import '../../../../core/domain/entities/failure.dart';
import '../../../../core/domain/use_cases/get_pagenation_params.dart';
import '../entities/currencies_country_entity.dart';

abstract class BaseHomeRepository {
  // Future<Either<Failure, BasePaginationEntity>> getCurrenciesCountry(
  //     GetPaginationParams params);
  //
  Future<Either<FailureInterface, List<CurrenciesCountryEntity>>> getCurrenciesCountry();
}
