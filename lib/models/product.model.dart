class Product {
  int id;
  String name;
  int quantity;
  String image;

  // int user_id;

  Product({this.id, this.name, this.quantity, this.image});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['image'] = this.image;
    return data;
  }
}
