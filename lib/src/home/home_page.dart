import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pills/src/Auth/AuthController.dart';

class HomePage extends GetView<AuthController> {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () => controller.logOut(),
          child: Text('Cerrar Sesion'),
        ),
      ),
    );
    // return HomePageSelection();
  }
}
