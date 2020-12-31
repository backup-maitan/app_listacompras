import 'package:app_notes/models/shopping-cart-items.model.dart';
import 'package:flutter/material.dart';

class ShoppingCart {
  int id;
  String name;
  String image;
  List<ShoppingCartItems> shoppingCartsItems;
  int numOfItems;

  ShoppingCart({
    @required this.id,
    @required this.name,
    this.shoppingCartsItems,
    this.numOfItems = 0,
  });


  ShoppingCart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    // shoppingCartsItems = json['shoppingCartsItems'];
    if (json['shoppingCartsItems'] != null) {
      shoppingCartsItems = new List<ShoppingCartItems>();
      json['shoppingCartsItems'].forEach((v) {
        shoppingCartsItems.add(new ShoppingCartItems.fromJson(v));
      });
    }
    numOfItems = json['numOfItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    // data['shoppingCartsItems'] = this.shoppingCartsItems;
    if (this.shoppingCartsItems != null) {
      data['shoppingCartsItems'] =
          this.shoppingCartsItems.map((v) => v.toJson()).toList();
    }
    data['numOfItems'] = this.numOfItems;
    return data;
  }
}
