import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app.dart';

extension AppTheme on App {
  static const _primaryColor = Colors.white; // Color(0xfffed603);
  static const _backgroundColor = Color(0xff100e0e);
  static const _secondaryColor = Color(0xfffbbc04);
  static const _secondaryTextColor = Color(0xffb7b7b7);
  static const _dividerColor = Color(0xffeeeeee);
  static const _appBarTextColor = Colors.white;
  static const _surfaceColor = Color(0xff262629);
  static const _hintColor = Color(0xffcacaca);

  ThemeData get defaultTheme => ThemeData(
        primaryColor: _primaryColor,
        backgroundColor: _backgroundColor,
        secondaryHeaderColor: _secondaryColor,
        dividerColor: _dividerColor,
        hintColor: _hintColor,
        textTheme: TextTheme(
          titleLarge: GoogleFonts.notoSans(
            textStyle: const TextStyle(
              color: _primaryColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          titleMedium: GoogleFonts.notoSans(
            textStyle: const TextStyle(
              color: _primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          bodyMedium: GoogleFonts.notoSans(
            textStyle: const TextStyle(
              color: _secondaryTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          labelMedium: GoogleFonts.notoSans(
            textStyle: const TextStyle(
              color: _primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          displayMedium: GoogleFonts.notoSans(
            textStyle: const TextStyle(
              color: _primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        iconTheme: const IconThemeData(
          color: _secondaryTextColor,
          size: 24,
        ),
        colorScheme: const ColorScheme(
          outline: _secondaryTextColor,
          background: _backgroundColor,
          primary: Colors.black,
          surface: _surfaceColor,
          brightness: Brightness.light,
          error: Colors.black,
          onBackground: Colors.black,
          onPrimary: Colors.black,
          onError: Colors.black,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          secondary: _secondaryColor,
        ),
        appBarTheme: AppBarTheme(
          color: _secondaryColor,
          elevation: 0,
          titleTextStyle: GoogleFonts.notoSans(
            textStyle: const TextStyle(
              color: _appBarTextColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 8,
          backgroundColor: _backgroundColor,
          selectedItemColor: _primaryColor,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
      );
  //   primaryColor: const Color(0xffFF6600),
  //   splashColor: Colors.white,
  //   unselectedWidgetColor: const Color(0xff808080),
  //   primaryTextTheme: const TextTheme(
  //     bodyText1: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xff1F0C07),
  //         fontWeight: FontWeight.w500),
  //     bodyText2: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xff6D1A03),
  //         fontWeight: FontWeight.w500),
  //     headline1: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xff861D00),
  //         fontWeight: FontWeight.w500),
  //     headline2: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xffB94A00),
  //         fontWeight: FontWeight.w500),
  //     headline3: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xffFF6600),
  //         fontWeight: FontWeight.w400),
  //     headline4: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xffFF8635),
  //         fontWeight: FontWeight.w500),
  //     headline5: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xffFFB388),
  //         fontWeight: FontWeight.w500),
  //     headline6: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xffFFD2C6),
  //         fontWeight: FontWeight.w500),
  //     subtitle1: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xffFFE6DF),
  //         fontWeight: FontWeight.w500),
  //     subtitle2: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xffFFF5F2),
  //         fontWeight: FontWeight.w500),
  //   ),
  //   textTheme: const TextTheme(
  //     bodyText1: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xff121212),
  //         fontWeight: FontWeight.w500),
  //     bodyText2: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xff333333),
  //         fontWeight: FontWeight.w500),
  //     headline1: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xff4D4D4D),
  //         fontWeight: FontWeight.w500),
  //     headline2: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xff666666),
  //         fontWeight: FontWeight.w500),
  //     headline3: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xff808080),
  //         fontWeight: FontWeight.w500),
  //     headline4: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xffBFBFBF),
  //         fontWeight: FontWeight.w500),
  //     headline5: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xffDEDEDE),
  //         fontWeight: FontWeight.w500),
  //     headline6: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xffE5E5E5),
  //         fontWeight: FontWeight.w500),
  //     subtitle1: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xff121212),
  //         fontWeight: FontWeight.w500),
  //     subtitle2: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xffc2c2c2),
  //         fontWeight: FontWeight.w500),
  //     caption: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xffFAFAFA),
  //         fontWeight: FontWeight.w500),
  //     overline: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xff0BB846),
  //         fontWeight: FontWeight.w500),
  //     button: TextStyle(
  //         fontSize: 14,
  //         color: Color(0xffF2FFF6),
  //         fontWeight: FontWeight.w500),
  //   ),
  //   appBarTheme: const AppBarTheme(
  //       backgroundColor: Colors.white,
  //       iconTheme: IconThemeData(color: Color(0xff666666))),
  //   iconTheme: const IconThemeData(color: Color(0xff666666)),
  //   backgroundColor: Colors.white,
  //   inputDecorationTheme: const InputDecorationTheme(
  //     border: OutlineInputBorder(
  //         borderSide: BorderSide(color: Color(0xff4D4D4D), width: 1)),
  //     labelStyle: TextStyle(color: Color(0xff4D4D4D), fontSize: 14.0),
  //   ),
  //   buttonTheme: const ButtonThemeData(buttonColor: Color(0xff4D4D4D)),
  //   textButtonTheme: TextButtonThemeData(
  //     style: ButtonStyle(
  //       shape: MaterialStateProperty.all(
  //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
  //       overlayColor: MaterialStateProperty.all(
  //           const Color(0xffffffff).withOpacity(0.25)),
  //       fixedSize: MaterialStateProperty.all(const Size.fromHeight(56)),
  //       foregroundColor: MaterialStateProperty.all(const Color(0xffffffff)),
  //       backgroundColor: MaterialStateProperty.all(const Color(0xffff6600)),
  //     ),
  //   ),
  //   dividerColor: const Color(0xffE5E5E5),
  //   colorScheme: const ColorScheme(
  //     primary: Color.fromRGBO(255, 102, 0, 1),
  //     secondary: Colors.white,
  //     surface: Colors.white,
  //     background: Color(0xffF8FAFF),
  //     error: Color(0x000000ff),
  //     onPrimary: Color(0x000000ff),
  //     onSecondary: Color(0x000000ff),
  //     onSurface: Color(0xff3D3D3D),
  //     onBackground: Color(0x000000ff),
  //     onError: Color(0xffF11111),
  //     brightness: Brightness.light,
  //     outline: Color(0xff666666),
  //     shadow: Color(0xffBEBEBE),
  //   ),
  // );
}
