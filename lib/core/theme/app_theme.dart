import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF5B4FCF),
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(centerTitle: false),
      );

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF5B4FCF),
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(centerTitle: false),
      );
}
