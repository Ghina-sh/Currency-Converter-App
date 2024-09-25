import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_manager.dart';

import 'design_constants.dart';
import 'style_manager.dart';

MaterialColor primarySwatch = const MaterialColor(0xFFCBAB70, {
  50: Color(0xFFCBAB70),
  100: Color(0xFFCBAB70),
  200: Color(0xFFCBAB70),
  300: Color(0xFFCBAB70),
  400: Color(0xFFCBAB70),
  500: Color(0xFFCBAB70),
  600: Color(0xFFCBAB70),
  700: Color(0xFFCBAB70),
  800: Color(0xFFCBAB70),
  900: Color(0xFFCBAB70)
});

ThemeData getLightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: ColorManager.primary,
    // secondaryHeaderColor: ColorManager.darkBlue,
    // primaryColorLight: ColorManager.navyBlue,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme(
      primary: ColorManager.black,
      onPrimary: ColorManager.primary,
      secondary: ColorManager.lightGrey,
      onSecondary: ColorManager.lightIvory,
      surface: ColorManager.backgroundColor,
      onSurface: ColorManager.backgroundColor,
      error: ColorManager.redError,
      onError: ColorManager.redError,
      brightness: Brightness.light,
      shadow: ColorManager.grey.withOpacity(0.36),
    ),
    textTheme: TextTheme(
      ///[display]
      displayLarge: getBoldStyle(color: ColorManager.white, fontSize: 28.sp),
      displayMedium: getMediumStyle(color: Colors.white, fontSize: 12.sp),
      displaySmall: getRegularStyle(color: ColorManager.white, fontSize: 12.sp),

      ///[headline]
      headlineLarge: getBoldStyle(color: ColorManager.grey, fontSize: 12.sp),
      headlineMedium: getMediumStyle(color: ColorManager.grey, fontSize: 24.sp),
      headlineSmall: getRegularStyle(color: ColorManager.grey, fontSize: 16.sp),

      ///[title]
      titleLarge: getBoldStyle(color: ColorManager.black, fontSize: 30.sp),
      titleMedium: getSemiBoldStyle(color: ColorManager.black, fontSize: 16.sp),
      titleSmall: getRegularStyle(color: ColorManager.black, fontSize: 14.sp),

      ///[body]
      bodyLarge: getBoldStyle(color: ColorManager.primary, fontSize: 32.sp),
      bodyMedium: getMediumStyle(color: ColorManager.primary, fontSize: 17.sp),
      bodySmall: getRegularStyle(color: ColorManager.primary, fontSize: 15.sp),

      ///[label]
      labelLarge:
          getMediumStyle(color: ColorManager.lightBlack, fontSize: 20.sp),
      labelMedium:
          getSemiBoldStyle(color: ColorManager.darkWhite, fontSize: 15.sp),
      labelSmall: getLightStyle(color: ColorManager.grey, fontSize: 13.sp),
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: ColorManager.white,
        elevation: 0,
        titleTextStyle:
            getSemiBoldStyle(color: ColorManager.black, fontSize: 18.sp),
        iconTheme: IconThemeData(
          color: ColorManager.black,
          size: 27.sp,
        )),
    hintColor: ColorManager.grey,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: ColorManager.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      elevation: 6,
      minimumSize: Size(0.4.sw, 40.h),
      maximumSize: Size(0.9.sw, 65.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      textStyle: getMediumStyle(color: Colors.white, fontSize: 12.sp),
    )),
    dividerTheme: DividerThemeData(
        color: ColorManager.lightBlack.withOpacity(0.64),
        thickness: 0.5,
        space: 1),
    listTileTheme: ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
    ),
    cardTheme: CardTheme(
        elevation: 8,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          //set border radius more than 50% of height and width to make circle
        )),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
      hintStyle: getLightStyle(color: ColorManager.grey, fontSize: 13.sp),
      border: kOutlinedBorderPrimary,
      focusedBorder: kOutlinedBorderPrimary,
      enabledBorder: kOutlinedBorderBlack,
      errorBorder: kOutlinedBorderRed,
      // contentPadding: kSmallSymWidth,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorManager.primary,
      elevation: 1,
      iconSize: 30.sp,
      shape: const CircleBorder(),
    ),
  );
}

