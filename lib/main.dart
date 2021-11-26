import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pills/app.dart';
import 'package:pills/respository/authentication/authentication_repository.dart';
import 'package:pills/shared_preferences/shared_preferences.dart';

main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //*para  interactuar con el motor de Flutter
  await Firebase.initializeApp(); //*llamar al condigo nativo de plataforma
  EquatableConfig.stringify = kDebugMode;
  final authenticationRepository = AuthenticationRepository();
  await authenticationRepository.user.first;
  final prefs = new SharedPreferencesUser();
  await prefs.initPrefs();
  runApp(App(
    authenticationRepository: authenticationRepository,
  ));
}
