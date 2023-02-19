import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/blocs/login/login_bloc.dart';
import '../../utils/UtilsWidgets.dart';
import '../../utils/utilsColors.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController();

  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  void _onEmailChanged() {
    _loginBloc.add(EmailChanged(email: _emailController.text));
  }

  void _onPasswordChanged() {
    _loginBloc.add(PasswordChanged(password: _passwordController.text));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailurePasword) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  'Las credenciales no son correctas',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
        }
        if (state.isFailureUser) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  'El usuario no existe',
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
              LogoPills(),
              SizedBox(height: 16.0),
              _EmailInput(_emailController),
              SizedBox(height: 16.0),
              _PasswordInput(_passwordController),
              SizedBox(height: 58.0),
              _LoginButton(
                _passwordController,
                _emailController,
              ),
              SizedBox(height: 60.0),
              _SignUpButton()
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  final TextEditingController email;

  const _EmailInput(this.email, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Container(
          width: 285.0,
          child: TextFormField(
            autocorrect: false,
            decoration: InputDecoration(
                labelText: 'email',
                errorText: !state.isEmailValid ? 'email invalido' : null),
            controller: email,
            keyboardType: TextInputType.emailAddress,
            onChanged: (email) => BlocProvider.of<LoginBloc>(context)
                .add(EmailChanged(email: email)),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  final TextEditingController password;

  const _PasswordInput(this.password, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Container(
          width: 285.0,
          child: TextFormField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
                labelText: 'password',
                errorText: !state.isPasswordValid ? 'password invalida' : null),
            onChanged: (password) => BlocProvider.of<LoginBloc>(context)
                .add(PasswordChanged(password: password)),
          ),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  final TextEditingController password, email;

  bool get isPopulated => email.text.isNotEmpty && password.text.isNotEmpty;

  bool isLoginButtonEnable(LoginState state) =>
      state.isFormValid && isPopulated && !state.isSubmitting;

  const _LoginButton(this.password, this.email);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.isSubmitting
            ? Center(child: CircularProgressIndicator())
            : Container(
                width: 285.0,
                height: 50.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: buttonText(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: isLoginButtonEnable(state)
                      ? () => BlocProvider.of<LoginBloc>(context).add(
                          LoginWithCredentialsPressed(
                              email: email.text, password: password.text))
                      : null,
                  child: CustomText(
                    textC: 'Iniciar Sesion',
                    size: 20.0,
                  ),
                ),
              );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.of(context).pushNamed('/signup'),
      child: CustomTextUnderline(
        textC: 'Crear Cuenta',
        size: 20.0,
      ),
    );
  }
}
