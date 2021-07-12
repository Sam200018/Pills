import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/src/BLoC/auth/auth_bloc.dart';

class HomePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Lo logramos!"),
            ElevatedButton(
                onPressed: () => BlocProvider.of<AuthBloc>(context)
                    .add(AuthenticationLogoutRequested()),
                child: Text('Cerrar sesion'))
          ],
        ),
      ),
    );
  }
}
