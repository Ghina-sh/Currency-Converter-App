import 'package:dartz/dartz.dart';

import '../../../../core/data_sources/utils/error_handler/error_handler.dart';
import '../../../../core/domain/entities/failure.dart';
import '../entities/history_currency_entity.dart';
import '../use_cases/get_history_currency_usecase.dart';

abstract class BaseHistoryCurrencyRepository {
  Future<Either<FailureInterface, HistoryCurrencyEntity>> getHistoryCurrency(
      GetHistoryCurrencyParams params);
}
