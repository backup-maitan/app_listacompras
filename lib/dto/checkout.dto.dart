class CheckoutDTO {
  int? shoppingListId;

  CheckoutDTO({
    this.shoppingListId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shoppingListId'] = this.shoppingListId;
    return data;
  }
}
