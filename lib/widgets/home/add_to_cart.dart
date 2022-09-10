import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({Key? key, required this.catalog}) : super(key: key);

  final _cart =
      CartModel(); // Now the problem is every time new object is created where CartModel or CatalogModel for overcome this problem we have to create one object that we create new object it returns created old object. for this we changes in cart and catalog model class.
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.item.contains(catalog)
        ? true
        : false; // this statment indicates the if item in cart then done otherwise add symbol to add in cart.

    return ElevatedButton(
      onPressed: () {
        // Here we actualy add items in cart model

        if (!isInCart) {
          final _catalog = CatalogModel();
          isInCart = isInCart == false ? true : false;
          _cart.catalog =
              _catalog; //here we set catalog to get ids of items where first matches from catalogmodel and add in to itemIds that will be used in future.
          _cart.add(catalog); //add to cart
          // setState(() {});
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
