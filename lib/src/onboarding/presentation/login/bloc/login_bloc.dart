import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medhavi_app/core/core.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<OnEmailChangedEvent>(_onEmailChanged);
    on<OnPasswordChangedEvent>(_onPasswordChanged);
    on<OnShowPasswordEvent>(_onShowPassword);
    on<LoginWithCredentialsEvent>(_signInWithCredentials);
    on<OnGoogleSignInEvent>(_signInWithGoogle);
  }

  void _onEmailChanged(OnEmailChangedEvent event, Emitter<LoginState> emit) {
    emit(
      state.copyWith(
        email: event.email,
        status: LoadingState.initial,
        thirdPartyStatus: LoadingState.initial,
      ),
    );
  }

  void _onPasswordChanged(
      OnPasswordChangedEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      password: event.password,
      status: LoadingState.initial,
      thirdPartyStatus: LoadingState.initial,
    ));
  }

  void _onShowPassword(OnShowPasswordEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(
      showPassword: event.showPass,
      status: LoadingState.initial,
      thirdPartyStatus: LoadingState.initial,
    ));
  }

  FutureOr<void> _signInWithCredentials(
      LoginWithCredentialsEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoadingState.loading));
    // final response = await _repository.loginUser(
    //   email: state.email,
    //   password: state.password,
    // );

    // response.fold(
    //   (l) => emit(
    //     state.copyWith(
    //       status: LoadingState.failure,
    //       errorText: l,
    //     ),
    //   ),
    //   (r) {
    //     emit(
    //       state.copyWith(
    //         status: LoadingState.success,
    //         refreshToken: r['refresh_token'] ?? '',
    //         accessToken: r['access_token'] ?? '',
    //       ),
    //     );
    //   },
    // );
  }

  FutureOr<void> _signInWithGoogle(
      OnGoogleSignInEvent event, Emitter<LoginState> emit) async {
    // final idToken = await getIt<ThirdPartySignIn>().getGoogleIdToken();

    // emit(state.copyWith(thirdPartyStatus: LoadingState.loading));

    // final result = await _repository.signInWithGoogle(token: idToken ?? '');

    // result.fold(
    //   (l) => emit(
    //     state.copyWith(
    //       thirdPartyStatus: LoadingState.failure,
    //       errorText: l,
    //     ),
    //   ),
    //   (r) {
    //     emit(
    //       state.copyWith(
    //         thirdPartyStatus: LoadingState.success,
    //         refreshToken: r['refresh_token'] ?? '',
    //         accessToken: r['access_token'] ?? '',
    //       ),
    //     );
    //   },
    // );
  }
}
