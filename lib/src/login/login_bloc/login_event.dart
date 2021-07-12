part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent {
  final String email;

  const EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends LoginEvent {
  final String password;

  const PasswordChanged({this.password});

  @override
  List<Object> get props => [password];
}

class Submitting extends LoginEvent {
  final String email, password;

  const Submitting({this.email, this.password});

  @override
  List<Object> get props => [email, password];
}

class LoginWithGooglePressed extends LoginEvent {}

class LoginWithCredentialsPressed extends LoginEvent {
  final String email, password;

  const LoginWithCredentialsPressed({this.email, this.password});

  @override
  List<Object> get props => [email, password];
}
