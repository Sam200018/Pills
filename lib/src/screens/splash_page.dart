import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pills/src/login/controller/login_controller.dart';

class SplashScreen extends GetView<LoginController> {
  static Route route() {
    return MaterialPageRoute(builder: (_) => SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    // bool ligthMode =
    //     MediaQuery.of(context).platformBrightness == Brightness.light;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () => controller.loginWithGoogle(),
                child: Text('Acceso con google')),
            SizedBox(height: 30.0),
            TextButton(
                onPressed: () => Get.toNamed("/login"),
                child: Text('Acceso con email')),
          ],
        ),
      ),
    );
  }
}
