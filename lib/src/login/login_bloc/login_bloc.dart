import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pills/src/utils/validatos.dart';
import 'package:rxdart/rxdart.dart';
import 'package:equatable/equatable.dart';
import 'package:pills/respository/authentication/authentication_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository _userRepository;

  LoginBloc(this._userRepository) : super(LoginState.empty());

  @override
  Stream<Transition<LoginEvent, LoginState>> transformEvents(
      Stream<LoginEvent> events, transitionFn) {
    final nonDebounceStream = events.where(
        (event) => (event is! EmailChanged && event is! PasswordChanged));

    final debounceStream = events
        .where((event) => (event is EmailChanged || event is PasswordChanged))
        .debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(
        nonDebounceStream.mergeWith([debounceStream]), transitionFn);
  }

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    }
    if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    }
    if (event is LoginWithGooglePressed) {
      yield* _mapLoginWithGooglePressedToState();
    }
    if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredecialsToState(event.email, event.password);
    }
  }

  Stream<LoginState> _mapEmailChangedToState(String email) async* {
    yield state.update(isEmailValid: Validators.isValidadEmail(email));
  }

  Stream<LoginState> _mapPasswordChangedToState(String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }

  Stream<LoginState> _mapLoginWithGooglePressedToState() async* {
    try {
      await _userRepository.loginWithGoogle();
      yield LoginState.success();
    } catch (e) {
      yield LoginState.failureCredential();
    }
  }

  Stream<LoginState> _mapLoginWithCredecialsToState(
      String email, String password) async* {
    yield LoginState.loading();
    try {
      await _userRepository.loginWithEmailAndPassword(
          email: email, password: password);
      yield LoginState.success();
    } on Exception catch (e) {
      if (e.toString().contains('The user may have been deleted'))
        yield LoginState.failureUser();
      if (e.toString().contains(
          'The password is invalid or the user does not have a password.'))
        yield LoginState.failureCredential();
    }
  }
}
