import 'package:flutter/material.dart';
import 'package:flutter_master_course/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = "Manan";
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog App",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'OpenSans'),
        ),
      ),
      body: Center(child: Text("My Name is $name")),
      drawer: const MyDrawer(),
    );
  }
}
