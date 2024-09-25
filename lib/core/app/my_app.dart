import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../features/home/presentation/bloc/home_bloc.dart';
import '../../features/splash/presentaion/blocs/splash_bloc.dart';
import '../utils/resources/theme_manager.dart';
import '../utils/routes/app_router.dart';
import 'dependency_injection.dart';

GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: MediaQuery.of(context).size,
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: "KIB Challenge",
          debugShowCheckedModeBanner: false,
          // localizationsDelegates: context.localizationDelegates,
          // supportedLocales: context.supportedLocales,
          // locale: context.locale,
          theme: getLightTheme(),
          routerConfig: instance<AppRouter>().config(),
        );
      },
    );
  }
}
