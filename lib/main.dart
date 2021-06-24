import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/src/BLoC/login/LoginLogic.dart';
import 'package:pills/src/BLoC/login/login_bloc.dart';
import 'package:pills/src/BLoC/singup/SignUpLogic.dart';
import 'package:pills/src/BLoC/singup/signup_bloc.dart';
import 'package:pills/src/screens/SignUp_Page.dart';
import 'package:pills/src/screens/home_page.dart';
import 'package:pills/src/screens/login.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(logic: SimpleLoginLogic())),
      BlocProvider<SignupBloc>(
          create: (_) => SignupBloc(logic: SimpleSignUpLogic())),
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pills',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage(),
        'singUp': (BuildContext context) => SignUp()
      },
      theme: ThemeData(
        primaryColor: Colors.blue.shade300,
      ),
    );
  }
}
