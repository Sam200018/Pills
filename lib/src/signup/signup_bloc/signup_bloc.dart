import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pills/respository/authentication/authentication_repository.dart';
import 'package:pills/src/utils/validatos.dart';
import 'package:rxdart/rxdart.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  AuthenticationRepository _userRepository;

  SignupBloc({required AuthenticationRepository userRepository})
      : _userRepository = userRepository,
        super(SignupState.empty());

  @override
  Stream<Transition<SignupEvent, SignupState>> transformEvents(
      Stream<SignupEvent> events, transitionFn) {
    final nonDebounceStream = events.where((event) => (event is! NameChanged &&
        event is! LastNameChanged &&
        event is! ChangedEmail &&
        event is! ChangedPassword));

    final debounceStream = events
        .where((event) => (event is NameChanged ||
            event is LastNameChanged ||
            event is ChangedEmail ||
            event is ChangedPassword))
        .debounceTime(Duration(milliseconds: 300));

    return super.transformEvents(
        nonDebounceStream.mergeWith([debounceStream]), transitionFn);
  }

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is NameChanged) {
      yield* _mapNameChangedToState(event.name);
    }
    if (event is LastNameChanged) {
      yield* _mapLastNameChangedToState(event.lastName);
    }
    if (event is ChangedEmail) {
      yield* _mapChangedEmailToState(event.emailRegister);
    }
    if (event is ChangedPassword) {
      yield* _mapChangedPasswordToStae(event.passwordRegister);
    }
    if (event is SubmittingForm) {
      yield* _mapSubmitingFormToState(
        event.name,
        event.lastName,
        event.emailRegister,
        event.passwordRegister,
      );
    }
  }

  Stream<SignupState> _mapNameChangedToState(String name) async* {
    yield state.update(isNameValid: Validators.isValidNames(name));
  }

  Stream<SignupState> _mapLastNameChangedToState(String lastName) async* {
    yield state.update(isLastNameValid: Validators.isValidNames(lastName));
  }

  Stream<SignupState> _mapChangedEmailToState(String emailRegister) async* {
    yield state.update(isEmailVal: Validators.isValidadEmail(emailRegister));
  }

  Stream<SignupState> _mapChangedPasswordToStae(
      String passwordRegister) async* {
    yield state.update(
        isPassValid: Validators.isValidPassword(passwordRegister));
  }

  Stream<SignupState> _mapSubmitingFormToState(
      String name, String lastName, String email, String password) async* {
    try {
      await _userRepository.singUpWithEmailAndPassword(
        name: name,
        lastName: lastName,
        email: email,
        password: password,
      );
      yield SignupState.loading();
      yield SignupState.success();
    } catch (e) {
      print(e);
      yield SignupState.failure();
    }
  }
}
