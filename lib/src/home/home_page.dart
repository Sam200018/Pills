import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/respository/authentication/authentication_repository.dart';
import 'package:pills/src/BLoC/auth/auth_bloc.dart';

class HomePage extends StatelessWidget {
  final AuthenticationRepository _userRepository;

  const HomePage({Key key, AuthenticationRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  static Route route() {
    return MaterialPageRoute(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
          child: ListView(
        children: [
          ListTile(
            title: Text('Cerrar Sesion'),
            onTap: () => BlocProvider.of<AuthBloc>(context)
                .add(AuthenticationLogoutRequested()),
          )
        ],
      )),
      appBar: AppBar(
        //*aca va el logo de la app
        leading: Icon(Icons.pageview),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        // *Colocar aca una caja de input para buscar los medicamentos
        title: Text(
          'Buscar',
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: FutureBuilder(
          future: _userRepository.getIsInTheHouse(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.data) {
              return Text(snapshot.data.toString());
            } else {
              return Text('No data');
            }
          }),
    );
  }
}
