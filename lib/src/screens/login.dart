import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pills/src/BLoC/login/login_bloc.dart';
import 'package:pills/src/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();

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
              height: 130.0,
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
            child: BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is ErrorBlocState) {
                  _showError(context, state.message);
                }
                if (state is LoggedInBlocState) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => HomePage()));
                }
              },
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Text(
                        'Ingreso',
                        style: TextStyle(fontSize: 25.0),
                      ),
                      SizedBox(height: 60.0),
                      if (state is EmailError)
                        _ingresarEmail(
                            context, emailController, "email no valido")
                      else
                        _ingresarEmail(context, emailController, " "),
                      SizedBox(height: 30.0),
                      _ingresarPassword(context, passwordController),
                      SizedBox(height: 30.0),
                      if (state is LogginInBlocState)
                        CircularProgressIndicator()
                      else if (state is EmailError ||
                          passwordController.text.length == 0)
                        _errorButton()
                      else
                        _ingresarButton(
                            context, emailController, passwordController)
                    ],
                  );
                },
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, 'singUp');
              },
              child: Text('Crear una nueva cuenta'))
        ],
      ),
    );
  }

  Widget _ingresarEmail(
      BuildContext context, TextEditingController email, String message) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: email,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.email_outlined, color: Colors.black, size: 34.0),
          hintText: 'ejemplo@correo.com',
          errorText: message,
        ),
        onChanged: _doChange(context, email),
      ),
    );
  }

  Widget _ingresarPassword(
      BuildContext context, TextEditingController password) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: password,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock_open, color: Colors.black, size: 34.0),
          hintText: 'password',
        ),
      ),
    );
  }

  Widget _ingresarButton(BuildContext context, TextEditingController email,
      TextEditingController password) {
    return ElevatedButton(
      child: Text('Ingresar'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 0.0,
        primary: Colors.cyan,
      ),
      onPressed: () => _doLogin(context, email.text, password.text),
    );
  }

  Widget _errorButton() {
    return ElevatedButton(
      child: Text('Ingresar'),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 0.0,
        primary: Colors.cyan,
      ),
      onPressed: null,
    );
  }

  void _doLogin(BuildContext context, String e, String p) {
    BlocProvider.of<LoginBloc>(context).add(DoLoginEvent(e, p));
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  _doChange(BuildContext context, TextEditingController email) {
    BlocProvider.of<LoginBloc>(context).add(ChangeEmailPassword(email.text));
  }
}
