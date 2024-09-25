import 'package:auto_route/auto_route.dart';
import 'package:kib_challenge/features/home/presentation/home_page.dart';

import '../../../features/history_currency/presentaion/history_currency_page.dart';
import '../../../features/splash/presentaion/splash_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: HistoryCurrencyRoute.page),
        // Use SplashRoute.page
      ];
}
