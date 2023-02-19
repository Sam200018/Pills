import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pills/routeConstants.dart';
import 'package:pills/src/BLoC/auth/auth_bloc.dart';
import 'package:pills/src/home/home_page.dart';
import 'package:pills/src/login/login_page.dart';
import 'package:pills/src/optionsLogin/loginOption_page.dart';
import 'package:pills/src/screens/splash_page.dart';
import 'package:pills/src/signup/SignUp_Page.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: RouteConstants.home,
      builder: (context, state) {
        switch (context.read<AuthBloc>().state.status) {
          case AuthenticationStatus.authenticated:
            return HomePage();

          case AuthenticationStatus.unauthenticated:
            return LoginOptionsPage();

          default:
            return SplashScreen();
        }
      },
    ),
    GoRoute(
      path: RouteConstants.login,
      builder: (context, state) => LoginPage(),
    ),
    // TODO: revisar bien DI para evitar meter aqui la dependecia
    // GoRoute(
    //   path: RouteConstants.signup,
    //   builder: (context, state) => SignUpPage(userRepository: userRepository),
    // ),
  ],
);
