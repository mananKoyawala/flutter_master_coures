import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master_course/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  final bool isHome;
  const AddToCart({Key? key, required this.catalog, required this.isHome})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.item.contains(catalog)
        ? true
        : false; // this statment indicates the if item in cart then done otherwise add symbol to add in cart.

    return InkWell(
      onTap: () {
        if (!isInCart) {
          AddMutation(catalog);
        } else {
          RemoveMutation(catalog);
        }
      },
      child: Container(
          height: isHome ? 25 : 40,
          width: isHome ? 50 : 80,
          decoration: BoxDecoration(
              color: Theme.of(context).hintColor,
              borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: isInCart == true
                ? const Icon(Icons.done, color: Colors.white)
                : const Icon(CupertinoIcons.cart_badge_plus,
                    color: Colors.white),
          )),
    );
  }
}
