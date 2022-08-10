import 'package:flutter/material.dart';
import 'utils/routes.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

void main() => runApp(
      MaterialApp(
        title: "Flutter Course",
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light, //for theme mode light, dark or system
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.red,
          fontFamily: 'QuickSand',
        ), //to Apply dark theme properties,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: 'QuickSand',
        ), //to apply theme on light mode
        initialRoute: MyRoutes.homeRoute,
        routes: {
          "/": (context) => const LoginPage(),
          MyRoutes.homeRoute: (context) => const HomePage(),
          MyRoutes.loginRoute: (context) => const LoginPage(),
        },
      ),
    );
