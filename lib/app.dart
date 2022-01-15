// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get/get.dart';

// import 'package:pills/respository/repository.dart';
// import 'package:pills/src/BLoC/auth/auth_bloc.dart';
// import 'package:pills/src/addMedicine/AddMedicineBloc/addmedicine_bloc.dart';
// import 'package:pills/src/addMedicine/MedicineDetailsPage.dart';
// import 'package:pills/src/home/home_bloc/home_bloc.dart';
// import 'package:pills/src/home/home_page.dart';
// import 'package:pills/src/login/controller/login_controller.dart';
// import 'package:pills/src/login/login_page.dart';
// import 'package:pills/src/screens/splash_page.dart';
// import 'package:pills/src/signup/SignUp_Page.dart';
// import 'package:pills/theme.dart';

// class App extends StatelessWidget {
//   const App(
//       {Key? key, required AuthenticationRepository authenticationRepository})
//       : _authenticationRepository = authenticationRepository;

//   final AuthenticationRepository _authenticationRepository;

//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider.value(
//       value: _authenticationRepository,
//       child: MultiBlocProvider(
//         providers: [
//           BlocProvider<AuthBloc>(
//             create: (_) =>
//                 AuthBloc(authenticationRepository: _authenticationRepository),
//           ),
//           BlocProvider<AddmedicineBloc>(
//               create: (_) =>
//                   AddmedicineBloc(medicineFirebase: MedicineFirebase())),
//           BlocProvider<HomeBloc>(create: (_) => HomeBloc()..add(HouseChecked()))
//         ],
//         child: AppView(
//           authenticationRepository: _authenticationRepository,
//         ),
//       ),
//     );
//   }
// }

// class AppView extends StatefulWidget {
//   final AuthenticationRepository authenticationRepository;

//   const AppView({Key? key, required this.authenticationRepository})
//       : super(key: key);

//   @override
//   _AppViewState createState() => _AppViewState();
// }

// class _AppViewState extends State<AppView> {
//   final _navigatorKey = GlobalKey<NavigatorState>();

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Pills',
//       debugShowCheckedModeBanner: false,
//       theme: theme,
//       navigatorKey: _navigatorKey,
//       initialRoute: '/',
//       getPages: [
//         GetPage(name: '/', page: () => LoginPage(), binding: LoginBinding()),
//       ],
//       routes: {
//         '/': (context) {
//           return BlocBuilder<AuthBloc, AuthenticationState>(
//             builder: (context, state) {
//               switch (state.status) {
//                 case AuthenticationStatus.authenticated:
//                   return HomePage();

//                 case AuthenticationStatus.unauthenticated:
//                   return LoginPage();

//                 default:
//                   return SplashScreen();
//               }
//             },
//           );
//         },
//         'signup': (context) =>
//             SignUpPage(userRepository: widget.authenticationRepository),
//         '/medicineDeatils': (context) {
//           return MedicineDetailsPage();
//         },
//       },
//     );
//   }
// }
