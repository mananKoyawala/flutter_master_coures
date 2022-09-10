import 'package:flutter/material.dart';
import 'package:flutter_master_course/models/cart.dart';

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
      body: Column(children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: CartList(),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Divider(thickness: 2),
        ),
        const _CartTotal(),
      ]),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text("\$${_cart.totalPrice}",
            style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 25,
                fontWeight: FontWeight.w600)),
        const SizedBox(
          width: 30,
        ),
        SizedBox(
          height: 50,
          width: 100,
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Buying not supported yet...")));
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
        )
      ]),
    );
  }
}

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
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
                    onPressed: () {
                      _cart.remove(_cart.item[index]);

                      // setState(() {});
                    },
                    icon: const Icon(Icons.remove_circle_outline)),
              );
            },
          );
  }
}
