import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pills/respository/repository.dart';

import 'package:pills/src/utils/utils.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}

class LoginController extends GetxController {
  final AuthenticationRepository repository = AuthenticationRepository();
  final loginFormKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final isPasswordVisible = true.obs;

  @override
  void onClose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.onClose();
  }

  String? passwordValidation(String? s) {
    if (!Validators.isValidPassword(s!)) {
      return "Ingrese una contraseña valida";
    } else {
      return null;
    }
  }

  String? emailValidation(String? s) {
    if (!GetUtils.isEmail(s!)) {
      return "Ingrese un email no valido";
    } else {
      return null;
    }
  }

  void showPassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
    update();
  }

  Future<void> login() async {
    if (loginFormKey.currentState!.validate()) {
      try {
        await repository.loginWithEmailAndPassword(
            email: emailCtrl.text, password: passwordCtrl.text);
      } catch (e) {
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 7),
        );
      }
    } else {
      Get.defaultDialog(
        title: 'Error',
        middleText:
            'Verifica que los campos hayan sido llenandos correctamente',
        textConfirm: 'Aceptar',
        onConfirm: () => Get.back(),
      );
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      await repository.loginWithGoogle();
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 7),
      );
    }
  }
}
