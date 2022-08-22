import 'package:flutter/material.dart';
import 'package:flutter_master_course/package/myvx.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData themedata(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        buttonColor: darkBluish,
        accentColor: darkBluish,
        primaryColor: darkBluish,
        primaryColorLight: Colors.black,
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: Colors.deepPurple),
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      );
  static ThemeData darkThemeData(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: darkcreamColor,
        buttonColor: lightBluish,
        accentColor: Colors.white,
        primaryColor: whiteShaddey,
        primaryColorLight: Colors.white,
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: Colors.white),
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      );
  static Color creamColor = const Color(0xfff5f5f5); //extra colors
  static Color darkcreamColor = Vx.gray800; //extra colors
  static Color darkBluish = const Color(0xff403b58);
  static Color lightBluish = Vx.indigo700;
  static Color transprent = const Color.fromARGB(192, 86, 85, 85);
  static Color whiteShaddey = Colors.white70;
}
