import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
//import 'package:pills/src/BLoC/validator.dart';
import 'package:equatable/equatable.dart';
import 'package:pills/src/BLoC/login/LoginLogic.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginLogic logic;

  LoginBloc({@required this.logic}) : super(InitialLoginBlocState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is ChangeEmailPassword) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = RegExp(pattern);
      if (regExp.hasMatch(event.email)) {
        yield InitialLoginBlocState();
      } else
        yield EmailError();
    }
    if (event is DoLoginEvent) {
      yield LogginInBlocState();
      try {
        var token = await logic.login(event.email, event.password);
        yield LoggedInBlocState(token);
      } on LoginExecption {
        yield ErrorBlocState("No se puedo loggear");
      }
    }
  }
}
