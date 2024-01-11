part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

final class OnEmailChangedEvent extends LoginEvent {
  const OnEmailChangedEvent(this.email);

  final String email;

  @override
  List<Object?> get props => [email];
}

final class OnPasswordChangedEvent extends LoginEvent {
  const OnPasswordChangedEvent(this.password);

  final String password;

  @override
  List<Object?> get props => [password];
}

final class OnShowPasswordEvent extends LoginEvent {
  const OnShowPasswordEvent(this.showPass);

  final bool showPass;

  @override
  List<Object?> get props => [showPass];
}

final class LoginWithCredentialsEvent extends LoginEvent {
  const LoginWithCredentialsEvent();

  @override
  List<Object?> get props => [];
}

final class OnGoogleSignInEvent extends LoginEvent {
  const OnGoogleSignInEvent();

  @override
  List<Object?> get props => [];
}
