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
