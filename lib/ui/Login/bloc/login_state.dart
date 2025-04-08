part of 'login_bloc.dart';

class LoginState {
  final bool isEmailValid,
      isPasswordValid,
      isSubmitting,
      isSuccess,
      isFailurePasword,
      isFailureUser;

  LoginState(
      {required this.isEmailValid,
      required this.isPasswordValid,
      required this.isSubmitting,
      required this.isFailurePasword,
      required this.isSuccess,
      required this.isFailureUser});

  bool get isFormValid => isEmailValid && isPasswordValid;

  factory LoginState.empty() {
    return LoginState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isFailurePasword: false,
        isSuccess: false,
        isFailureUser: false);
  }

  factory LoginState.loading() {
    return LoginState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: true,
        isFailurePasword: false,
        isSuccess: false,
        isFailureUser: false);
  }

  factory LoginState.failureCredential() {
    return LoginState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isFailurePasword: true,
        isSuccess: false,
        isFailureUser: false);
  }

  factory LoginState.failureUser() {
    return LoginState(
      isEmailValid: true,
      isPasswordValid: true,
      isSubmitting: false,
      isFailurePasword: false,
      isSuccess: false,
      isFailureUser: true,
    );
  }

  factory LoginState.success() {
    return LoginState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isFailurePasword: false,
        isSuccess: true,
        isFailureUser: false);
  }

  LoginState copyWith({
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isSubmitting,
    bool? isFailurePasword,
    bool? isSuccess,
    bool? isFailureUser,
  }) {
    return LoginState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isFailurePasword: isFailurePasword ?? this.isFailurePasword,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailureUser: isFailureUser ?? this.isFailureUser,
    );
  }

  LoginState update({
    bool? isEmailValid,
    bool? isPasswordValid,
  }) {
    return copyWith(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: false,
      isFailurePasword: false,
      isSuccess: false,
      isFailureUser: false,
    );
  }

  @override
  String toString() {
    return '''loginState{
      isEmialValid : $isEmailValid,
      isPasswordValid: $isPasswordValid,
      isSubmitting: $isSubmitting,
      isFailurePasword: $isFailurePasword,
      isSuccess: $isSuccess,
      isFailureUser: $isFailureUser,
    } ''';
  }
}
