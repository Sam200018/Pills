import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pills/src/newPassword/controller/newPassword_controller.dart';

import 'package:pills/src/utils/utils.dart';

class NewPasswordPage extends GetView<NewPasswordController> {
  const NewPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomText(
            textC: 'Reestablecer contraseña',
            size: 20.0,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: controller.newPasswordKey,
            child: Column(
              children: [
                CustomText(
                  textC:
                      'Se enviara un link a su correo electrónico, que lo ayudara a reestablecer su contraseña ',
                  size: 20.0,
                ),
                SizedBox(height: 16.0),
                _EmailInputToLink(),
                SizedBox(height: 16.0),
                _SendLinkToEmailButton()
              ],
            ),
          ),
        ));
  }
}

class _EmailInputToLink extends GetWidget<NewPasswordController> {
  const _EmailInputToLink({Key? key}) : super(key: key);

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
      validator: controller.emialValidation,
    );
  }
}

class _SendLinkToEmailButton extends GetWidget<NewPasswordController> {
  const _SendLinkToEmailButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 50,
      child: ElevatedButton(
        onPressed: () => controller.sendEmail(),
        child: CustomText(
          size: 20.0,
          textC: 'Enviar correo',
        ),
        style: ElevatedButton.styleFrom(
          elevation: 10,
          padding: EdgeInsets.all(0),
          primary: buttonText(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
