import 'package:flutter/material.dart';

import 'package:pills/src/utils/utils.dart';

final theme = ThemeData(
  fontFamily: "Montserrat",
  primaryColorDark: const Color(0xff2D2C3B),
  primaryColor: const Color(0xff39369D),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
    filled: true,
    fillColor: Colors.white,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: buttonText(),
    elevation: 0.0,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    actionsIconTheme: IconThemeData(color: buttonDeepGray()),
    elevation: 0,
    centerTitle: true,
  ),
);
