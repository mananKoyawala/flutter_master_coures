import 'package:flutter_master_course/models/catalog.dart';

class CartModel {
  //catalog feilds
  late CatalogModel _catalog;

  //Collection of IDs - store IDs of each item
  final List<int> _itemIds = [];

  //get catalog - all catalog items that added to cart
  CatalogModel get catalog => _catalog;

  //set Catalog
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // Get Items in the cart - all items that are in cart
  List<Item> get item => _itemIds.map((id) => _catalog.getByID(id)).toList();

  // Get Total Price
  num get totalPrice =>
      item.fold(0, (total, currentValue) => total + currentValue.price);
//-> initail price is 0 then if 1 product price is 1000 than 0 + 1000 is 1000 and 1000 + 900 = 1900 and so on.

  // add item in cart
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // remove item from cart
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
