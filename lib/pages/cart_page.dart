import 'package:flutter/material.dart';
import 'package:flutter_master_course/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

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
      body: Column(children: const [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(32.0),
            child: CartList(),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Divider(thickness: 2),
        ),
        _CartTotal(),
      ]),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //we can use VxBuilder insted of VxConsumer
          VxConsumer(
            notifications: const {},
            builder: (
              context,
              _status,
              _,
            ) {
              return "\$${_cart.totalPrice}".text.xl5.make();
            },
            mutations: const {RemoveMutation},
          ),
          const SizedBox(
            width: 30,
          ),
          SizedBox(
            height: 50,
            width: 100,
            child: ElevatedButton(
              onPressed: () {
                _cart.item.isEmpty
                    ? ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Please add atleast one item in Cart!")))
                    : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Buying item Module in progress...")));
              },
              child: const Text(
                "Buy",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).buttonColor),
                  shape: MaterialStateProperty.all(const StadiumBorder())),
            ),
          ),
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.item.isEmpty
        ? Center(
            child: Text(
              "There are no items in Cart !",
              style: TextStyle(
                  color: Theme.of(context).primaryColorLight, fontSize: 15),
            ),
          )
        : ListView.builder(
            itemCount: _cart.item.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.done),
                title: Text(_cart.item[index].name),
                trailing: IconButton(
                    onPressed: () => RemoveMutation(_cart.item[index]),
                    icon: const Icon(Icons.remove_circle_outline)),
              );
            },
          );
  }
}
