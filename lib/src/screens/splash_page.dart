import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    bool ligthMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    //TODO: revisar si se usa esta pagina sino para removerla
    return Scaffold(
      body: Center(
          // child: ligthMode? Image.asset(name):Image.asset(name),
          ),
    );
  }
}
