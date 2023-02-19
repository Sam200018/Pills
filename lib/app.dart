import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/repositories/repository.dart';
import 'package:pills/routes.dart';
import 'package:pills/src/BLoC/auth/auth_bloc.dart';
import 'package:pills/src/addMedicine/AddMedicineBloc/addmedicine_bloc.dart';
import 'package:pills/src/home/home_bloc/home_bloc.dart';
import 'package:pills/src/login/login_bloc/login_bloc.dart';
import 'package:pills/theme.dart';
import 'di/bloc_register.dart';

class App extends StatelessWidget {
  final String flavor;

  const App({Key? key, required this.flavor});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => locator.get<AuthBloc>(),
        ),
        BlocProvider<AddmedicineBloc>(
            create: (_) =>
                AddmedicineBloc(medicineFirebase: MedicineFirebase())),
        BlocProvider<HomeBloc>(create: (_) => HomeBloc()..add(HouseChecked())),
        BlocProvider(create: (_) => locator.get<LoginBloc>()),
      ],
      child: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

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
