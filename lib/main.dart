import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

void main() => runApp(
      MaterialApp(
        title: "Flutter Course",
        // home: const HomePage(),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light, //for theme mode light, dark or system
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.red,
        ), //to Apply dark theme properties,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ), //to apply theme on light mode
        initialRoute: "/home",
        routes: {
          "/": (context) => const LoginPage(),
          "/home": (context) => const HomePage(),
          "/login": (context) => const LoginPage(),
        },
      ),
    );
