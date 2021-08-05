import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pills/respository/authentication/authentication_repository.dart';
import 'package:pills/src/BLoC/auth/auth_bloc.dart';
import 'package:pills/src/addMedicine/addMedicinesPage.dart';
import 'package:pills/src/home/home_page.dart';
import 'package:pills/src/login/login_page.dart';
import 'package:pills/src/screens/splash_page.dart';
import 'package:pills/src/signup/SignUp_Page.dart';
import 'package:pills/theme.dart';

class App extends StatelessWidget {
  const App({Key key, @required this.authenticationRepository})
      : assert(authenticationRepository != null);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) =>
            AuthBloc(authenticationRepository: authenticationRepository),
        child: AppView(
          authenticationRepository: authenticationRepository,
        ),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  final AuthenticationRepository authenticationRepository;

  const AppView({Key key, this.authenticationRepository}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pills',
      debugShowCheckedModeBanner: false,
      theme: theme,
      navigatorKey: _navigatorKey,
      initialRoute: '/',
      routes: {
        '/': (context) {
          return BlocBuilder<AuthBloc, AuthenticationState>(
            builder: (context, state) {
              switch (state.status) {
                case AuthenticationStatus.authenticated:
                  return HomePage(
                      userRepository: widget.authenticationRepository);
                  break;
                case AuthenticationStatus.unauthenticated:
                  return LoginPage(
                      userRepository: widget.authenticationRepository);
                  break;
                default:
                  return SplashScreen();
                  break;
              }
            },
          );
        },
        'signup': (context) =>
            SignUpPage(userRepository: widget.authenticationRepository),
        '/addMedicine': (context) => AddMedicinePage()
      },
    );
  }
}
