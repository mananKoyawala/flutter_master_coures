import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() => runApp(
      MaterialApp(
        title: "Flutter Course",
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light, //for theme mode light, dark or system
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.red,
        ), //to Apply dark theme properties,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ), //to apply theme on light mode
      ),
    );
