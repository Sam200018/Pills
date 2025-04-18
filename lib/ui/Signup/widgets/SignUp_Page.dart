import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/di/bloc_register.dart';
import 'package:pills/ui/Signup/bloc/signup_bloc.dart';
import 'package:pills/ui/Signup/widgets/SignupForm.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SignupBloc>(
        create: (context) => locator.get<SignupBloc>(),
        child: SafeArea(
          child: SignupForm(),
        ),
      ),
    );
  }
}
