class Usuario {
  int id;
  String name;
  String email;
  String password;

  Usuario({this.id, this.name, this.email, this.password});

  Usuario.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['id'] = this.id;
    return data;
  }
}
