part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
}

class DoCreateRegister extends SignupEvent {
  final String name, lastName, password;

  DoCreateRegister(this.name, this.lastName, this.password);
  @override
  List<Object> get props => [name, lastName, password];
}

class ChangeName extends SignupEvent {
  final String name;

  ChangeName(this.name);

  @override
  List<Object> get props => [name];
}

class ChangeLastName extends SignupEvent {
  final String lastName;

  ChangeLastName(this.lastName);

  @override
  List<Object> get props => [lastName];
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

class ConfirmationPassword extends SignupEvent {
  final String confirmPassword;

  ConfirmationPassword(this.confirmPassword);

  @override
  List<Object> get props => [confirmPassword];
}
