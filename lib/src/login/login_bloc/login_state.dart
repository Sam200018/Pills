part of 'login_bloc.dart';

class LoginState {
  final bool isEmailValid, isPasswordValid, isSubmitting, isSuccess, isFailure;

  LoginState({
    @required this.isEmailValid,
    @required this.isPasswordValid,
    @required this.isSubmitting,
    @required this.isFailure,
    @required this.isSuccess,
  });

  bool get isFormValid => isEmailValid && isPasswordValid;

  factory LoginState.empty() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isFailure: false,
      isSuccess: false,
    );
  }

  factory LoginState.loading() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: true,
      isFailure: false,
      isSuccess: false,
    );
  }

  factory LoginState.failure() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isFailure: true,
      isSuccess: false,
    );
  }

  factory LoginState.success() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isFailure: false,
      isSuccess: true,
    );
  }

  LoginState copyWith(
      {bool isEmailValid,
      bool isPasswordValid,
      bool isSubmitting,
      bool isFailure,
      bool isSuccess}) {
    return LoginState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isFailure: isFailure ?? this.isFailure,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  LoginState update({
    bool isEmailValid,
    bool isPasswordValid,
  }) {
    return copyWith(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: false,
      isFailure: false,
      isSuccess: false,
    );
  }

  @override
  String toString() {
    return '''loginState{
      isEmialValid : $isEmailValid,
      isPasswordValid: $isPasswordValid,
      isSubmitting: $isSubmitting,
      isFailure: $isFailure,
      isSuccess: $isSuccess
    } ''';
  }
}
