import 'package:flutter/material.dart';

class AppTheme {
  ThemeData appTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFA77D2B)
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFA77D2B), 
      onPrimary: Colors.white, 
      secondary: Colors.white, 
      onSecondary: Color(0xFFB9BABC), 
      error: Color(0xFFFF0000), 
      onError: Colors.white, 
      surface: Colors.white, 
      onSurface: Color(0xFFA77D2B)),
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black
      ),
      headlineLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15
      ),
      headlineMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: Colors.black
      ),
      labelMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),
);
}