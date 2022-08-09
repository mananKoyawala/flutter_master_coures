import 'package:flutter/material.dart';
import './home_page.dart';

void main() => runApp(
      MaterialApp(
        title: "Flutter Course",
        home: MyApp(),
        debugShowCheckedModeBanner: false,
      ),
    );

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePage(),
    );
  }
}
