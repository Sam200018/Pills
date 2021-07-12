import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/respository/authentication/authentication_repository.dart';
import 'package:pills/src/BLoC/auth/auth_bloc.dart';
import 'package:pills/src/home/home_page.dart';
import 'package:pills/src/login/login_page.dart';
import 'package:pills/src/screens/splash_page.dart';
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
  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        navigatorKey: _navigatorKey,
        builder: (context, child) {
          return BlocListener<AuthBloc, AuthenticationState>(
            listener: (context, state) {
              switch (state.status) {
                case AuthenticationStatus.authenticated:
                  _navigator.pushAndRemoveUntil<void>(
                      HomePage.route(), (route) => false);
                  break;
                case AuthenticationStatus.unauthenticated:
                  _navigator.pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => LoginPage(
                              userRepository: widget.authenticationRepository)),
                      (route) => false);
                  break;
                default:
                  break;
              }
            },
            child: child,
          );
        },
        onGenerateRoute: (_) => SplashScreen.route());
  }
}
