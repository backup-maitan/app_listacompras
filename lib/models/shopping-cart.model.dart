import 'package:app_notes/models/shopping-cart-items.model.dart';

class ShoppingLists {
  int? id;
  String? name;
  String? image;
  List<ShoppingListsItems>? shoppingListsItems;
  int? numOfItems;

  ShoppingLists({
    this.id,
    this.name,
    this.shoppingListsItems,
    this.numOfItems = 0,
  });

  ShoppingLists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    if (json['shoppingListsItems'] != null) {
      shoppingListsItems = new List<ShoppingListsItems>.empty();
      json['shoppingCartsItems'].forEach((v) {
        shoppingListsItems!.add(new ShoppingListsItems.fromJson(v));
      });
    }
    numOfItems = json['numOfItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    if (this.shoppingListsItems != null) {
      data['shoppingListsItems'] =
          this.shoppingListsItems!.map((v) => v.toJson()).toList();
    }
    data['numOfItems'] = this.numOfItems;
    return data;
  }
}
