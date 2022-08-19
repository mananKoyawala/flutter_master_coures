import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert'; //used for convert json data
import 'package:flutter_master_course/models/catalog.dart';
import 'package:flutter_master_course/utils/themes.dart';

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
    await Future.delayed(const Duration(seconds: 2));
    final catalogJSON = await rootBundle.loadString(
        "assets/files/product.json"); //get File From assets/file directory
    //rootBundle is used for background services that runs in background
    final decodedData = jsonDecode(
        catalogJSON); //decode json Data, this data is avilable in Map
    var productsData = decodedData[
        "products"]; //print only product data not return whole products

    setState(() {
      CatalogModel.items = List.from(productsData)
          .map<Item>((item) => Item.fromMap(item))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModel.items.isEmpty)
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.deepPurple,
                    ),
                  ),
                )
              else
                const Expanded(child: CatalogList()),
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catalog App",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 30,
            color: MyTheme.darkBluish,
          ),
        ),
        const Text(
          "Trending Products",
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return CatalogItem(
            catalog: catalog,
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
        CatalogImage(image: catalog.image),
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
                color: MyTheme.darkBluish,
                fontSize: 12,
              ),
            ),
            Text(
              catalog.desc,
              style: const TextStyle(
                  fontSize: 10, color: Color.fromARGB(192, 86, 85, 85)),
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
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Buy"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluish),
                        shape:
                            MaterialStateProperty.all(const StadiumBorder())),
                  )
                ],
              ),
            )
          ],
        ))
      ]),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white),
    );
  }
}

class CatalogImage extends StatelessWidget {
  const CatalogImage({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        color: MyTheme.creamColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(image),
        ),
      ),
    );
  }
}
