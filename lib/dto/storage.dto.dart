import 'package:app_notes/dto/jwt-payload.dart';
import 'package:app_notes/dto/storage-shopping-lists.dto.dart';
import 'package:app_notes/dto/storage-usuario.dto.dart';

class StorageDTO {
  bool? isLogged;
  StorageUsuarioDTO? user;
  JWTPayload? payload;
  List<StorageShoppingListsDTO>? shoppingLists;

  StorageDTO({
    this.isLogged,
    this.user,
    this.payload,
    this.shoppingLists,
  });

  StorageDTO.fromJson(Map<String, dynamic> json) {
    isLogged = json['isLogged'];
    user = json['user'] != null
        ? new StorageUsuarioDTO.fromJson(json['user'])
        : null;
    payload = json['payload'] != null
        ? new JWTPayload.fromJson(json['payload'])
        : null;
    if (json['shoppingLists'] != null) {
      shoppingLists = new List<StorageShoppingListsDTO>.empty();
      json['shoppingLists'].forEach((v) {
        shoppingLists!.add(new StorageShoppingListsDTO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isLogged'] = this.isLogged;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    if (this.shoppingLists != null) {
      data['shoppingLists'] =
          this.shoppingLists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
