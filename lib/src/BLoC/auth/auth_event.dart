part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationUserChanged extends AuthEvent {
  final User user;

  AuthenticationUserChanged(this.user);

  @override
  List<Object> get props => [user];
}

class AuthenticationLogoutRequested extends AuthEvent {}
