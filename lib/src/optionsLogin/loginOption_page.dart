import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pills/routeConstants.dart';
import 'package:pills/src/utils/utils.dart';
import '../../domain/blocs/login/login_bloc.dart';

class LoginOptionsPage extends StatelessWidget {
  const LoginOptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            LogoPills(),
            SizedBox(height: 20.0),
            GoogleAccessButton(),
            SizedBox(height: 15.0),
            EmailAccessButton(),
            SizedBox(height: 90.0),
            NewAccountButton()
          ],
        ),
      ),
    );
  }
}

class GoogleAccessButton extends StatelessWidget {
  const GoogleAccessButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Container(
          width: 250.0,
          height: 50.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(0),
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            onPressed: () {
              BlocProvider.of<LoginBloc>(context).add(LoginWithGooglePressed());
            },
            child: Row(
              children: [
                SizedBox(
                  width: 5.0,
                ),
                Image.asset(
                  'assets/logoGoogle.png',
                ),
                SizedBox(
                  width: 12.0,
                ),
                Text(
                  "Acceso con Google",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, .54),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto Mono'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class EmailAccessButton extends StatelessWidget {
  const EmailAccessButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 50,
      child: ElevatedButton(
          onPressed: () => context.go(RouteConstants.login),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(0),
            primary: buttonText(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: CustomText(
            textC: 'Acceso con email',
            size: 20.0,
          )),
    );
  }
}

class NewAccountButton extends StatelessWidget {
  const NewAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, '/signup'),
      child: CustomTextUnderline(
        textC: 'Crear Cuenta',
        size: 20.0,
      ),
    );
  }
}
