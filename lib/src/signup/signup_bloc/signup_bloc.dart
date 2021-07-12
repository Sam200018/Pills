import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'package:pills/src/signup/signup_bloc/SignUpLogic.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SimpleSignUpLogic logic;

  SignupBloc({
    @required this.logic,
  }) : super(SignupInitial());

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is ChangeEmail) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = RegExp(pattern);
      if (regExp.hasMatch(event.email)) {
        yield SignupInitial();
      } else {
        yield EmailError();
      }
    } else if (event is DoCreateRegister) {
      yield SigningUpBLocState();
      try {
        var idToken = await logic.signUp(
            event.name, event.lastName, event.email, event.password);
        yield SignedUpBlocState(idToken);
      } on SignUpException {
        yield ErrorBlocState("Error: el usuario ya existe");
      }
    } else if (event is ChangePassword) {
      Pattern pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
      RegExp regExp = RegExp(pattern);
      if (regExp.hasMatch(event.password)) {
        yield SignupInitial();
      } else {
        yield PasswordError();
      }
    }
  }
}
