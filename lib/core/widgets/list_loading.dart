import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/shimmer_widget.dart';

class ListLoading extends StatelessWidget {
  const ListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 9,
      itemBuilder: (context, index) =>
          ShimmerWidget.rectangular(height: 50.h, borderRadius: 12.r),
      separatorBuilder: (context, index) => 20.verticalSpace,
    );
  }
}
