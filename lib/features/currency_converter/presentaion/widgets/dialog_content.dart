import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kib_challenge/core/app/dependency_injection.dart';
import 'package:kib_challenge/features/currency_converter/presentaion/blocs/currency_converter_bloc.dart';

import '../../../../core/utils/resources/strings_manager.dart';
import '../../../../core/widgets/drop_down/currencies_drop_down_page.dart';
import '../../../home/presentation/bloc/home_bloc.dart';

class DialogContent extends StatelessWidget {
  final ConverterBloc converterBloc = instance<ConverterBloc>();
  final CurrenciesBloc currenciesBloc = instance<CurrenciesBloc>();

  DialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.4.sh,
      width: 1.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          selectCurrency(
            context,
            controller: converterBloc.fromController,
            title: AppStrings.from,
            prefixIcon: SizedBox(
              width: 0.3.sw,
              child: CurrenciesDropDownPagination(
                onTap: (String code) {
                  converterBloc.fromCurrency = code;
                  currenciesBloc.reAddFilterListToDefault();
                },
              ),
            ),
          ),
          Container(
            height: 0.1.sh,
            alignment: Alignment.center,
            child: Icon(
              Icons.swap_vert,
              size: 30.sp,
            ),
          ),
          selectCurrency(
            context,
            controller: converterBloc.toController,
            title: AppStrings.to,
            readOnly: true,
            prefixIcon: SizedBox(
              width: 0.3.sw,
              child: CurrenciesDropDownPagination(
                onTap: (String code) {
                  converterBloc.toCurrency = code;
                  currenciesBloc.reAddFilterListToDefault();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column selectCurrency(context,
      {required TextEditingController controller,
      required String title,
      bool readOnly = false,
      required Widget prefixIcon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        12.verticalSpace,
        TextFormField(
          controller: controller,
          readOnly: readOnly,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
          ),
        ),
      ],
    );
  }
}
