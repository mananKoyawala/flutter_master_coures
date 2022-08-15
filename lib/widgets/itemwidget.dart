import 'package:flutter/material.dart';
import '../models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        // shape: StadiumBorder(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2.5,
        child: ListTile(
          onTap: () {},
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
        ),
      ),
    );
  }
}
