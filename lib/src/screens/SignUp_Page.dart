import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _signUpForm(context),
    );
  }

  Widget _signUpForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 60.0,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            width: size.width * .85,
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              color: Colors.pink.shade100,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0, 5.0),
                  spreadRadius: 3.0,
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  'Registro',
                  style: TextStyle(fontSize: 25.0),
                ),
                SizedBox(height: 30.0),
                _ingresarNombre(),
                SizedBox(height: 30.0),
                _ingresarApellido(),
                SizedBox(height: 30.0),
                _ingresarEmail(),
                SizedBox(height: 30.0),
                _ingresarPassword(),
                SizedBox(height: 30.0),
                _confirmarPassword(),
                SizedBox(height: 30.0),
                _crearButton()
              ],
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'login');
              },
              child: Text('Ya tengo cuenta'))
        ],
      ),
    );
  }

  Widget _ingresarNombre() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.person_outlined, color: Colors.black, size: 34.0),
        ),
      ),
    );
  }

  Widget _ingresarApellido() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.person_add_alt_1_outlined,
              color: Colors.black, size: 34.0),
        ),
      ),
    );
  }

  Widget _ingresarEmail() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.email_outlined, color: Colors.black, size: 34.0),
          hintText: 'ejemplo@correo.com',
        ),
      ),
    );
  }

  Widget _ingresarPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock_open, color: Colors.black, size: 34.0),
          hintText: 'password',
        ),
      ),
    );
  }

  Widget _confirmarPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock_open, color: Colors.black, size: 34.0),
          hintText: 'confirmar password',
        ),
      ),
    );
  }

  Widget _crearButton() {
    return ElevatedButton(
      child: Text('Crear Cuenta'),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 0.0,
          primary: Colors.cyan),
      onPressed: null,
    );
  }
}
