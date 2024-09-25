import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kib_challenge/core/utils/resources/color_manager.dart';

import '../../../core/app/dependency_injection.dart';
import '../../../core/utils/resources/strings_manager.dart';
import '../../../core/utils/routes/app_router.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../currency_converter/presentaion/currency_converter_dialog.dart';
import 'bloc/home_bloc.dart';
import 'widgets/currencies_body.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CurrenciesBloc currenciesBloc;

  @override
  void initState() {
    currenciesBloc = instance<CurrenciesBloc>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: AppStrings.appTitle,
        actions: [
          IconButton(
              onPressed: () {
                context.router.push(const HistoryCurrencyRoute());
              },
              icon: const Icon(Icons.history)),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          currenciesBloc.add(const GetRefreshCurrencyEvent());
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: currenciesBloc.searchController,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 19.sp),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: ColorManager.grey,
                    ),
                  ),
                  onFieldSubmitted: (String? value) {
                    currenciesBloc.filterCurrencies(query: value);
                  },
                ),
              ),
              Expanded(flex: 10, child: CurrenciesBody()),
            ],
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.calculate_outlined,
          color: ColorManager.white,
        ),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) {
              return const CurrencyConverterDialog();
            },
          );

          // This will be executed when the dialog is closed
          currenciesBloc.filterCurrencies();
        },
      ),
    );
  }
}
