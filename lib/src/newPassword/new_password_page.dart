import 'package:flutter/material.dart';
import 'package:pills/src/utils/utils.dart';

class NewPasswordPage extends StatelessWidget {
  const NewPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          textC: 'Reestablecer contraseña',
          size: 20.0,
        ),
      ),
      body: Center(
        child: Text('Aqui va el campo para reestablecer la contrasenia'),
      ),
    );
  }
}
