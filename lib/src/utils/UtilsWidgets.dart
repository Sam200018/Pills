import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pills/src/Auth/AuthController.dart';

class ListSide extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(title: Text('Cerrar Sesion'), onTap: () => controller.logOut())
      ],
    );
  }
}

class LogoPills extends StatelessWidget {
  const LogoPills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/logo_pillsx1.png');
  }
}

class LogoPillsForm extends StatelessWidget {
  const LogoPillsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/LogoPillsForm.png');
  }
}

class CustomText extends StatelessWidget {
  final String textC;
  final double size;

  const CustomText({required this.textC, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      textC,
      style: TextStyle(
        color: Colors.black,
        fontSize: size,
      ),
    );
  }
}

class CustomTextUnderline extends StatelessWidget {
  final String textC;
  final double size;

  const CustomTextUnderline({required this.textC, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      textC,
      style: TextStyle(
        color: Colors.black,
        decoration: TextDecoration.underline,
        fontSize: size,
      ),
    );
  }
}
