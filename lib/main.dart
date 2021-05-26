import 'package:flutter/material.dart';
import 'package:pills/src/BLoC/provider.dart';
import 'package:pills/src/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pills',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.blue.shade300,
        ),
      ),
    );
  }
}
