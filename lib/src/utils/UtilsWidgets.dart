import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pills/src/BLoC/auth/auth_bloc.dart';

class ListSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Cerrar Sesion'),
          onTap: () => BlocProvider.of<AuthBloc>(context)
              .add(AuthenticationLogoutRequested()),
        )
      ],
    );
  }
}
