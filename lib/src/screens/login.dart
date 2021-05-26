import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loginForm(context),
    );
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 180.0,
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
                  'Ingreso',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 60.0),
                _ingresarEmail(),
                SizedBox(height: 30.0),
                _ingresarPassword(),
                SizedBox(height: 30.0),
                _ingresarBotton(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _ingresarEmail() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            Icons.email_outlined,
            color: Colors.black,
          ),
          hintText: 'ejemplo@correo.com',
        ),
        // onChanged: () {},
      ),
    );
  }

  Widget _ingresarPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: Colors.black,
          ),
          hintText: 'ejemplo@correo.com',
        ),
        // onChanged: () {},
      ),
    );
  }

  Widget _ingresarBotton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text('Ingresar'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 0.0,
        primary: Colors.cyan,
      ),
    );
  }
}
