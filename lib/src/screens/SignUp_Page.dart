import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pills/src/BLoC/singup/signup_bloc.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController(),
      lastNameController = TextEditingController(),
      emailController = TextEditingController(),
      passwordController = TextEditingController(),
      confirmation = TextEditingController();

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
            child: BlocListener<SignupBloc, SignupState>(
              listener: (context, state) {
                if (state is ErrorBlocState) {
                  _showMessageError(context, state.m);
                }
                if (state is SignedUpBlocState) {
                  _showSignedUpMessage(context);
                  Navigator.pushReplacementNamed(context, 'login');
                }
              },
              child: BlocBuilder<SignupBloc, SignupState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      Text(
                        'Registro',
                        style: TextStyle(fontSize: 25.0),
                      ),
                      SizedBox(height: 30.0),
                      _ingresarNombre(context, nameController),
                      SizedBox(height: 30.0),
                      _ingresarApellido(context, lastNameController),
                      SizedBox(height: 30.0),
                      if (state is EmailError)
                        _ingresarEmail(context, 'Ingresa un email valido')
                      else
                        _ingresarEmail(context, null),
                      SizedBox(height: 30.0),
                      if (state is PasswordError)
                        _ingresarPassword(
                            context, '8 caracteres, una letra y un numero')
                      else
                        _ingresarPassword(context, null),
                      SizedBox(height: 30.0),
                      _confirmarPassword(context),
                      SizedBox(height: 30.0),
                      if (state is SigningUpBLocState)
                        CircularProgressIndicator()
                      else if (nameController.text.isEmpty ||
                          lastNameController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          passwordController.text.isEmpty)
                        _crearButtonError(context, '')
                      else
                        _crearButton(context, '')
                    ],
                  );
                },
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'login');
              },
              child: Text(
                'Ya tengo cuenta',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }

  Widget _ingresarNombre(BuildContext context, TextEditingController name) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.person_outlined, color: Colors.black, size: 34.0),
          errorText: (name.text.length < 3) ? '3 caracteres min' : null,
        ),
        controller: name,
      ),
    );
  }

  Widget _ingresarApellido(
      BuildContext context, TextEditingController lastName) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: lastName,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.person_add_alt_1_outlined,
              color: Colors.black, size: 34.0),
          errorText: (lastName.text.length < 2) ? '2 caracteres min' : null,
        ),
      ),
    );
  }

  Widget _ingresarEmail(BuildContext context, String error) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.email_outlined, color: Colors.black, size: 34.0),
          hintText: 'ejemplo@correo.com',
          errorText: (error == null) ? null : error,
        ),
        onSaved: _doChange(context),
      ),
    );
  }

  Widget _ingresarPassword(BuildContext context, String error) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: passwordController,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock_open, color: Colors.black, size: 34.0),
          hintText: 'password',
          errorText: (error == null) ? null : error,
        ),
        onTap: _doChangePassword(context),
      ),
    );
  }

  Widget _confirmarPassword(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: confirmation,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.lock_open, color: Colors.black, size: 34.0),
          hintText: 'confirmar password',
          errorText: (passwordController.text != confirmation.text)
              ? "las contraseñas deben de coincidir"
              : null,
        ),
      ),
    );
  }

  Widget _crearButton(BuildContext context, String message) {
    return ElevatedButton(
      child: Text('Crear Cuenta'),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          elevation: 0.0,
          primary: Colors.cyan),
      onPressed: () => _doCreate(context),
    );
  }

  Widget _crearButtonError(BuildContext context, String message) {
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

  void _doCreate(BuildContext context) {
    BlocProvider.of<SignupBloc>(context)
        .add(DoCreateRegister('Sam', 'Bau', emailController.text, 'password'));
  }

  void _showMessageError(BuildContext context, String m) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(m)));
  }

  _doChange(BuildContext context) {
    BlocProvider.of<SignupBloc>(context).add(ChangeEmail(emailController.text));
  }

  _doChangePassword(BuildContext context) {
    BlocProvider.of<SignupBloc>(context)
        .add(ChangePassword(passwordController.text));
  }

  void _showSignedUpMessage(BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Usuario Creado")));
  }
}
