import 'package:flutter/material.dart';

import 'app_button.dart';

class AppError extends StatelessWidget {
  final String msg;
  final Function() retry;
  final Color color;

  const AppError({
    super.key,
    required this.msg,
    required this.retry,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Assets.lotties.error.lottie(
            //   height: 35,
            //   width: 35,
            // ),
            const SizedBox(
              width: 10,
            ),
            Text(
              msg,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        AppButton(
          text: "retry",
          color: color,
          textColor: Colors.white,
          action: retry,
          customWidth: 120,
        )
      ],
    );
  }
}
