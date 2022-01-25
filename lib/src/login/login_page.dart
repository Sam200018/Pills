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
                _SignUpButton(),
              ],
            ),
          ),
        ),
      ),
      // body: BlocProvider<LoginBloc>(
      //   create: (context) =>
      //       LoginBloc(context.read<AuthenticationRepository>()),
      //   child: SafeArea(
      //     child: LoginForm(),
      //   ),
      // ),
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
        labelText: 'email',
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
          labelText: 'password',
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

///Este widget esta comentado porque falta hacerle su metodo OnPressed en el controlador
///y asi se accede mediante cuentas de google

// class _LoginWithGoogleButton extends GetWidget<LoginController> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 200.0,
//       child: ElevatedButton(
//         onPressed: () =>
//             BlocProvider.of<LoginBloc>(context).add(LoginWithGooglePressed()),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [Icon(Icons.android), Text('Login con google')],
//         ),
//       ),
//     );
//   }
// }

class _SignUpButton extends GetWidget<LoginController> {
  const _SignUpButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Get.toNamed('/signup'),
      child: Text('Crear cuenta'),
    );
  }
}
