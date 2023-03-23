import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_master_course/core/store.dart';
import 'package:flutter_master_course/models/cart.dart';
import 'package:flutter_master_course/pages/Internetlost_page.dart';
import 'package:flutter_master_course/utils/Bloc/InternetBloc/InternetBloc.dart';
import 'package:flutter_master_course/utils/Bloc/InternetBloc/InternetState.dart';
import 'package:flutter_master_course/utils/routes.dart';
import 'package:flutter_master_course/widgets/circularprogress.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert'; //used for convert json data
import '../models/catalog.dart';
import '../widgets/home/catalog_header.dart';
import '../widgets/home/catalog_list.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url =
      Uri.parse("https://mocki.io/v1/f63f6c47-01a0-43f7-b623-4a389b79d96c");

  @override //this method loads all data not reload the build method when data is avilable then the data will be shown.
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    final res = await http.get(url);
    final catalogJSON = res.body;
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
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context, _status, _) => VxBadge(
          color: Vx.red500,
          count: _cart.item.length,
          size: 22,
          textStyle: const TextStyle(fontSize: 10, color: Colors.white),
          child: FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: Theme.of(context).buttonColor,
            child: const Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        bottom: false,
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              const SizedBox(
                height: 10,
              ),
              if (CatalogModel.items.isEmpty)
                const Expanded(
                  child: Center(
                    child: CircularProgress(),
                  ),
                )
              else
                Expanded(
                    child: BlocConsumer<InternetBloc, InternetState>(
                  listener: (context, state) {
                    if (state is InternetGainedState) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.green,
                          content: Text(
                            "Back Online",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )));
                    } else if (state is InternetLostState) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            "No Internet",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          )));
                    }
                  },
                  builder: (context, state) {
                    if (state is InternetGainedState) {
                      return const CatalogList();
                    } else if (state is InternetLostState) {
                      return const InternetLostPage();
                    } else {
                      return const InternetLostPage();
                    }
                  },
                )),
            ],
          ),
        ),
      ),
    );
  }
}
