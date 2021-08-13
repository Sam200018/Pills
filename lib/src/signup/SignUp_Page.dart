import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/respository/authentication/authentication_repository.dart';
import 'package:pills/src/signup/SignupForm.dart';
import 'package:pills/src/signup/signup_bloc/signup_bloc.dart';

class SignUpPage extends StatelessWidget {
  final AuthenticationRepository _userRepository;

  const SignUpPage({Key? key, required AuthenticationRepository userRepository})
      : _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SignupBloc>(
        create: (context) => SignupBloc(userRepository: _userRepository),
        child: SafeArea(
          child: SignupForm(
            _userRepository,
          ),
        ),
      ),
    );
  }
}
