import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // titleTextStyle: TextStyle(color: Colors.black),
        // toolbarTextStyle: TextStyle(color: Colors.blue),
        // foregroundColor: Colors.black,
        title: Text(
          "Cart",
          style: TextStyle(color: Theme.of(context).primaryColorLight),
        ),
      ),
    );
  }
}
