import 'dart:async';

import 'package:app_notes/models/shopping-cart-items.model.dart';
import 'package:app_notes/models/shopping-cart.model.dart';
import 'package:app_notes/repositories/api.repository.dart';
import 'package:dio/dio.dart';

class ShoppingCartRepository {
  ApiRepository repository = ApiRepository();

  Future<bool> adicionar(params) async {
    var response = await (repository.post(
        endpoint: 'shopping-lists',
        body: params) as FutureOr<Response<dynamic>>);
    if (response.statusCode != 201) return false;
    return true;
    // return ApiResponse.fromJson(response.data);
  }

  Future<bool> addItemToCart(params) async {
    var response = await repository.post(
        endpoint: 'shopping-lists/add-item', body: params);
    if (response?.statusCode != 201) return false;
    print(response);
    return true;
    // return ApiResponse.fromJson(response.data);
  }

  Future<bool> checkOut(params) async {
    var response = await repository.post(
        endpoint: 'shopping-lists/check-out', body: params);
    if (response?.statusCode != 201) return false;
    print(response);
    return true;
    // return ApiResponse.fromJson(response.data);
  }

  Future<List<ShoppingLists>> listar({Map<String, dynamic>? query}) async {
    List<ShoppingLists> shoppingCarts = [];
    var response =
        await repository.get(endpoint: 'shopping-lists', parameters: query);

    if (response != null && response.statusCode == 200)
      for (var item in (response.data as List)) {
        var shoppingCart = ShoppingLists.fromJson(item);
        shoppingCarts.add(shoppingCart);
      }

    return shoppingCarts;
  }

  Future<List<ShoppingListsItems>> getCartItems(int? shoppingListId) async {
    List<ShoppingListsItems> shoppingCartsItems = [];
    var response = await repository
        .get(endpoint: 'shopping-lists/items/$shoppingListId', parameters: {});

    if (response != null && response.statusCode == 200)
      for (var item in (response.data as List)) {
        var shoppingCart = ShoppingListsItems.fromJson(item);
        shoppingCartsItems.add(shoppingCart);
      }

    return shoppingCartsItems;
  }
}
