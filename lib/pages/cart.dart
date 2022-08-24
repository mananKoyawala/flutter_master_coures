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
    return SizedBox(
      height: MediaQuery.of(context).size.height / 7.5,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text("\$9999",
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
            onPressed: () {},
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

class CartList extends StatefulWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.done),
          title: const Text("Items"),
          trailing: IconButton(
              onPressed: () {}, icon: const Icon(Icons.remove_circle_outline)),
        );
      },
    );
  }
}
