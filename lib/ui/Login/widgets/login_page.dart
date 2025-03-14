import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/di/bloc_register.dart';
import '../../../domain/blocs/login/login_bloc.dart';
import '../../pages/login/LoginForm.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => locator.get<LoginBloc>(),
        child: SafeArea(
          child: LoginForm(),
        ),
      ),
    );
  }
}
