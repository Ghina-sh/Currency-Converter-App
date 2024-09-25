import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/resources/assets_manager.dart';
import '../../../../core/widgets/app_image.dart';
import '../../domain/entities/currencies_country_entity.dart';

class CurrencyCard extends StatelessWidget {
  final CurrenciesCountryEntity countryEntity;
  final double? width;

  const CurrencyCard({super.key, required this.countryEntity, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 1.sw,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                AppImage(
                  path: ImageAssets.countryImage(
                    countryEntity.countries.toLowerCase(),
                  ),
                  type: ImageType.cachedNetwork,
                ),
                10.horizontalSpace,
                Text(
                  countryEntity.code,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              countryEntity.name,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontSize: 16.sp),
            ),
          ),
        ],
      ),
    );
  }
}
