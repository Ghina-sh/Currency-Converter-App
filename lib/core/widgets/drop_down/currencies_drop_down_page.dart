import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:high_q_paginated_drop_down/high_q_paginated_drop_down.dart';
import 'package:kib_challenge/core/app/dependency_injection.dart';
import 'package:kib_challenge/core/utils/resources/color_manager.dart';
import 'package:kib_challenge/features/home/presentation/bloc/home_bloc.dart';

import '../../../features/home/domain/entities/currencies_country_entity.dart';
import '../../../features/home/presentation/widgets/currency_card.dart';

class CurrenciesDropDownPagination extends StatefulWidget {
  const CurrenciesDropDownPagination({super.key, required this.onTap});

  final Function onTap;

  @override
  State<CurrenciesDropDownPagination> createState() =>
      _CurrenciesDropDownPaginationState();
}

class _CurrenciesDropDownPaginationState
    extends State<CurrenciesDropDownPagination> {
  late CurrenciesBloc currenciesBloc;
  PaginatedSearchDropdownController<CurrenciesCountryEntity> controller =
      PaginatedSearchDropdownController();
  bool isDropdownOpen = false;

  @override
  void initState() {
    currenciesBloc = instance<CurrenciesBloc>();
    // currenciesBloc.add(const GetDropDownCurrencyEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrenciesBloc, CurrenciesState>(
        bloc: currenciesBloc,
        builder: (context, state) {
          return HighQPaginatedDropdown<CurrenciesCountryEntity>.paginated(
            // showTextField: false,
            controller: controller,
            textStyle: Theme.of(context).textTheme.titleSmall,
            paginatedRequest: (int? page, String? search) async {
              // await currenciesBloc.onLoadingDropDown(page: page ?? 1);
              currenciesBloc.filterCurrencies(query: search);
              return currenciesBloc.filteredCurrencies.map((countryEntity) {
                return MenuItemModel<CurrenciesCountryEntity>(
                    label: countryEntity.name,
                    child: CurrencyCard(
                      countryEntity: countryEntity,
                    ),
                    value: countryEntity,
                    onTap: () {
                      widget.onTap(countryEntity.code);
                    });
              }).toList();
            },
            backgroundDecoration: (Widget child) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.black),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: child,
              );
            },
            key: UniqueKey(),
            trailingClearIcon: Icon(
              Icons.clear,
              size: 20.sp,
            ),
          );
        });
  }
}
