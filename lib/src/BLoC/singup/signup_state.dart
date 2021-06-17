part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState();
}

class SignupInitial extends SignupState {
  @override
  List<Object> get props => [];
}

class SigningUpBLocState extends SignupState {
  @override
  List<Object> get props => [];
}

class SignedUpBlocState extends SignupState {
  final String idToken;

  SignedUpBlocState(this.idToken);
  @override
  List<Object> get props => [idToken];
}

class ErrorBlocState extends SignupState {
  final String m;

  ErrorBlocState(this.m);
  @override
  List<Object> get props => [m];
}

class NameError extends SignupState {
  @override
  List<Object> get props => [];
}

class EmailError extends SignupState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class PasswordError extends SignupState {
  @override
  List<Object> get props => [];
}
