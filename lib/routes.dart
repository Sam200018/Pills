import 'package:get/get.dart';

import 'package:pills/src/home/home_page.dart';
import 'package:pills/src/login/controller/login_controller.dart';
import 'package:pills/src/login/login_page.dart';
import 'package:pills/src/newPassword/new_password_page.dart';
import 'package:pills/src/screens/splash_page.dart';
import 'package:pills/src/signup/SignUp_Page.dart';
import 'package:pills/src/signup/controller/signup_controller.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: '/home',
      page: () => HomePage(),
    ),
    GetPage(
      name: '/loginOptions',
      page: () => SplashScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/signup',
      page: () => SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: '/newPassword',
      page: () => NewPasswordPage(),
    )
  ];
}
