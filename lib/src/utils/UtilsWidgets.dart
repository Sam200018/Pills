import 'package:flutter/material.dart';

class ListSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // ListTile(
        //   title: Text('Cerrar Sesion'),
        //   onTap: () => BlocProvider.of<AuthBloc>(context)
        //       .add(AuthenticationLogoutRequested()),
        // )
      ],
    );
  }
}
