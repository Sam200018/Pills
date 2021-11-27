import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/respository/repository.dart';
import 'package:pills/src/login/login_bloc/login_bloc.dart';
import 'package:pills/src/login/LoginForm.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) =>
            LoginBloc(context.read<AuthenticationRepository>()),
        child: SafeArea(
          child: LoginForm(),
        ),
      ),
    );
  }
}
