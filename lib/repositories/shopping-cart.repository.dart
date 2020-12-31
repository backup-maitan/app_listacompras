import 'package:app_notes/dto/add-item-cart.dto.dart';
import 'package:app_notes/dto/get-cart-items.dto.dart';
import 'package:app_notes/models/shopping-cart-items.model.dart';
import 'package:app_notes/models/shopping-cart.model.dart';
import 'package:app_notes/repositories/api.repository.dart';

class ShoppingCartRepository {
  ApiRepository repository = ApiRepository();

  Future<bool> adicionar(params) async {
    var response = await repository.post(endpoint: 'shopping-carts', body: params);
    if (response.statusCode != 201) return false;
    return true;
    // return ApiResponse.fromJson(response.data);
  }

  Future<bool> addItemToCart(params) async {
    var response = await repository.post(endpoint: 'shopping-carts/add-item', body: params);
    if (response.statusCode != 201) return false;
    print(response);
    return true;
    // return ApiResponse.fromJson(response.data);
  }

  Future<List<ShoppingCart>> listar({Map<String, dynamic> query}) async {
    List<ShoppingCart> shoppingCarts = [];
    var response =
    await repository.get(endpoint: 'shopping-carts', parameters: query);

    if (response != null && response.statusCode == 200)
      for (var item in (response.data as List)) {
        var shoppingCart = ShoppingCart.fromJson(item);
        shoppingCarts.add(shoppingCart);
      }

    return shoppingCarts;
  }

  Future<List<ShoppingCartItems>> getCartItems(int shoppingCartId) async {
    List<ShoppingCartItems> shoppingCartsItems = [];
    var response = await repository.get(endpoint: 'shopping-carts/cart-items/$shoppingCartId', parameters: {});

    if (response != null && response.statusCode == 200)
      for (var item in (response.data as List)) {
        var shoppingCart = ShoppingCartItems.fromJson(item);
        shoppingCartsItems.add(shoppingCart);
      }

    return shoppingCartsItems;
  }

}
