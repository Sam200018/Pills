import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/ui/Authentication/bloc/auth_bloc.dart';

class ListSide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Cerrar Sesion'),
          onTap: () =>
              context
                  .read<AuthBloc>()
                  .add(AuthenticationLogoutRequested(context)),
        )
      ],
    );
  }
}

class LogoPills extends StatelessWidget {
  const LogoPills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/logo_pillsx1.png",
    );
  }
}

class LogoPillsForm extends StatelessWidget {
  const LogoPillsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/logo_reducido.png');
  }
}

class CustomText extends StatelessWidget {
  final String textC;
  final double size;

  const CustomText({required this.textC, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      textC,
      style: TextStyle(
        color: Colors.black,
        fontSize: size,
      ),
    );
  }
}

class CustomTextUnderline extends StatelessWidget {
  final String textC;
  final double size;

  const CustomTextUnderline({required this.textC, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      textC,
      style: TextStyle(
        color: Colors.black,
        decoration: TextDecoration.underline,
        fontSize: size,
      ),
    );
  }
}
