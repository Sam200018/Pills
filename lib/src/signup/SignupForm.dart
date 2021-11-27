import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pills/respository/repository.dart';
import 'package:pills/src/login/login_page.dart';
import 'package:pills/src/signup/signup_bloc/signup_bloc.dart';

class SignupForm extends StatefulWidget {
  final AuthenticationRepository _userRepository;

  const SignupForm(
    this._userRepository, {
    Key? key,
  }) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController _nameController = TextEditingController(),
      _lastNameController = TextEditingController(),
      _emailContrl = TextEditingController(),
      _passwordContrl = TextEditingController();
  AuthenticationRepository get _userRepository => widget._userRepository;

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _passwordContrl.dispose();
    _emailContrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  'La cuenta ya existe',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
        }
        if (state.isSuccess) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
              (route) => false);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  'Usuario registrado exitosamente!',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
        }
      },
      child: Align(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Imagen'),
              SizedBox(height: 16.0),
              _NameInput(name: _nameController),
              SizedBox(height: 16.0),
              _LastNameInput(lastName: _lastNameController),
              SizedBox(height: 16.0),
              _EmailInput(email: _emailContrl),
              SizedBox(height: 16.0),
              _InputPassword(password: _passwordContrl),
              SizedBox(height: 16.0),
              _SignUpWithCredentialsButton(
                name: _nameController,
                lastName: _lastNameController,
                email: _emailContrl,
                password: _passwordContrl,
              ),
              SizedBox(height: 40.0),
              _LoginPageButton(
                userRepository: _userRepository,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _NameInput extends StatelessWidget {
  final TextEditingController name;

  const _NameInput({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return TextFormField(
          autocorrect: false,
          decoration: InputDecoration(
              labelText: 'Nombre',
              errorText: !state.isNameValid ? 'formato incorrecto' : null),
          controller: name,
          keyboardType: TextInputType.name,
          onChanged: (name) =>
              BlocProvider.of<SignupBloc>(context).add(NameChanged(name: name)),
        );
      },
    );
  }
}

class _LastNameInput extends StatelessWidget {
  final TextEditingController lastName;

  const _LastNameInput({Key? key, required this.lastName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return TextField(
          autocorrect: false,
          decoration: InputDecoration(
              labelText: 'Apellido',
              errorText: !state.isLastNameValid ? 'formato incorrecto' : null),
          controller: lastName,
          keyboardType: TextInputType.name,
          onChanged: (lastName) => BlocProvider.of<SignupBloc>(context)
              .add(LastNameChanged(lastName: lastName)),
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  final TextEditingController email;

  const _EmailInput({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return TextFormField(
          autocorrect: false,
          decoration: InputDecoration(
              labelText: 'Correo electronico',
              errorText: !state.isEmailVal ? 'email no valido' : null),
          controller: email,
          keyboardType: TextInputType.emailAddress,
          onChanged: (email) => BlocProvider.of<SignupBloc>(context)
              .add(ChangedEmail(emailRegister: email)),
        );
      },
    );
  }
}

class _InputPassword extends StatelessWidget {
  final TextEditingController password;

  const _InputPassword({Key? key, required this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return TextFormField(
          autocorrect: false,
          obscureText: true,
          decoration: InputDecoration(
              labelText: 'Contraseña',
              errorText: !state.isPassValid ? 'contraseña invalida' : null),
          controller: password,
          onChanged: (password) => BlocProvider.of<SignupBloc>(context)
              .add(ChangedPassword(passwordRegister: password)),
        );
      },
    );
  }
}

class _SignUpWithCredentialsButton extends StatelessWidget {
  final TextEditingController name, lastName, email, password;

  const _SignUpWithCredentialsButton({
    Key? key,
    required this.name,
    required this.lastName,
    required this.email,
    required this.password,
  }) : super(key: key);

  bool get isPopulatedForm =>
      name.text.isNotEmpty &&
      lastName.text.isNotEmpty &&
      password.text.isNotEmpty;

  bool isSignupButtonEnable(SignupState state) =>
      state.isFormValid && isPopulatedForm && !state.isSubmitting;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return (state.isSubmitting)
            ? Center(child: CircularProgressIndicator())
            : ElevatedButton(
                onPressed: isSignupButtonEnable(state)
                    ? () {
                        BlocProvider.of<SignupBloc>(context).add(SubmittingForm(
                            name: name.text,
                            lastName: lastName.text,
                            emailRegister: email.text,
                            passwordRegister: password.text));
                      }
                    : null,
                child: Text('Crear Cuenta'),
              );
      },
    );
  }
}

class _LoginPageButton extends StatelessWidget {
  final AuthenticationRepository userRepository;

  const _LoginPageButton({Key? key, required this.userRepository})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginPage()),
          (route) => false),
      child: Text('Ya tengo cuenta'),
    );
  }
}
