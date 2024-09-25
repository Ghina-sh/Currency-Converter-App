import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kib_challenge/core/utils/resources/color_manager.dart';
import 'package:kib_challenge/core/utils/resources/strings_manager.dart';
import 'package:kib_challenge/core/widgets/app_button.dart';

import '../../../core/app/dependency_injection.dart';
import '../../../core/utils/toaster.dart';
import '../../../core/widgets/app_toast.dart';
import 'blocs/currency_converter_bloc.dart';
import 'widgets/dialog_content.dart';

class CurrencyConverterDialog extends StatefulWidget {
  const CurrencyConverterDialog({super.key});

  @override
  State<CurrencyConverterDialog> createState() =>
      _CurrencyConverterDialogState();
}

class _CurrencyConverterDialogState extends State<CurrencyConverterDialog> {
  late ConverterBloc converterBloc;

  @override
  void initState() {
    converterBloc = instance<ConverterBloc>();
    converterBloc.add(InitDialogEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      title: Text(
        AppStrings.currencyConverter,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20.sp),
      ),
      content: DialogContent(),
      actions: [
        Center(
          child: BlocConsumer<ConverterBloc, ConverterState>(
              bloc: converterBloc,
              listener: (context, state) {
                if (state is ConverterErrorState) {
                  Toaster.showToast(
                    context,
                    message: state.message ?? '',
                    status: ToastStatus.fail,
                  );
                }
              },
              builder: (context, state) {
                if (state is ConverterLoadingState) {
                  return const CircularProgressIndicator();
                }
                return AppButton(
                  text: AppStrings.convert,
                  color: ColorManager.primary,
                  customWidth: 0.5.sw,
                  action: () {
                    converterBloc.getConvertResult();
                  },
                );
              }),
        ),
      ],
    );
  }
}
