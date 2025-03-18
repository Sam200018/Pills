import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pills/app.dart';
import 'package:pills/data/services/shared_preferences/shared_preferences.dart';
import 'config/firebase/prod/firebase_options.dart';
import 'di/bloc_register.dart';
import 'di/repository_register.dart';


main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //*para  interactuar con el motor de Flutter
  await Firebase.initializeApp(
    name: "Production",
    options: DefaultFirebaseOptions.currentPlatform,
  ); //*llamar al condigo nativo de plataforma
  EquatableConfig.stringify = kDebugMode;
  setupRepositories();
  setupBlocs();
  final prefs = new SharedPreferencesUser();
  await prefs.initPrefs();
  runApp(
    App(flavor: "Production"),
  );
}
