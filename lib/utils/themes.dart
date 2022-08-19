import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData get themedata => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      );
  static ThemeData get dartThemeData => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        fontFamily: GoogleFonts.poppins().fontFamily,
      );
  static Color creamColor = const Color(0xfff5f5f5); //extra colors
  static Color darkBluish = const Color(0xff403b58);
}
