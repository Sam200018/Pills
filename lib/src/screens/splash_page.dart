import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pills/src/login/controller/login_controller.dart';
import 'package:pills/src/utils/utils.dart';

class SplashScreen extends StatelessWidget {
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
            SizedBox(height: 100),
            LogoPills(),
            SizedBox(height: 20.0),
            GoogleAccessButton(),
            SizedBox(height: 15.0),
            EmailAccessButton(),
            SizedBox(height: 90.0),
            NewAccountButton(),
          ],
        ),
      ),
    );
  }
}

class GoogleAccessButton extends GetWidget<LoginController> {
  const GoogleAccessButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 50.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(0),
            primary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        onPressed: () => controller.loginWithGoogle(),
        child: Row(
          children: [
            SizedBox(
              width: 5.0,
            ),
            Image.asset(
              'assets/logoGoogle.png',
            ),
            SizedBox(
              width: 12.0,
            ),
            Text(
              "Acceso con Google",
              style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, .54),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto Mono'),
            )
          ],
        ),
      ),
    );
  }
}

class EmailAccessButton extends StatelessWidget {
  const EmailAccessButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 50,
      child: ElevatedButton(
          onPressed: () => Get.toNamed("/login"),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(0),
            primary: buttonText(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: CustomText(
            textC: 'Acceso con email',
            size: 20.0,
          )),
    );
  }
}

class NewAccountButton extends StatelessWidget {
  const NewAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Get.toNamed('/signup'),
      child: CustomTextUnderline(
        textC: 'Crear Cuenta',
        size: 20.0,
      ),
    );
  }
}
