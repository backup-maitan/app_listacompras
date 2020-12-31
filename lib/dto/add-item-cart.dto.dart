import 'package:flutter/widgets.dart';

class AddItemToCartDTO {
  int productId;
  int shoppingCartId;
  int quantity;

  AddItemToCartDTO({
    this.productId,
    this.shoppingCartId,
    this.quantity,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['shoppingCartId'] = this.shoppingCartId;
    data['quantity'] = this.quantity;
    return data;
  }
}
