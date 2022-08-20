import 'package:flutter/material.dart';
import 'package:flutter_master_course/utils/themes.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyTheme.creamColor,
        appBar: AppBar(
          backgroundColor: MyTheme.creamColor,
          title: const Text(
            "Cart",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
