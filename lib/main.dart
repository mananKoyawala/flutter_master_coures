import 'package:flutter/material.dart';
import 'package:flutter_master_course/utils/themes.dart';
import 'utils/routes.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

void main() => runApp(
      // Day 11 we Learn about constraint, context, or widget tree, element tree, render tree
      MaterialApp(
        title: "Flutter Course",
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light, //for theme mode light, dark or system
        darkTheme: MyTheme.dartThemeData, //to Apply dark theme properties,
        theme: MyTheme.themedata, //to apply theme on light mode
        initialRoute: MyRoutes.homeRoute,
        routes: {
          "/": (context) => const LoginPage(),
          MyRoutes.homeRoute: (context) => const HomePage(),
          MyRoutes.loginRoute: (context) => const LoginPage(),
        },
      ),
    );
