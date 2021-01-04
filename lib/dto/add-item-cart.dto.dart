class AddItemToCartDTO {
  int productId;
  int shoppingListId;
  int quantity;

  AddItemToCartDTO({
    this.productId,
    this.shoppingListId,
    this.quantity,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['shoppingListId'] = this.shoppingListId;
    data['quantity'] = this.quantity;
    return data;
  }
}
