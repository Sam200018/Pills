import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pills/ui/pages/home/home_page.dart';
import 'package:pills/ui/pages/login/login_page.dart';
import 'package:pills/ui/pages/optionsLogin/loginOption_page.dart';
import '../domain/blocs/auth/auth_bloc.dart';
import '../ui/pages/signup/SignUp_Page.dart';
import '../ui/pages/splash/splash_page.dart';

class AppRouter {

  static String home = "/";
  static String login = "/login";
  static String loginPage = "loginPage";
  static String signup = "signup";
  static String splash = "/splash";

  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => LoginOptionsPage(),
        routes: [
          GoRoute(
            path: loginPage,
            name: loginPage,
            builder: (context, state) => LoginPage(),
          ),
          GoRoute(
            path: signup,
            name: signup,
            builder: (context, state) => SignUpPage(),
          ),
        ],
      ),
      GoRoute(
        path: splash,
        builder: (context, state) => SplashScreen(),
      ),
    ],
    redirect: (context, state) {
      print("redirect");

      if (context.read<AuthBloc>().state.status ==
              AuthenticationStatus.authenticated &&
          state.location.startsWith(login)) {
        return home;
      } else {
        return null;
      }
    },
  );
}
