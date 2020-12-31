class GetCartItemsDTO {
  String shoppingCartItemCreatedAt;
  String shoppingCartItemUpdatedAt;
  Null shoppingCartItemDeletedAt;
  int shoppingCartItemId;
  int shoppingCartItemProductId;
  int shoppingCartItemShoppingCartId;
  int productId;
  String productName;
  String productImage;
  String quantity;

  GetCartItemsDTO({this.shoppingCartItemCreatedAt,
    this.shoppingCartItemUpdatedAt,
    this.shoppingCartItemDeletedAt,
    this.shoppingCartItemId,
    this.shoppingCartItemProductId,
    this.shoppingCartItemShoppingCartId,
    this.productId,
    this.productName,
    this.productImage,
    this.quantity});

  GetCartItemsDTO.fromJson(Map<String, dynamic> json) {
    shoppingCartItemCreatedAt = json['shoppingCartItem_created_at'];
    shoppingCartItemUpdatedAt = json['shoppingCartItem_updated_at'];
    shoppingCartItemDeletedAt = json['shoppingCartItem_deleted_at'];
    shoppingCartItemId = json['shoppingCartItem_id'];
    shoppingCartItemProductId = json['shoppingCartItem_productId'];
    shoppingCartItemShoppingCartId = json['shoppingCartItem_shoppingCartId'];
    productId = json['product_id'];
    productName = json['product_name'];
    productImage = json['product_image'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shoppingCartItem_created_at'] = this.shoppingCartItemCreatedAt;
    data['shoppingCartItem_updated_at'] = this.shoppingCartItemUpdatedAt;
    data['shoppingCartItem_deleted_at'] = this.shoppingCartItemDeletedAt;
    data['shoppingCartItem_id'] = this.shoppingCartItemId;
    data['shoppingCartItem_productId'] = this.shoppingCartItemProductId;
    data['shoppingCartItem_shoppingCartId'] =
        this.shoppingCartItemShoppingCartId;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
    data['quantity'] = this.quantity;
    return data;
  }
}