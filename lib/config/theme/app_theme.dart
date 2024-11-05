import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getLightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        primary: Color(0xFF5E81AC), // Nord 10
        primaryContainer: Color(0xFFD8DEE9), // Nord 4
        secondary: Color(0xFF88C0D0), // Nord 8
        secondaryContainer: Color(0xFFE5E9F0), // Nord 5
        background: Color(0xFFECEFF4), // Nord 6
        surface: Color(0xFFFFFFFF), // Blanco
        error: Color(0xFFBF616A), // Nord 11
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onBackground: Colors.black,
        onSurface: Colors.black,
        onError: Colors.white,
        brightness: Brightness.light,
      ),
    );
  }

  ThemeData getDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        primary: Color(0xFF5E81AC), // Nord 10
        primaryContainer: Color(0xFF3B4252), // Nord 1
        secondary: Color(0xFF88C0D0), // Nord 8
        secondaryContainer: Color(0xFF4C566A), // Nord 3
        background: Color(0xFF2E3440), // Nord 0
        surface: Color(0xFF2E3440),
        // surface: Color(0xFF3B4252), // Nord 1
        // Nord 1
        error: Color(0xFFBF616A), // Nord 11
        onPrimary: Colors.white,
        onSecondary: Color.fromARGB(255, 218, 223, 228),
        onBackground: Color(0xFF2E3440),
        onSurface: Color.fromARGB(255, 233, 235, 238),
        onError: Colors.white,
        brightness: Brightness.dark,
      ),
    );
  }
}
