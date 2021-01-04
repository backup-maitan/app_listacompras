import 'dart:convert';
import 'package:app_notes/dto/storage.dto.dart';
import 'package:app_notes/models/shopping-cart.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  read(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (!sharedPreferences.containsKey(key)) return null;
    return json.decode(sharedPreferences.getString(key));
  }

  save({String key, value}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, json.encode(value));
  }

  remove(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }

  setDataUser({String value}) async {
    return await save(key: 'dataUser', value: value);
  }

  Future<List<ShoppingLists>> getShoppingLists() async {
    var dataUser = await read('dataUser');
    var shoppingLists = new List<ShoppingLists>();
    if (dataUser['shoppingLists'] != null) {
      dataUser['shoppingLists'].forEach((v) {
        shoppingLists.add(new ShoppingLists.fromJson(v));
      });
    }
    return shoppingLists;
  }

  Future<bool> getIsLogged() async {
    var user = await getDataUser();
    return user.isLogged;
  }

  Future<StorageDTO> getDataUser() async {
    var user = await read('dataUser');
    print(user);
    user = StorageDTO.fromJson(user);
    return user;
  }
}
