part of 'login_bloc.dart';

final class LoginState extends Equatable {
  const LoginState({
    this.email = kDebugMode ? 'admin@earthier.net' : '',
    this.password = kDebugMode ? 'Bleach-Droplet-Maybe-Limes8-Lubricant' : '',
    this.errorText = '',
    this.status = LoadingState.initial,
    this.accessToken = '',
    this.refreshToken = '',
    this.showPassword = false,
    this.thirdPartyStatus = LoadingState.initial,
  });

  final String email;
  final String password;
  final LoadingState status;
  final String errorText;
  final String accessToken;
  final String refreshToken;
  final bool showPassword;

  final LoadingState thirdPartyStatus;

  LoginState copyWith({
    String? email,
    String? password,
    String? errorText,
    LoadingState? status,
    String? accessToken,
    String? refreshToken,
    bool? showPassword,
    LoadingState? thirdPartyStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorText: errorText ?? this.errorText,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      showPassword: showPassword ?? this.showPassword,
      thirdPartyStatus: thirdPartyStatus ?? this.thirdPartyStatus,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        status,
        errorText,
        accessToken,
        refreshToken,
        showPassword,
        thirdPartyStatus,
      ];
}
