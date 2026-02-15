import 'package:flutter/material.dart';

// all theme stuff in one place so nothing is hardcoded in widgets
class AppTheme {
  AppTheme._();

  // colors
  static const Color primaryColor = Color(0xFF1565C0);
  static const Color accentColor = Color(0xFF42A5F5);
  static const Color keypadButtonColor = Color(0xFF1E88E5);
  static const Color clearButtonColor = Color(0xFFE53935);
  static const Color surfaceColor = Color(0xFFF5F5F5);
  static const Color tableHeaderColor = Color(0xFFE3F2FD);
  static const Color amountDisplayBg = Colors.white;

  // text styles
  static const TextStyle amountLabelStyle = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const TextStyle amountValueStyle = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    color: primaryColor,
  );

  static const TextStyle tableNoteStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    color: Colors.black87,
  );

  static const TextStyle tableCountStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: primaryColor,
  );

  static const TextStyle keypadButtonTextStyle = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static ThemeData get themeData => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        scaffoldBackgroundColor: surfaceColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 2,
        ),
        useMaterial3: true,
      );
}
