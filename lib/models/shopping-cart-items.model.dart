import 'package:app_notes/models/product.model.dart';

class ShoppingListsItems {
  int? id;
  int? quantity;
  Product? product;

  ShoppingListsItems({
    this.id,
    this.product,
    this.quantity,
  });

  ShoppingListsItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}
