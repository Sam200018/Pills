import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pills/respository/authentication/authentication_repository.dart';

class NewPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewPasswordController>(() => NewPasswordController());
  }
}

class NewPasswordController extends GetxController {
  final AuthenticationRepository repository = AuthenticationRepository();
  final newPasswordKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();

  @override
  void onClose() {
    emailCtrl.dispose();
    super.onClose();
  }

  String? emialValidation(String? email) {
    if (!GetUtils.isEmail(email!)) {
      return "ingrese un email valido";
    } else {
      return null;
    }
  }

  Future<void> sendEmail() async {
    if (newPasswordKey.currentState!.validate()) {
      try {
        await repository.sendEmailToChangePassword(email: emailCtrl.text);
      } catch (e) {
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 7),
        );
      }
      Get.back();
    } else {
      Get.defaultDialog(
        title: 'Error',
        middleText: 'Verifica que el email sea valido',
        textConfirm: 'Aceptar',
        onConfirm: () => Get.back(),
      );
    }
  }
}
