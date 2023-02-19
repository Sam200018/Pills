import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pills/app.dart';
import 'package:pills/di/bloc_register.dart';
import 'package:pills/di/repository_register.dart';
import 'package:pills/shared_preferences/shared_preferences.dart';
import 'package:pills/stg/firebase_options.dart';

main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //*para  interactuar con el motor de Flutter
  await Firebase.initializeApp(
    name: "Staging",
    options: DefaultFirebaseOptions.currentPlatform,
  ); //*llamar al condigo nativo de plataforma
  EquatableConfig.stringify = kDebugMode;
  setupRepositories();
  setupBlocs();

  final prefs = new SharedPreferencesUser();
  await prefs.initPrefs();
  runApp(
    App(flavor: "Staging"),
  );
}
