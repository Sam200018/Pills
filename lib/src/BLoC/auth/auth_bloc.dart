import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:pills/respository/repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  StreamSubscription<User>? _userSubscription;

  AuthBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.unknown()) {
    _userSubscription = _authenticationRepository.user
        .listen((user) => add(AuthenticationUserChanged(user)));
    on<AuthenticationUserChanged>(_onAuthenticationUserChangedToState);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogOut);
  }

  // @override
  // Stream<AuthenticationState> mapEventToState(
  //   AuthEvent event,
  // ) async* {
  //   if (event is AuthenticationUserChanged) {
  //     yield _mapAuthenticationUserChangedToState(event);
  //   } else if (event is AuthenticationLogoutRequested) {
  //     unawaited(_authenticationRepository.logOut());
  //   }
  // // }

  // AuthenticationState _mapAuthenticationUserChangedToState(
  //     AuthenticationUserChanged event) {
  //   return event.user != User.empty
  //       ? AuthenticationState.authenticated(event.user)
  //       : const AuthenticationState.unathenticated();
  // }

  void _onAuthenticationUserChangedToState(
      AuthenticationUserChanged event, Emitter<AuthenticationState> emit) {
    event.user != User.empty
        ? emit(AuthenticationState.authenticated(event.user))
        : emit(AuthenticationState.unathenticated());
  }

  void _onAuthenticationLogOut(
      AuthenticationLogoutRequested event, Emitter<AuthenticationState> emit) {
    unawaited(_authenticationRepository.logOut());
    emit(AuthenticationState.unathenticated());
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
