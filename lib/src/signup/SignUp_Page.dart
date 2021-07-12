import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:pills/src/signup/signup_bloc/signup_bloc.dart';

class SignUpPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('SignUp en contruccion'),
      ),
    );
  }
}
