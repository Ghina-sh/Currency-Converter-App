import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

import '../../../core/app/dependency_injection.dart';
import '../../../core/utils/routes/app_router.dart';
import 'blocs/splash_bloc.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashBloc splashBloc;

  @override
  void initState() {
    splashBloc = instance<SplashBloc>();
    // splashBloc = BlocProvider.of<SplashBloc>(context);
    splashBloc.add(const StartSplashTimer(timer: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        bloc: splashBloc,
        listener: (context, state) {
          if (state is SplashHomeState) {
            context.router.replaceAll([const HomeRoute()]);
          }
        },
        child: Container(),
      ),
    );
  }
}
