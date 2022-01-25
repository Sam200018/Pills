import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pills/respository/authentication/authentication_repository.dart';
import 'package:pills/src/utils/utils.dart';

class SignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}

class SignUpController extends GetxController {
  final AuthenticationRepository repository = AuthenticationRepository();
  final loginFormKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final passwordVerifiedCtrl = TextEditingController();

  final isPasswordVisible = true.obs;
  final isPasswordVerifedVisible = true.obs;

  @override
  void onClose() {
    nameCtrl.dispose();
    lastNameCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    passwordVerifiedCtrl.dispose();
    super.onClose();
  }

  String? passwordValidation(String? s) {
    if (!Validators.isValidPassword(s!)) {
      return "Imhrese una contrasena valida";
    }
  }

  String? nameValidation(String? name) {
    if (!Validators.isValidNames(name!)) {
      return "Ingrese un nombre valido";
    } else {
      return null;
    }
  }

  String? emailValidation(String? s) {
    if (!GetUtils.isEmail(s!)) {
      return "Ingrese un email valido";
    } else {
      return null;
    }
  }

  String? passwordConfirm(String? password) {
    if (passwordCtrl.text != passwordVerifiedCtrl.text) {
      return "las contraseñas deben de coincidir";
    }
  }

  void showPassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
    update();
  }

  void showPasswordVerifed() {
    isPasswordVerifedVisible.value = !isPasswordVerifedVisible.value;
    update();
  }

  Future<void> signUp() async {
    if (loginFormKey.currentState!.validate()) {
      try {
        Get.defaultDialog(
          title: 'Cargando...',
          content: CircularProgressIndicator(),
        );
        await repository.singUpWithEmailAndPassword(
            name: nameCtrl.text,
            lastName: lastNameCtrl.text,
            email: emailCtrl.text,
            password: passwordCtrl.text);
        Get.back();
      } catch (e) {
        Get.back();
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
        middleText: 'Verifica que los campos hayan sido llenados correctamente',
        textConfirm: 'Aceptar',
        onConfirm: () => Get.back(),
      );
    }
  }
}
