import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/respository/authentication/authentication_repository.dart';
import 'package:pills/src/signup/SignupForm.dart';
import 'package:pills/src/signup/signup_bloc/signup_bloc.dart';

class SignUpPage extends StatelessWidget {
  final AuthenticationRepository _userRepository;

  const SignUpPage({Key key, AuthenticationRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SignupBloc>(
        create: (context) => SignupBloc(userRepository: _userRepository),
        child: SignupForm(
          userRepository: _userRepository,
        ),
      ),
    );
  }
}
