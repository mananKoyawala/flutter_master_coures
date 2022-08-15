import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert'; //used for convert json data
import 'package:flutter_master_course/models/catalog.dart';
import 'package:flutter_master_course/widgets/drawer.dart';
import 'package:flutter_master_course/widgets/itemwidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override //this method loads all data not reload the build method when data is avilable then the data will be shown.
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var catalogJSON = await rootBundle.loadString(
        "assets/files/product.json"); //get File From assets/file directory
    //rootBundle is used for background services that runs in background
    var decodedData = jsonDecode(
        catalogJSON); //decode json Data, this data is avilable in Map
    var productsData = decodedData[
        "products"]; //print only product data not return whole products
    print(productsData);
  }

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
