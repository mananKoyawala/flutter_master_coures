import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData get themedata => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'QuickSand',
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      );
  static ThemeData get dartThemeData => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        fontFamily: 'QuickSand',
      );
}
