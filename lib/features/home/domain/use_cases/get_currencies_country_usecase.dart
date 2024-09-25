import 'package:dartz/dartz.dart';

import '../../../../core/data_sources/utils/error_handler/error_handler.dart';
import '../../../../core/domain/entities/base_pagenation_entity.dart';
import '../../../../core/domain/entities/failure.dart';
import '../../../../core/domain/use_cases/get_pagenation_params.dart';
import '../../../../core/domain/use_cases/usecase.dart';
import '../entities/currencies_country_entity.dart';
import '../repositories/home_repository.dart';

class GetCurrenciesCountryUseCase
    extends UseCase<List<CurrenciesCountryEntity>, GetPaginationParams> {
  final BaseHomeRepository repository;

  GetCurrenciesCountryUseCase({required this.repository});

  @override
  Future<Either<FailureInterface, List<CurrenciesCountryEntity>>> call(
      {required GetPaginationParams params}) {
    return repository.getCurrenciesCountry();
  }
}
