import 'package:flutter/material.dart';

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
