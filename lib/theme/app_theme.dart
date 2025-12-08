// lib/theme/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  // Thème clair
  ///avec static on peiut y accedder sans instantiation
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    //brightness: Brightness.light,
    primaryColor: const Color.fromARGB(255, 36, 4, 4),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 121, 85, 72),
      brightness: Brightness.light,
    ),
    primarySwatch: Colors.brown,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 121, 85, 72), // marron
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );

  // Thème sombre
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: const Color.fromARGB(255, 36, 4, 4),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 121, 85, 72),
      brightness: Brightness.dark,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.brown)),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 121, 85, 72), // marron
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      iconTheme: IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
    ),

    ///
  );
}
