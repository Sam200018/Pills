import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pills/src/signup/controller/signup_controller.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: SingleChildScrollView(
          padding: const EdgeInsetsDirectional.all(20.0),
          child: Form(
            key: controller.loginFormKey,
            child: Column(
              children: const [
                _NameInput(),
                SizedBox(height: 16.0),
                _LastNameInput(),
                SizedBox(height: 16.0),
                _EmailInput(),
                SizedBox(height: 16.0),
                _InputPassword(),
                SizedBox(height: 16.0),
                _InputConfirmPassword(),
                SizedBox(height: 20.0),
                _SignUpWithCredentialsButton(),
                SizedBox(height: 40.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NameInput extends GetView<SignUpController> {
  const _NameInput({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      decoration: InputDecoration(
        labelText: 'Nombre',
      ),
      controller: controller.nameCtrl,
      keyboardType: TextInputType.name,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: controller.nameValidation,
    );
  }
}

class _LastNameInput extends GetView<SignUpController> {
  const _LastNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      decoration: InputDecoration(
        labelText: 'Apellido',
      ),
      controller: controller.lastNameCtrl,
      keyboardType: TextInputType.name,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: controller.nameValidation,
    );
  }
}

class _EmailInput extends GetView<SignUpController> {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      decoration: InputDecoration(
        labelText: 'Email',
      ),
      controller: controller.emailCtrl,
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: controller.emailValidation,
    );
  }
}

class _InputPassword extends GetView<SignUpController> {
  const _InputPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: controller.passwordCtrl,
        obscureText: controller.isPasswordVisible.value,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: controller.passwordValidation,
        decoration: InputDecoration(
          labelText: 'Password',
          suffixIcon: IconButton(
            onPressed: controller.showPassword,
            icon: (!controller.isPasswordVisible.value)
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
          ),
        ),
      ),
    );
  }
}

class _InputConfirmPassword extends GetView<SignUpController> {
  const _InputConfirmPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: controller.passwordVerifiedCtrl,
        obscureText: controller.isPasswordVerifedVisible.value,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: controller.passwordConfirm,
        decoration: InputDecoration(
          labelText: 'Confirmar password',
          suffixIcon: IconButton(
            onPressed: controller.showPasswordVerifed,
            icon: (!controller.isPasswordVerifedVisible.value)
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off),
          ),
        ),
      ),
    );
  }
}

class _SignUpWithCredentialsButton extends GetView<SignUpController> {
  const _SignUpWithCredentialsButton({Key? key}) : super(key: key);

  // bool isSignupButtonEnable(SignupState state) =>
  //     state.isFormValid && isPopulatedForm && !state.isSubmitting;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => controller.signUp(),
      child: Text('Crear Cuenta'),
    );
  }
}

// class _LoginPageButton extends GetView<SignUpController> {
//   final AuthenticationRepository userRepository;

//   const _LoginPageButton({Key? key, required this.userRepository})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () => Navigator.of(context).pushAndRemoveUntil(
//           MaterialPageRoute(builder: (context) => LoginPage()),
//           (route) => false),
//       child: Text('Ya tengo cuenta'),
//     );
//   }
// }