ThemeData getDarkTheme() {
  return ThemeData(
      brightness: Brightness.light,
      primaryColor: ColorManager.primary,
      // secondaryHeaderColor: ColorManager.darkBlue,
      // primaryColorLight: ColorManager.navyBlue,
      // scaffoldBackgroundColor: Colors.white,
      // backgroundColor: ColorManager.backgroundColor,
      // shadowColor: ColorManager.lightGrey.withOpacity(0.36),
      // highlightColor: ColorManager.lightGrey,
      // errorColor: ColorManager.redError,

      // textTheme: TextTheme(
      //   displayLarge:
      //   getBoldStyle(color: ColorManager.navyBlue, fontSize: 28.sp),
      //   // displayMedium:
      //   //     getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: 12.sp),
      //   displaySmall: getRegularItalicStyle(
      //       color: ColorManager.navyBlue, fontSize: 12.sp),
      //
      //   headlineLarge:
      //   getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: 12.sp),
      //   headlineMedium:
      //   getMediumStyle(color: ColorManager.darkGrey, fontSize: 15.sp),
      //   headlineSmall: getRegularItalicStyle(
      //       color: ColorManager.darkGrey, fontSize: 14.sp),
      //
      //   titleLarge: getBoldStyle(color: Colors.white, fontSize: 30.sp),
      //   titleMedium:
      //   getBoldStyle(color: ColorManager.darkGrey, fontSize: 16.sp),
      //   titleSmall:
      //   getRegularStyle(color: ColorManager.darkBlack, fontSize: 14.sp),
      //   //
      //   bodyLarge: getBoldStyle(
      //       color: ColorManager.littleDarkBlueBlack, fontSize: 32.sp),
      //   bodyMedium: getSemiBoldStyle(color: ColorManager.grey, fontSize: 17.sp),
      //   bodySmall:
      //   getRegularStyle(color: ColorManager.grey, fontSize: 14.sp),
      //
      //   labelLarge: getSemiBoldStyle(
      //       color: ColorManager.darkBlack, fontSize: 32.sp),
      //   labelSmall: getRegularStyle(
      //     color: ColorManager.darkGrey.withOpacity(0.62),
      //     fontSize: 13.sp,
      //   ),
      // ),
      // hintColor: ColorManager.darkGrey.withOpacity(0.32),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: ColorManager.primary,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(36.r)),
        elevation: 6,
        minimumSize: Size(24.w, 62.h),
        maximumSize: Size(400.w, 80.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        // textStyle:
        // getRegularStyle(color: ColorManager.darkGrey, fontSize: 14.sp),
      )),
      dividerTheme: DividerThemeData(
          color: ColorManager.lightBlack.withOpacity(0.64),
          thickness: 0.5,
          space: 1),
      listTileTheme: ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
      ),
      cardTheme: CardTheme(
          elevation: 8,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            //set border radius more than 50% of height and width to make circle
          )),
      inputDecorationTheme: InputDecorationTheme(
        border: kUnderlinedBorderGrey,
        focusedBorder: kUnderlinedBorderPrimary,
        enabledBorder: kUnderlinedBorderGrey,
        errorBorder: kUnderlinedBorderError,
        // contentPadding: kSmallSymWidth,
      ));
}

getBoxShadow() {
  return [
    BoxShadow(blurRadius: 16, color: ColorManager.black.withOpacity(0.12))
  ];
}

getButtonShadow() {
  return [
    BoxShadow(
        color: ColorManager.lightBlack.withOpacity(0.5),
        offset: const Offset(0, 5),
        blurRadius: 30,
        spreadRadius: -10)
  ];
}
