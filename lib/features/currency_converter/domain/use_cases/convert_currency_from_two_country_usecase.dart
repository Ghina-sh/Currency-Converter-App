import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data_sources/utils/error_handler/error_handler.dart';
import '../../../../core/domain/entities/failure.dart';
import '../../../../core/domain/use_cases/usecase.dart';
import '../entities/converter_entity.dart';
import '../repositories/converter_repository.dart';

part 'convert_currency_from_two_country_usecase.g.dart';

part 'convert_currency_from_two_country_usecase.freezed.dart';

class ConvertCurrencyFromTwoCountryUseCase
    extends UseCase<ConverterEntity, ConvertCurrencyFromTwoCountryParams> {
  final BaseConverterRepository repository;

  ConvertCurrencyFromTwoCountryUseCase({required this.repository});

  @override
  Future<Either<FailureInterface, ConverterEntity>> call(
      {required ConvertCurrencyFromTwoCountryParams params}) {
    return repository.convertCurrencyFromTwoCountry(params);
  }
}

@freezed
class ConvertCurrencyFromTwoCountryParams
    with _$ConvertCurrencyFromTwoCountryParams {
  const factory ConvertCurrencyFromTwoCountryParams({
    required String from,
    required String to,
    required String amount,
  }) = _ConvertCurrencyFromTwoCountryParams;

  factory ConvertCurrencyFromTwoCountryParams.fromJson(
          Map<String, dynamic> json) =>
      _$ConvertCurrencyFromTwoCountryParamsFromJson(json);
}
