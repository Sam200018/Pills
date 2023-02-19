import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/respository/repository.dart';
import 'package:pills/routes.dart';
import 'package:pills/src/BLoC/auth/auth_bloc.dart';
import 'package:pills/src/addMedicine/AddMedicineBloc/addmedicine_bloc.dart';
import 'package:pills/src/home/home_bloc/home_bloc.dart';
import 'package:pills/src/login/login_bloc/login_bloc.dart';
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

class AppView extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;

  const AppView({Key? key, required this.authenticationRepository})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Pills',
      debugShowCheckedModeBanner: false,
      theme: theme,
      //
      // initialRoute: '/',
      // routes: {
      //   '/': (context) {
      //     return BlocBuilder<AuthBloc, AuthenticationState>(
      //       builder: (context, state) {
      //         print(state.user);
      //         switch (state.status) {
      //           case AuthenticationStatus.authenticated:
      //             return HomePage();
      //
      //           case AuthenticationStatus.unauthenticated:
      //             return LoginOptionsPage();
      //
      //           default:
      //             return SplashScreen();
      //         }
      //       },
      //     );
      //   },
      //   '/login': (context) => LoginPage(),
      //   '/signup': (context) =>
      //       SignUpPage(userRepository: authenticationRepository),
      //   '/medicineDeatils': (context) {
      //     return MedicineDetailsPage();
      //   },
      // },
    );
  }
}
