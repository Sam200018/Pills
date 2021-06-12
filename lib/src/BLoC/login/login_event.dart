part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class DoLoginEvent extends LoginEvent {
  final String email;
  final String password;

  DoLoginEvent(this.email, this.password);

  @override
  List<Object> get props => [this.email, this.password];
}

class ChangeEmailPassword extends LoginEvent {
  final String email;

  ChangeEmailPassword(this.email);

  @override
  List<Object> get props => [this.email];
}
