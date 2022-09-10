import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master_course/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  const AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.item.contains(catalog)
        ? true
        : false; // this statment indicates the if item in cart then done otherwise add symbol to add in cart.

    return ElevatedButton(
      onPressed: () {
        // Here we actualy add items in cart model

        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      child: isInCart == true
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).buttonColor),
          shape: MaterialStateProperty.all(const StadiumBorder())),
    );
  }
}
