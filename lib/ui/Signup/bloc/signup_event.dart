part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
  @override
  List<Object> get props => [];
}

class NameChanged extends SignupEvent {
  final String name;

  NameChanged({required this.name});

  @override
  List<Object> get props => [name];
}

class LastNameChanged extends SignupEvent {
  final String lastName;

  LastNameChanged({required this.lastName});

  @override
  List<Object> get props => [lastName];
}

class ChangedEmail extends SignupEvent {
  final String emailRegister;

  ChangedEmail({required this.emailRegister});

  @override
  List<Object> get props => [emailRegister];
}

class ChangedPassword extends SignupEvent {
  final String passwordRegister;

  ChangedPassword({required this.passwordRegister});

  @override
  List<Object> get props => [passwordRegister];
}

class SubmittingForm extends SignupEvent {
  final String name, lastName, emailRegister, passwordRegister;

  SubmittingForm(
      {required this.name,
      required this.lastName,
      required this.emailRegister,
      required this.passwordRegister});
  @override
  List<Object> get props => [name, lastName, emailRegister, passwordRegister];
}
