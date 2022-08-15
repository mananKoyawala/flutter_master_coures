class CatalogModel {
  //we add this product list to catalog class as static so we can easily direct access this products by CatalogModel.items[index]
  static List<Item> items = [
    //this array -> list it's only for static then after we load from json file
    Item(
        id: 1,
        name: "iPhone 12 Pro",
        desc: "Apple iPhone 12th generation",
        price: 999,
        color: "#33505a",
        image:
            "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-pro-blue-hero?wid=940&hei=1112&fmt=png-alpha&qlt=80&.v=1604021661000")
  ];
}

class Item {
  //this feilds are here for app's items
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;
//default Constructor
  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image}); //here all {} indicates it's named constructor
  //and required indicates feild must be required not null
  //named Constructor

  factory Item.fromMap(Map<String, dynamic> map) {
    //it is decode map to string
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        image: map["image"]);
  }

  //from class to map
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image
      };
}
