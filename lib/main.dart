import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        title: "Flutter Course",
        home: MyApp(),
        debugShowCheckedModeBanner: false,
      ),
    );

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final day = 30;
  String name = "Manan";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: Center(
        child: Text("Flutter in $day by $name"),
      ),
    );
  }
}
