// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get_storage/get_storage.dart';

class MyTheme {
  static ThemeData themedata(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      // fontFamily: GoogleFonts.poppins().fontFamily,
      fontFamily: 'poppins',
      cardColor: Colors.white,
      canvasColor: creamColor,
      // buttonColor: darkBluish,
      // accentColor: darkBluish,
      hintColor: darkBluish, //button
      highlightColor: darkBluish, //accent
      primaryColor: darkBluish,
      primaryColorLight: Colors.black,
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: Colors.deepPurple),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      iconTheme: IconThemeData(color: darkBluish));
  static ThemeData darkThemeData(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      // fontFamily: GoogleFonts.poppins().fontFamily,
      fontFamily: 'poppins',
      cardColor: Colors.black,
      canvasColor: darkcreamColor,
      // buttonColor: lightBluish,
      // accentColor: Colors.white,
      hintColor: lightBluish, //button
      highlightColor: Colors.white, //accent
      primaryColor: whiteShaddey,
      primaryColorLight: Colors.white,
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: Colors.white),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      iconTheme: const IconThemeData(color: Colors.white));
  static Color creamColor = const Color(0xfff5f5f5); //extra colors
  static Color darkcreamColor = Vx.gray800; //extra colors
  static Color darkBluish = const Color(0xff403b58);
  static Color lightBluish = Vx.indigo700;
  static Color transprent = const Color.fromARGB(192, 86, 85, 85);
  static Color whiteShaddey = Colors.white70;
}

class ThemeServices {
  final _box = GetStorage();
  final _key = 'isLightMode';
  _saveThemeToBox(bool isLightMode) => _box.write(_key, isLightMode);
  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;
  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
