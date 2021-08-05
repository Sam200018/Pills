import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pills/src/utils/utilsColors.dart';

final theme = ThemeData(
    textTheme: GoogleFonts.latoTextTheme(),
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
    ));
