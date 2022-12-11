import 'package:flutter/material.dart';

class ThemeConfig {
  static const Color lightPrimary = Colors.white;
  static const Color darkPrimary = Color(0xff1f1f1f);
  static const Color lightAccent = Color(0xfffbbc04);
  static const Color darkAccent = Color(0xfffbbc04);
  static const Color lightBG = Colors.white;
  static const Color darkBG = Color(0xff121212);

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: lightBG,
    bottomAppBarColor: Colors.grey[500],
    appBarTheme: const AppBarTheme(
      color: lightPrimary,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    backgroundColor: darkBG,
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: darkBG,
    bottomAppBarColor: Colors.grey.shade100,
    appBarTheme: const AppBarTheme(
      color: darkPrimary,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
  );
}
