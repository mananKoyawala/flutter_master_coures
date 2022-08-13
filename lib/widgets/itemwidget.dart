import 'package:flutter/material.dart';
import '../models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => print("${item.name} is pressed"),
      leading: Image.network(item.image),
      title: Text(
        item.name,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(item.desc),
      trailing: Text(
        "\$${item.price.toString()}",
        textScaleFactor: 1.2,
        style: const TextStyle(
            fontWeight: FontWeight.w900, color: Colors.deepPurple),
      ),
    );
  }
}
