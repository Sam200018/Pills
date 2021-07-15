import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/respository/authentication/authentication_repository.dart';
import 'package:pills/src/login/login_bloc/login_bloc.dart';
import 'package:pills/src/login/LoginForm.dart';

class LoginPage extends StatelessWidget {
  final AuthenticationRepository _userRepository;

  const LoginPage({Key key, AuthenticationRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  static Route route() {
    return MaterialPageRoute(builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(userRepository: _userRepository),
        child: LoginForm(
          userRepository: _userRepository,
        ),
      ),
    );
  }
}
