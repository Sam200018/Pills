import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pills/src/login/controller/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

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
                _EmailInput(),
                SizedBox(height: 16.0),
                _PasswordInput(),
                SizedBox(height: 16.0),
                _LoginButton(),
                SizedBox(height: 40.0),
                _SignUpPageButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends GetWidget<LoginController> {
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

class _PasswordInput extends GetWidget<LoginController> {
  const _PasswordInput({Key? key}) : super(key: key);

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

class _LoginButton extends GetWidget<LoginController> {
  const _LoginButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => controller.login(),
      child: Text('Iniciar Sesión'),
    );
  }
}

class _SignUpPageButton extends GetWidget<LoginController> {
  const _SignUpPageButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Get.toNamed('/signup'),
      child: Text('Crear cuenta'),
    );
  }
}
