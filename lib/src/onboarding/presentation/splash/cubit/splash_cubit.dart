import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medhavi_app/core/enums/loading_state.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashState());

  final Duration _splashDuration = const Duration(milliseconds: 800);

  void splashCompleter() {
    emit(state.copyWith(splashStatus: LoadingState.loading));
    Future.delayed(
      _splashDuration,
      () => emit(state.copyWith(splashStatus: LoadingState.success)),
    );
  }
}
