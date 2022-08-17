import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert'; //used for convert json data
import 'package:flutter_master_course/models/catalog.dart';
import 'package:flutter_master_course/widgets/drawer.dart';

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
    // await Future.delayed(Duration(seconds: 2));
    final catalogJSON = await rootBundle.loadString(
        "assets/files/product.json"); //get File From assets/file directory
    //rootBundle is used for background services that runs in background
    final decodedData = jsonDecode(
        catalogJSON); //decode json Data, this data is avilable in Map
    var productsData = decodedData[
        "products"]; //print only product data not return whole products
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Catalog App",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'OpenSans'),
          ),
        ),
        body: CatalogModel.items.isNotEmpty
            ? Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    final item = CatalogModel.items[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 5,
                      child: GridTile(
                          header: Container(
                            clipBehavior: Clip.antiAlias,
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            ),
                            child: Text(
                              item.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          child: Image.network(item.image),
                          footer: Container(
                            clipBehavior: Clip.antiAlias,
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Text(
                              item.price.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )),
                    );
                  },
                  itemCount: CatalogModel.items.length,
                ),
              )
            : const Center(
                child: CircularProgressIndicator(color: Colors.deepPurple),
              ),
        drawer: const MyDrawer(),
      ),
    );
  }
}
