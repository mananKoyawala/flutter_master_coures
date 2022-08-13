import 'package:flutter/material.dart';
import 'package:flutter_master_course/models/catalog.dart';
import 'package:flutter_master_course/widgets/drawer.dart';
import 'package:flutter_master_course/widgets/itemwidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog App",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'OpenSans'),
        ),
      ),
      body: ListView.builder(
        // itemCount: CatalogModel.items.length,
        itemCount: dummyList.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            item: //CatalogModel.items[index]
                dummyList[index],
          );
        },
      ),
      drawer: const MyDrawer(),
    );
  }
}
