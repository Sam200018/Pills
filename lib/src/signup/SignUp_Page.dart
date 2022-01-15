import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pills/respository/repository.dart';
import 'package:pills/src/signup/SignupForm.dart';
import 'package:pills/src/signup/signup_bloc/signup_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('SignUp Page'),
      ),
      // body: BlocProvider<SignupBloc>(
      //   create: (context) => SignupBloc(userRepository: _userRepository),
      //   child: SafeArea(
      //     child: SignupForm(
      //       _userRepository,
      //     ),
      //   ),
      // ),
    );
  }
}
