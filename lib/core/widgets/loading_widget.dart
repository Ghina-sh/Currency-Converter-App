import 'package:flutter/material.dart';

import '../utils/resources/color_manager.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: ColorManager.primary,
    );
  }
}
