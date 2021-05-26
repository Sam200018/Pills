import 'dart:async';

import 'package:pills/src/BLoC/validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // setter
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  // getter
  String get email => _emailController.value;
  String get password => _passwordController.value;

  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);

  // Aqui tenemos que cerrar el stream
  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }
}
