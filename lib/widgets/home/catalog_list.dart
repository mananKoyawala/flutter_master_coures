import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_master_course/pages/home_details_page.dart';
import '../../models/catalog.dart';
import '../../widgets/home/catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          // final catalog = CatalogModel.items[index];
          // final catalog = CatalogModel.getByID(2);
          final catalog = CatalogModel.items[index];
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog))),
            child: CatalogItem(
              catalog: catalog,
            ),
          );
        });
  }
}

class CatalogItem extends StatelessWidget {
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  final Item catalog;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 150,
      width: 150,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              catalog.name,
              textScaleFactor: 1.3,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).accentColor,
                fontSize: 12,
              ),
            ),
            Text(
              catalog.desc,
              style: TextStyle(
                  fontSize: 10, color: Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ButtonBar(
                alignment: MainAxisAlignment
                    .spaceBetween, //space betweem price and button
                buttonPadding: EdgeInsets.zero,
                children: [
                  Text(
                    "\$${catalog.price.toString()}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textScaleFactor: 1.3,
                  ),
                  SizedBox(
                    height: 40,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Icon(CupertinoIcons.cart_badge_plus),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).buttonColor),
                          shape:
                              MaterialStateProperty.all(const StadiumBorder())),
                    ),
                  )
                ],
              ),
            )
          ],
        ))
      ]),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          color: Theme.of(context).cardColor),
    );
  }
}
