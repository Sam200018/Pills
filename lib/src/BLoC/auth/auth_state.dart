part of 'auth_bloc.dart';

enum AuthenticationStatus { authenticated, unauthenticated, unknown }

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    @required this.status,
    this.user = User.empty,
  });

  const AuthenticationState.unknown()
      : this._(status: AuthenticationStatus.unauthenticated);

  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unathenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
