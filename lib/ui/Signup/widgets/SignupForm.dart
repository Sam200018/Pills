import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pills/domain/blocs/signup/signup_bloc.dart';
import 'package:pills/routes.dart';
import 'package:pills/ui/Login/widgets/login_page.dart';
import 'package:pills/ui/utils/UtilsWidgets.dart';
import 'package:pills/ui/utils/utilsColors.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController _nameController = TextEditingController(),
      _lastNameController = TextEditingController(),
      _emailContrl = TextEditingController(),
      _passwordContrl = TextEditingController();

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
        heightFactor: 1.0,
        child: SingleChildScrollView(
          child: Column(
            children: [
              LogoPillsForm(),
              SizedBox(height: 16.0),
              _NameInput(name: _nameController),
              SizedBox(height: 16.0),
              _LastNameInput(lastName: _lastNameController),
              SizedBox(height: 16.0),
              _EmailInput(email: _emailContrl),
              SizedBox(height: 16.0),
              _InputPassword(password: _passwordContrl),
              SizedBox(height: 63.0),
              _SignUpWithCredentialsButton(
                name: _nameController,
                lastName: _lastNameController,
                email: _emailContrl,
                password: _passwordContrl,
              ),
              SizedBox(height: 60.0),
              _LoginPageButton()
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
        return Container(
          width: 285.0,
          child: TextFormField(
            autocorrect: false,
            decoration: InputDecoration(
                labelText: 'Nombre',
                errorText: !state.isNameValid ? 'formato incorrecto' : null),
            controller: name,
            keyboardType: TextInputType.name,
            onChanged: (name) => BlocProvider.of<SignupBloc>(context)
                .add(NameChanged(name: name)),
          ),
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
        return Container(
          width: 285.0,
          child: TextFormField(
            autocorrect: false,
            decoration: InputDecoration(
                labelText: 'Apellido',
                errorText:
                    !state.isLastNameValid ? 'formato incorrecto' : null),
            controller: lastName,
            keyboardType: TextInputType.name,
            onChanged: (lastName) => BlocProvider.of<SignupBloc>(context)
                .add(LastNameChanged(lastName: lastName)),
          ),
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
        return Container(
          width: 285.0,
          child: TextFormField(
            autocorrect: false,
            decoration: InputDecoration(
                labelText: 'Correo electronico',
                errorText: !state.isEmailVal ? 'email no valido' : null),
            controller: email,
            keyboardType: TextInputType.emailAddress,
            onChanged: (email) => BlocProvider.of<SignupBloc>(context)
                .add(ChangedEmail(emailRegister: email)),
          ),
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
        return Container(
          width: 285.0,
          child: TextFormField(
            autocorrect: false,
            obscureText: true,
            decoration: InputDecoration(
                labelText: 'Contraseña',
                errorText: !state.isPassValid ? 'contraseña invalida' : null),
            controller: password,
            onChanged: (password) => BlocProvider.of<SignupBloc>(context)
                .add(ChangedPassword(passwordRegister: password)),
          ),
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
            : Container(
                width: 285.0,
                height: 50.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonText(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: isSignupButtonEnable(state)
                      ? () {
                          BlocProvider.of<SignupBloc>(context).add(
                              SubmittingForm(
                                  name: name.text,
                                  lastName: lastName.text,
                                  emailRegister: email.text,
                                  passwordRegister: password.text));
                        }
                      : null,
                  child: CustomText(
                    textC: 'Crear Cuenta',
                    size: 20.0,
                  ),
                ),
              );
      },
    );
  }
}

class _LoginPageButton extends StatelessWidget {
  const _LoginPageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.go(AppRouter.login+"/"+AppRouter.loginPage),
      child: CustomTextUnderline(
        textC: 'Ya tengo cuenta',
        size: 20.0,
      ),
    );
  }
}
