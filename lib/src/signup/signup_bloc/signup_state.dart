part of 'signup_bloc.dart';

class SignupState {
  final bool isNameValid,
      isLastNameValid,
      isEmailVal,
      isPassValid,
      isSubmitting,
      isSuccess,
      isFailure;

  SignupState({
    @required this.isNameValid,
    @required this.isLastNameValid,
    @required this.isEmailVal,
    @required this.isPassValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
  });

  bool get isFormValid =>
      isNameValid && isLastNameValid && isEmailVal && isPassValid;

  factory SignupState.empty() {
    return SignupState(
      isNameValid: true,
      isLastNameValid: true,
      isEmailVal: true,
      isPassValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory SignupState.loading() {
    return SignupState(
      isNameValid: true,
      isLastNameValid: true,
      isEmailVal: true,
      isPassValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory SignupState.failure() {
    return SignupState(
      isNameValid: true,
      isLastNameValid: true,
      isEmailVal: true,
      isPassValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
    );
  }
  factory SignupState.success() {
    return SignupState(
      isNameValid: true,
      isLastNameValid: true,
      isEmailVal: true,
      isPassValid: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
    );
  }

  SignupState copyWith({
    bool isNameValid,
    bool isLastNameValid,
    bool isEmailVal,
    bool isPassValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return SignupState(
      isNameValid: isNameValid ?? this.isNameValid,
      isLastNameValid: isLastNameValid ?? this.isLastNameValid,
      isEmailVal: isEmailVal ?? this.isEmailVal,
      isPassValid: isPassValid ?? this.isPassValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isFailure: isFailure ?? this.isFailure,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  SignupState update({
    bool isNameValid,
    bool isLastNameValid,
    bool isEmailVal,
    bool isPassValid,
  }) {
    return copyWith(
      isNameValid: isNameValid,
      isLastNameValid: isLastNameValid,
      isEmailVal: isEmailVal,
      isPassValid: isPassValid,
      isSubmitting: false,
      isFailure: false,
      isSuccess: false,
    );
  }

  @override
  String toString() {
    return '''loginState{
      isNameValid: $isNameValid,
      isLastNameValid: $isLastNameValid,
      isEmialValid : $isEmailVal,
      isPasswordValid: $isPassValid,
      isSubmitting: $isSubmitting,
      isFailure: $isFailure,
      isSuccess: $isSuccess
    } ''';
  }
}
