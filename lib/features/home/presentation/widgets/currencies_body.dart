import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kib_challenge/core/utils/resources/local_messages_strings_manager.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../../core/app/dependency_injection.dart';
import '../../../../core/utils/toaster.dart';
import '../../../../core/widgets/app_toast.dart';
import '../../../../core/widgets/list_loading.dart';
import '../bloc/home_bloc.dart';
import 'currency_card.dart';

class CurrenciesBody extends StatelessWidget {
  CurrenciesBody({super.key});

  final CurrenciesBloc currenciesBloc = instance<CurrenciesBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrenciesBloc, CurrenciesState>(
        bloc: currenciesBloc,
        listener: (context, state) {
          if (state is HomeErrorState) {
            Toaster.showToast(
              context,
              message: state.message,
              status: ToastStatus.fail,
            );
          }
          if (state is ErrorRefreshWithLocalCurrenciesState) {
            Toaster.showToast(
              context,
              message: AppLocalMessagesStringsManager().didNotRefresh,
              status: ToastStatus.warning,
            );
          }
        },
        builder: (context, state) {
          if (state is GetCurrenciesInitialState) {
            currenciesBloc.initCurrenciesList();
          }
          if (state is LoadingRefreshCurrenciesState) {
            return const ListLoading();
          } else if (state is HomeErrorState) {
            return buildErrorWidget(state.message);
          } else {
            return SmartRefresher(
              controller: currenciesBloc.refreshController,
              enablePullDown: true,
              enablePullUp: true,
              onRefresh: () async =>
                  currenciesBloc.add(const GetRefreshCurrencyEvent()),
              // onLoading: () async =>
              //     currenciesBloc.add(const GetLoadingCurrencyEvent()),
              footer: CustomFooter(
                builder: (BuildContext context, LoadStatus? mode) =>
                    buildFooterBody(mode),
              ),
              child: ListView.separated(
                padding: EdgeInsetsDirectional.fromSTEB(5.w, 15.h, 5.w, 0.h),
                itemCount: currenciesBloc.filteredCurrencies.length,
                itemBuilder: (context, index) {
                  return CurrencyCard(
                    countryEntity: currenciesBloc.filteredCurrencies[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Divider(
                      height: 0.5.h,
                      indent: 20.w,
                      endIndent: 20.h,
                    ),
                  );
                },
              ),
            );
          }
        });
  }

  Container buildErrorWidget(String message) {
    return Container(
      height: 0.8.sh,
      width: 1.sw,
      alignment: Alignment.center,
      child: Icon(
        Icons.error_outline,
        size: 40.sp,
      ),
    );
  }

  Widget buildFooterBody(LoadStatus? mode) {
    Widget body;
    // if (mode == LoadStatus.loading) {
    //   body = const CupertinoActivityIndicator();
    // } else
    if (mode == LoadStatus.failed) {
      body = const Text("Load Failed!Click retry!");
    } else if (mode == LoadStatus.canLoading) {
      body = const Text("release to load more");
    } else {
      body = const Text("No More Data");
    }
    return SizedBox(
      height: 55.0,
      child: Center(child: body),
    );
  }
}
