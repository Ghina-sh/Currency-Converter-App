import 'package:kib_challenge/features/home/data/mapper/home_mapper.dart';
import 'package:kib_challenge/features/home/data/models/currencies_country_model.dart';

import '../../domain/entities/base_pagenation_entity.dart';
import '../models/pagination_model/pagination_model.dart';
import '../utils/enum.dart';

extension PagenationDataModelMapper on BasePaginationModel {
  BasePaginationEntity toDomain() {
    List<dynamic> allData =
        getEntityList(paginationType ?? PaginationTypes.country, data);
    return BasePaginationEntity(
        data: allData,
        total: total,
        page: page,
        pages: pages,
        perPage: perPage);
  }
}

List<dynamic> getEntityList(
    PaginationTypes paginationType, List<dynamic> data) {
  List<dynamic> allData = [];
  switch (paginationType) {
    case PaginationTypes.country:
      {
        for (var element in data) {
          if (paginationType == PaginationTypes.country) {
            allData.add((element as CurrenciesCountryModel).toDomain());
          }
        }
        return allData;
      }

    default:
      return allData;
  }
}
