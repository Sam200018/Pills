import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pills/routeConstants.dart';
import 'package:pills/ui/pages/splash/splash_page.dart';
import 'package:pills/ui/pages/home/home_page.dart';
import 'package:pills/ui/pages/login/login_page.dart';
import 'package:pills/ui/pages/optionsLogin/loginOption_page.dart';
import 'domain/blocs/auth/auth_bloc.dart';


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
