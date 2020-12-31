import 'package:app_notes/models/product.model.dart';
import 'package:flutter/cupertino.dart';

class ShoppingCartItems {
  int id;
  int quantity;
  Product product;

  ShoppingCartItems({
    this.id,
    this.product,
    this.quantity,
  });

  ShoppingCartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    // user_id = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    return data;
  }
}
