import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kib_challenge/core/utils/resources/color_manager.dart';
import 'package:kib_challenge/core/utils/resources/strings_manager.dart';
import 'package:kib_challenge/core/widgets/list_loading.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../../core/app/dependency_injection.dart';
import '../../../core/utils/toaster.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_toast.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../home/presentation/bloc/home_bloc.dart';
import 'blocs/history_currency_bloc.dart';
import 'widgets/select_currency.dart';

@RoutePage()
class HistoryCurrencyPage extends StatefulWidget {
  const HistoryCurrencyPage({super.key});

  @override
  State<HistoryCurrencyPage> createState() => _HistoryCurrencyPageState();
}

class _HistoryCurrencyPageState extends State<HistoryCurrencyPage> {
  late HistoryCurrencyBloc historyCurrencyBloc;
  late CurrenciesBloc currenciesBloc;

  @override
  void initState() {
    historyCurrencyBloc = instance<HistoryCurrencyBloc>();
    currenciesBloc = instance<CurrenciesBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        currenciesBloc.reAddFilterListToDefault();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          title: AppStrings.historyCurrency,
          leading: InkWell(
            onTap: () {
              currenciesBloc.reAddFilterListToDefault();
              context.router.back();
            },
            child: Icon(Icons.arrow_back,
                color: Theme.of(context).colorScheme.primary),
          ),
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(flex: 2, child: SelectCurrency()),
                Expanded(
                  flex: 10,
                  child:
                      BlocConsumer<HistoryCurrencyBloc, HistoryCurrencyState>(
                    bloc: historyCurrencyBloc,
                    listener: (context, state) {
                      if (state is HistoryCurrencyErrorState) {
                        Toaster.showToast(
                          context,
                          message: state.message ?? '',
                          status: ToastStatus.fail,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is HistoryCurrencyLoadingState) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: const ListLoading(),
                        );
                      } else if (state is HistoryCurrencyCompleteState) {
                        return ScrollableTableView(
                          headers: [
                            "${historyCurrencyBloc.fromCurrency} ${AppStrings.to.toLowerCase()} ${historyCurrencyBloc.toCurrency}",
                            AppStrings.date,
                          ].map((label) {
                            return TableViewHeader(
                              label: label,
                              width: 1.sw / 2,
                            );
                          }).toList(),
                          rows: historyCurrencyBloc.data
                              .map((List<String> record) {
                            return TableViewRow(
                              height: 60,
                              cells: record.map((value) {
                                return TableViewCell(
                                  child: Text(
                                    value,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                );
                              }).toList(),
                            );
                          }).toList(),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ],
            ),
            buildSearchButton(),
          ],
        ),
      ),
    );
  }

  Align buildSearchButton() {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.h),
        child: BlocBuilder<HistoryCurrencyBloc, HistoryCurrencyState>(
            bloc: historyCurrencyBloc,
            builder: (context, state) {
              if (state is HistoryCurrencyLoadingState) {
                return const CircularProgressIndicator();
              }
              return AppButton(
                text: AppStrings.search,
                color: ColorManager.primary,
                customWidth: 0.5.sw,
                action: () {
                  historyCurrencyBloc.onTapSearch();
                },
              );
            }),
      ),
    );
  }
}
