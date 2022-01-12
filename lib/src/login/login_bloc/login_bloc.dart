import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pills/src/utils/validatos.dart';
import 'package:equatable/equatable.dart';
import 'package:pills/respository/authentication/authentication_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository _userRepository;

  LoginBloc(this._userRepository) : super(LoginState.empty()) {
    on<EmailChanged>(_onEmailChangedToState);
    on<PasswordChanged>(_onPasswordChangedToState);
    on<LoginWithGooglePressed>(_onLoginWithGooglePressedToState);
    on<LoginWithCredentialsPressed>(_onLoginWithCredecialsToState);
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
      await _userRepository.loginWithGoogle();
      emit(LoginState.success());
    } catch (e) {
      emit(LoginState.failureCredential());
    }
  }

  Future<void> _onLoginWithCredecialsToState(
      LoginWithCredentialsPressed event, Emitter<LoginState> emit) async {
    emit(LoginState.loading());
    try {
      await _userRepository.loginWithEmailAndPassword(
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
