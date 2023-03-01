import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:pills/data/repository.dart';

import '../../../routes/routes.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;
  StreamSubscription<User>? _userSubscription;

  AuthBloc(this._authenticationRepository)
      : super(const AuthenticationState.unknown()) {
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

  Future<void> _onAuthenticationLogOut(AuthenticationLogoutRequested event,
      Emitter<AuthenticationState> emit) async {
    try {
      await _authenticationRepository.logOut();
      emit(AuthenticationState.unathenticated());
      event.context.go(AppRouter.login);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
