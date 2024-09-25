import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app/dependency_injection.dart';
import '../../../../core/utils/resources/strings_manager.dart';
import '../../../../core/widgets/drop_down/currencies_drop_down_page.dart';
import '../../../home/presentation/bloc/home_bloc.dart';
import '../blocs/history_currency_bloc.dart';

class SelectCurrency extends StatefulWidget {
  const SelectCurrency({super.key});

  @override
  State<SelectCurrency> createState() => _SelectCurrencyState();
}

class _SelectCurrencyState extends State<SelectCurrency> {
  late HistoryCurrencyBloc historyCurrencyBloc;
  late CurrenciesBloc currenciesBloc;

  @override
  void initState() {
    currenciesBloc = instance<CurrenciesBloc>();
    historyCurrencyBloc = instance<HistoryCurrencyBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrenciesBloc, CurrenciesState>(
        bloc: currenciesBloc,
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${AppStrings.choiceToTwoCurrencies} :",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                5.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.from,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          5.verticalSpace,
                          CurrenciesDropDownPagination(
                            onTap: (String code) {
                              historyCurrencyBloc.fromCurrency = code;
                              currenciesBloc.reAddFilterListToDefault();
                            },
                          ),
                        ],
                      ),
                    ),
                    16.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.to,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          5.verticalSpace,
                          CurrenciesDropDownPagination(
                            onTap: (String code) {
                              historyCurrencyBloc.toCurrency = code;
                              currenciesBloc.reAddFilterListToDefault();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
