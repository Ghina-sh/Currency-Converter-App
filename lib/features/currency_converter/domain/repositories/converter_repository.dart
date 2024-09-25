import 'package:dartz/dartz.dart';

import '../../../../core/data_sources/utils/error_handler/error_handler.dart';
import '../../../../core/domain/entities/failure.dart';
import '../entities/converter_entity.dart';
import '../use_cases/convert_currency_from_two_country_usecase.dart';

abstract class BaseConverterRepository {
  Future<Either<FailureInterface, ConverterEntity>> convertCurrencyFromTwoCountry(
      ConvertCurrencyFromTwoCountryParams params);
}
