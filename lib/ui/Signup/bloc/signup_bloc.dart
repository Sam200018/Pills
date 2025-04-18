import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pills/config/validators.dart';
import 'package:pills/data/repository/authentication_repository.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  AuthenticationRepository _authenticationRepository;

  SignupBloc(this._authenticationRepository) : super(SignupState.empty()) {
    on<NameChanged>(_onNameChangedToState);
    on<LastNameChanged>(_onLastNameChangedToState);
    on<ChangedEmail>(_onChangedEmailToState);
    on<ChangedPassword>(_onChangedPasswordToState);
    on<SubmittingForm>(_onSubmitingFormToState);
  }

  void _onNameChangedToState(NameChanged event, Emitter<SignupState> emit) {
    emit(state.update(isNameValid: Validators.isValidNames(event.name)));
  }

  void _onLastNameChangedToState(
      LastNameChanged event, Emitter<SignupState> emit) {
    emit(
        state.update(isLastNameValid: Validators.isValidNames(event.lastName)));
  }

  void _onChangedEmailToState(ChangedEmail event, Emitter<SignupState> emit) {
    emit(
        state.update(isEmailVal: Validators.isValidEmail(event.emailRegister)));
  }

  void _onChangedPasswordToState(
      ChangedPassword event, Emitter<SignupState> emit) {
    emit(state.update(
        isPassValid: Validators.isValidPassword(event.passwordRegister)));
  }

  Future<void> _onSubmitingFormToState(
      SubmittingForm event, Emitter<SignupState> emit) async {
    try {
      await _authenticationRepository.singUpWithEmailAndPassword(
        name: event.name,
        lastName: event.lastName,
        email: event.emailRegister,
        password: event.passwordRegister,
      );
      emit(SignupState.loading());
      emit(SignupState.success());
    } catch (e) {
      print(e);
      emit(SignupState.failure());
    }
  }
}
