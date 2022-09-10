import 'package:flutter_master_course/models/cart.dart';
import 'package:flutter_master_course/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CartModel cart;
  late CatalogModel catalog;

  MyStore() {
    cart = CartModel();
    catalog = CatalogModel();
    cart.catalog = catalog;
  }
}
