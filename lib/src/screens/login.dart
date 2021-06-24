import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pills/src/BLoC/login/login_bloc.dart';
import 'package:pills/src/screens/home_page.dart';
import 'package:pills/src/utils/utilsColors.dart';

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
        body: Stack(
      children: [
        _background(),
        _loginForm(context),
      ],
    ));
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 20.0,
            ),
          ),
          Container(
            width: size.width * .85,
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
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
                      Image.asset('assets/LogoLogIn.png'),
                      SizedBox(height: 30.0),
                      if (state is EmailError)
                        _ingresarEmail(
                            context, emailController, "email no valido")
                      else
                        _ingresarEmail(context, emailController, null),
                      SizedBox(height: 30.0),
                      _ingresarPassword(context, passwordController),
                      SizedBox(height: 30.0),
                      //Todo: Hacer de esto un nuevo boton
                      Text('Olvide la contrasenia'),
                      SizedBox(height: 60.0),
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
              child: Text(
                'Crear una nueva cuenta',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }

  Widget _ingresarEmail(
      BuildContext context, TextEditingController email, String message) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: email,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: Colors.grey)),
            focusColor: Colors.white,
            hintText: 'ejemplo@correo.com',
            hintStyle: TextStyle(color: Colors.indigo[300]),
            errorText: message == null ? null : message,
            errorStyle: TextStyle(color: Colors.red[900], fontSize: 20.0)),
        onChanged: _doChange(context, email),
      ),
    );
  }

  Widget _ingresarPassword(
      BuildContext context, TextEditingController password) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        textAlign: TextAlign.center,
        controller: password,
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: Colors.grey)),
          filled: true,
          fillColor: Colors.white,
          hintText: 'password',
          hintStyle: TextStyle(color: Colors.indigo[300]),
        ),
      ),
    );
  }

  Widget _ingresarButton(BuildContext context, TextEditingController email,
      TextEditingController password) {
    return ElevatedButton(
      child: Text('Iniciar Sesion'),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(300, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 10.0,
        primary: buttonText(),
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

  Widget _background() {
    return Container(
      child: Image.asset(
        'assets/BackgroundImage.png',
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
