import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kib_challenge/core/domain/entities/base_pagenation_entity.dart';
import 'package:kib_challenge/core/utils/extensions.dart';
import 'package:kib_challenge/features/home/domain/entities/currencies_country_entity.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../core/const/data_store_keys.dart';
import '../../../../core/data_sources/data_base_config.dart';
import '../../../../core/data_sources/utils/error_handler/error_handler.dart';
import '../../../../core/domain/use_cases/get_pagenation_params.dart';
import '../../domain/use_cases/get_currencies_country_usecase.dart';

part 'home_event.dart';

part 'home_state.dart';

class CurrenciesBloc extends Bloc<CurrenciesEvent, CurrenciesState> {
  final GetCurrenciesCountryUseCase getCurrenciesCountryUseCase;
  RefreshController refreshController = RefreshController();
  late BasePaginationEntity paginationEntity;
  FailureInterface failure = GeneralFailure('');
  List<CurrenciesCountryEntity> currenciesCountries = [];
  List<CurrenciesCountryEntity> filteredCurrencies = [];
  List<CurrenciesCountryEntity> tempCurrencies = [];
  TextEditingController searchController = TextEditingController();
  int currentPage = 0;
  late int pages = 1;

  CurrenciesBloc({
    required this.getCurrenciesCountryUseCase,
  }) : super(GetCurrenciesInitialState()) {
    on<CurrenciesEvent>((event, emit) async {
      // this is for get new Currencies from page 1
      if (event is GetRefreshCurrencyEvent) {
        emit(LoadingRefreshCurrenciesState());
        bool getData = await onRefresh();
        if (getData) {
          emit(SuccessRefreshCurrenciesState());
        } else {
          // if their is cash data didn't get error
          if (currenciesCountries.isNotEmpty) {
            emit(ErrorRefreshWithLocalCurrenciesState());
          } else {
            emit(HomeErrorState(message: failure.message.orEmpty()));
          }
        }
      }
      // this is for get new Currencies from next page
      if (event is GetLoadingCurrencyEvent) {
        emit(GetLoadingCurrenciesState());
        bool getData = await onLoading();
        if (getData) {
          emit(SuccessCurrenciesState());
        } else {
          emit(HomeErrorState(message: failure.message.orEmpty()));
        }
      }
      // this is for get new Currencies from next page in drop down
      if (event is GetDropDownCurrencyEvent) {
        emit(GetLoadingDropDownCurrenciesState());
        bool getData = await onLoadingDropDown(page: 1);
        if (getData) {
          emit(SuccessDropDownCurrenciesState());
        } else {
          emit(HomeErrorState(message: failure.message.orEmpty()));
        }
      }
      if (event is FilterCurrencyEvent) {
        emit(FilterCurrenciesState());
      }
    });
  }

  Future<bool> getCurrenciesCountry() async {
    bool getData = false;
    var response = await getCurrenciesCountryUseCase.call(
        params: GetPaginationParams(page: currentPage));
    response.fold((failure) => {getData = false, this.failure = failure},
        (List<CurrenciesCountryEntity> success) {
      if (success.isEmpty) {
        refreshController.loadNoData();
      }
      currenciesCountries.addAll(success);
      filteredCurrencies.addAll(currenciesCountries);
      getData = true;
    });
    return getData;
  }

  ///
  /// The [initCurrenciesList] function is responsible to check
  /// if their is currencies in Hive cash or it should to fetch it from API
  ///
  initCurrenciesList() {
    CurrenciesCountriesEntity currenciesCountriesLocal = DataBaseConfig.instance
            .dynamicData<CurrenciesCountriesEntity>(
                DataStoreKeys.currenciesCountry) ??
        CurrenciesCountriesEntity(currencies: []);
    if (currenciesCountriesLocal.currencies.isNotEmpty) {
      currenciesCountries.clear();
      filteredCurrencies.clear();
      currenciesCountries.addAll(currenciesCountriesLocal.currencies);
      filteredCurrencies.addAll(currenciesCountries);
    }

    if (currenciesCountries.isEmpty) {
      add(const GetRefreshCurrencyEvent());
    }
  }

  // Search function that filters currencies based on the name
  void filterCurrencies({String? query}) {
    if (query != null) {
      final filtered = currenciesCountries
          .where((currency) =>
              currency.name.toLowerCase().contains(query.toLowerCase()))
          .toList();

      filteredCurrencies = filtered;
    } else {
      reAddFilterListToDefault();
    }
    log('${filteredCurrencies.length}');
    add(const FilterCurrencyEvent());
  }

  // clear the filter list to re add the base list to it {clear search}
  reAddFilterListToDefault() {
    filteredCurrencies.clear();
    filteredCurrencies.addAll(currenciesCountries);
  }

  ///
  /// The [getCurrenciesCountry] function is responsible for gating
  /// CurrenciesCountry as pagination
  ///
  // Future<bool> getCurrenciesCountry() async {
  //   bool getData = false;
  //   var response = await getCurrenciesCountryUseCase.call(
  //       params: GetPaginationParams(page: currentPage));
  //   response
  //       .fold((Failure failure) => {getData = false, this.failure = failure},
  //           (BasePaginationEntity success) {
  //     if (success.data.isEmpty) {
  //       refreshController.loadNoData();
  //     }
  //     paginationEntity = success;
  //     pages = success.pages;
  //     convertFromDynamicToCurrenciesCountry(success.data);
  //     getData = true;
  //   });
  //   return getData;
  // }

  ///
  /// The [convertFromDynamicToCurrenciesCountry] function is responsible convert
  /// CurrenciesCountry from pagination entity to CurrenciesCountryEntity
  ///
  // convertFromDynamicToCurrenciesCountry(List<dynamic> data) {
  //   List<CurrenciesCountryEntity> temp = [];
  //   tempCurrencies.clear();
  //   for (var (element as CurrenciesCountryEntity) in data) {
  //     if (element.iso2Code.containsNumber()) {
  //       continue;
  //     } else {
  //       temp.add(element);
  //     }
  //   }
  //   tempCurrencies = temp;
  // }

  // get new Currencies from page 1
  Future<bool> onRefresh() async {
    currentPage = 1;
    bool getData = await getCurrenciesCountry();
    // currenciesCountries.clear();
    // currenciesCountries.addAll(tempCurrencies);
    refreshController.refreshCompleted();
    return getData;
  }

  // get new Currencies from next page
  Future<bool> onLoading() async {
    bool getData = false;

    if (currentPage < pages) {
      currentPage++;
      getData = await getCurrenciesCountry();
      currenciesCountries.addAll(tempCurrencies);
    } else {
      refreshController.loadNoData();
    }

    refreshController.loadComplete();
    return getData;
  }

  // get new Currencies from next page in drop down
  Future<bool> onLoadingDropDown({required int page}) async {
    bool getData = false;
    if (page == 1) {
      currenciesCountries.clear();
    }
    currentPage = page;

    if (currentPage < pages) {
      getData = await getCurrenciesCountry();
      currenciesCountries.addAll(tempCurrencies);
    }
    return getData;
  }
}
