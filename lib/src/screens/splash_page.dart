import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('SplashScreen'),
      ),
    );
  }
}
