import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    // bool ligthMode =
    //     MediaQuery.of(context).platformBrightness == Brightness.light;
    //TODO: revisar si se usa esta pagina sino para removerla
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: () {}, child: Text('Acceso con google')),
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
