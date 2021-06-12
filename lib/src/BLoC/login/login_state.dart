part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class InitialLoginBlocState extends LoginState {
  @override
  List<Object> get props => [];
}

class LogginInBlocState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoggedInBlocState extends LoginState {
  final String token;

  LoggedInBlocState(this.token);
  @override
  List<Object> get props => [token];
}

class ErrorBlocState extends LoginState {
  final String message;

  ErrorBlocState(this.message);

  @override
  List<Object> get props => [message];
}

class EmailError extends LoginState {
  EmailError();
  @override
  List<Object> get props => [];
}
