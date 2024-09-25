import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data_sources/utils/error_handler/error_handler.dart';
import '../../../../core/domain/entities/failure.dart';
import '../../../../core/domain/use_cases/usecase.dart';
import '../entities/history_currency_entity.dart';
import '../repositories/history_currency_repository.dart';

part 'get_history_currency_usecase.g.dart';

part 'get_history_currency_usecase.freezed.dart';

class GetHistoryCurrencyUseCase
    extends UseCase<HistoryCurrencyEntity, GetHistoryCurrencyParams> {
  final BaseHistoryCurrencyRepository repository;

  GetHistoryCurrencyUseCase({required this.repository});

  @override
  Future<Either<FailureInterface, HistoryCurrencyEntity>> call(
      {required GetHistoryCurrencyParams params}) {
    return repository.getHistoryCurrency(params);
  }
}

@freezed
class GetHistoryCurrencyParams with _$GetHistoryCurrencyParams {
  const factory GetHistoryCurrencyParams({
    required String start_date,
    required String end_date,
    required String currencies,
    required String source,
  }) = _GetHistoryCurrencyParams;

  factory GetHistoryCurrencyParams.fromJson(Map<String, dynamic> json) =>
      _$GetHistoryCurrencyParamsFromJson(json);

// final String? start_date;
// final String? end_date;
// final String? currencies;
// final String? source;

// GetHistoryCurrencyParams(
//     {this.start_date, this.end_date, this.currencies, this.source});
}
