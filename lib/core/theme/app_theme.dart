import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    const primaryColor = Color(0xFF7E2A6C);
    const backgroundColor1 = Color(0xFFF5EAEE);
    const backgroundColor2 = Color(0xFFC86B98);

    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: primaryColor,
        onPrimary: Colors.white,
        secondary: Color(0xFFF5EAEE),
        onSecondary: Colors.white,
        surface: Colors.white,
        onSurface: Color(0xFF1E1E1E),
        error: Color(0xFFD32F2F),
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: backgroundColor1,
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundColor2,
        foregroundColor: Colors.black,
        surfaceTintColor: backgroundColor1,
        scrolledUnderElevation: 4,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1E1E1E),
        ),
        bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF4A4A4A)),
        bodyMedium: TextStyle(fontSize: 14, color: Color(0xFF4A4A4A)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF7E2A6C)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF7E2A6C), width: 2),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      cardTheme: CardThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        color: Colors.white,
        shadowColor: primaryColor.withValues(alpha: 0.2),
      ),
    );
  }
}
