import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pills/respository/repository.dart';
import 'package:pills/src/BLoC/auth/auth_bloc.dart';
import 'package:pills/src/addMedicine/AddMedicineBloc/addmedicine_bloc.dart';
import 'package:pills/src/addMedicine/MedicineDetailsPage.dart';
import 'package:pills/src/home/home_bloc/home_bloc.dart';
import 'package:pills/src/home/home_page.dart';
import 'package:pills/src/login/login_bloc/login_bloc.dart';
import 'package:pills/src/login/login_page.dart';
import 'package:pills/src/optionsLogin/loginOption_page.dart';
import 'package:pills/src/screens/splash_page.dart';
import 'package:pills/src/signup/SignUp_Page.dart';
import 'package:pills/theme.dart';

class App extends StatelessWidget {
  final AuthenticationRepository _authenticationRepository;
  final String flavor;

  const App(
      {Key? key, required AuthenticationRepository authenticationRepository, required this.flavor})
      : _authenticationRepository = authenticationRepository;


  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (_) =>
                AuthBloc(authenticationRepository: _authenticationRepository),
          ),
          BlocProvider<AddmedicineBloc>(
              create: (_) =>
                  AddmedicineBloc(medicineFirebase: MedicineFirebase())),
          BlocProvider<HomeBloc>(
              create: (_) => HomeBloc()..add(HouseChecked())),
          BlocProvider(create: (_) => LoginBloc(_authenticationRepository)),
        ],
        child: AppView(
          authenticationRepository: _authenticationRepository,
        ),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  final AuthenticationRepository authenticationRepository;

  const AppView({Key? key, required this.authenticationRepository})
      : super(key: key);

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
              print(state.user);
              switch (state.status) {
                case AuthenticationStatus.authenticated:
                  return HomePage();

                case AuthenticationStatus.unauthenticated:
                  return LoginOptionsPage();

                default:
                  return SplashScreen();
              }
            },
          );
        },
        '/login': (context) => LoginPage(),
        '/signup': (context) =>
            SignUpPage(userRepository: widget.authenticationRepository),
        '/medicineDeatils': (context) {
          return MedicineDetailsPage();
        },
      },
    );
  }
}
