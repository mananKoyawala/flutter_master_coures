class CatalogModel {
  //we add this product list to catalog class as static so we can easily direct access this products by CatalogModel.items[index]
  static List<Item> items = [];
  //this array -> list it's only for static then after we load from json file

  //get Item by their id when we make cart
  static Item getByID(int id) => items.firstWhere(
        (element) => element.id == id,
        // orElse:null
      ); //this function get item that we provide id and then check first matches from list

  //get Item by their position in list to make cart
  static Item getByPosition(int pos) => items[pos];
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
