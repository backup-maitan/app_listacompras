class CreateProductDTO {
  int id;
  String name;
  int quantity;
  int userId;

  CreateProductDTO({this.id, this.name, this.quantity, this.userId});

  CreateProductDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['userId'] = this.userId;
    return data;
  }
}
