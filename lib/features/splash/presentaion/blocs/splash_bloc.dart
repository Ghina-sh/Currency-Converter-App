import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<StartSplashTimer>((event, emit) async {
      emit(SplashLoadingState()); // Emit loading state
      await Future.delayed(Duration(seconds: event.timer)); // Wait for the specified duration
      emit(SplashHomeState()); // Emit home state after the delay
    });
  }
}
