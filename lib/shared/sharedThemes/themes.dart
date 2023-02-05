import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodlicheTheme {
  static TextTheme LightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.openSans(
        fontSize: 21.0, fontWeight: FontWeight.w700, color: Colors.black),
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
      bodyText1: GoogleFonts.openSans(
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headline1: GoogleFonts.openSans(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headline2: GoogleFonts.openSans(
        fontSize: 21.0,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headline3: GoogleFonts.openSans(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      headline4: GoogleFonts.openSans(
        fontSize: 29.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headline6: GoogleFonts.openSans(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ));

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
          (states) {
            return Colors.black;
          },
        ),
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      snackBarTheme: SnackBarThemeData(
          actionTextColor: Colors.black,
          backgroundColor: Colors.white,
          contentTextStyle: LightTextTheme.bodyText1),
      textTheme: LightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      snackBarTheme: SnackBarThemeData(
        actionTextColor: Colors.black,
        backgroundColor: Colors.black,
        contentTextStyle: darkTextTheme.bodyText1,
      ),
      textTheme: darkTextTheme,
    );
  }
}
