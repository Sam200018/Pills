part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
}

class DoCreateRegister extends SignupEvent {
  final String name, lastName, email, password;

  DoCreateRegister(this.name, this.lastName, this.email, this.password);
  @override
  List<Object> get props => [name, lastName, email, password];
}

class ChangeEmail extends SignupEvent {
  final String email;

  ChangeEmail(this.email);
  @override
  List<Object> get props => [email];
}

class ChangePassword extends SignupEvent {
  final String password;

  ChangePassword(this.password);

  @override
  List<Object> get props => [password];
}
