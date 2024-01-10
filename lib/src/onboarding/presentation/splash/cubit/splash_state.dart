part of 'splash_cubit.dart';

final class SplashState extends Equatable {
  const SplashState({
    this.splashStatus = LoadingState.initial,
    this.onBoardingStatus = LoadingState.initial,
  });

  final LoadingState splashStatus;
  final LoadingState onBoardingStatus;

  SplashState copyWith({
    LoadingState? splashStatus,
    LoadingState? onBoardingStatus,
  }) {
    return SplashState(
      splashStatus: splashStatus ?? this.splashStatus,
      onBoardingStatus: onBoardingStatus ?? this.onBoardingStatus,
    );
  }

  @override
  List<Object?> get props => [splashStatus, onBoardingStatus];
}
