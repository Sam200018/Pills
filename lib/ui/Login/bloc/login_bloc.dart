import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pills/data/authentication/authentication_repository.dart';
import 'package:pills/config/validators.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository _authenticationRepository;

  LoginBloc(this._authenticationRepository) : super(LoginState.empty()) {
    on<EmailChanged>(_onEmailChangedToState);
    on<PasswordChanged>(_onPasswordChangedToState);
    on<LoginWithGooglePressed>(_onLoginWithGooglePressedToState);
    on<LoginWithCredentialsPressed>(_onLoginWithCredentialsToState);
  }

  void _onEmailChangedToState(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.update(isEmailValid: Validators.isValidEmail(event.email)));
  }

  void _onPasswordChangedToState(
      PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.update(
        isPasswordValid: Validators.isValidPassword(event.password)));
  }

  Future<void> _onLoginWithGooglePressedToState(
      LoginWithGooglePressed event, Emitter<LoginState> emit) async {
    try {
      await _authenticationRepository.loginWithGoogle();
      // event.go(AppRouter.home);
      emit(LoginState.success());
    } catch (e) {
      emit(LoginState.failureCredential());
    }
  }

  Future<void> _onLoginWithCredentialsToState(
      LoginWithCredentialsPressed event, Emitter<LoginState> emit) async {
    emit(LoginState.loading());
    try {
      await _authenticationRepository.loginWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(LoginState.success());
    } on Exception catch (e) {
      if (e.toString().contains('The user may have been deleted'))
        emit(LoginState.failureUser());
      if (e.toString().contains(
          'The password is invalid or the user does not have a password.'))
        emit(LoginState.failureCredential());
    }
  }
}
