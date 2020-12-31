import 'package:app_notes/dto/add-item-cart.dto.dart';
import 'package:app_notes/dto/get-cart-items.dto.dart';
import 'package:app_notes/models/shopping-cart-items.model.dart';
import 'package:app_notes/models/shopping-cart.model.dart';
import 'package:app_notes/repositories/shopping-cart.repository.dart';
import 'package:app_notes/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCartController extends GetxController {
  ShoppingCartRepository shoppingCartRepository = ShoppingCartRepository();

  RxBool carregando = true.obs;

  Rx<ShoppingCart> shoppingCart = ShoppingCart().obs;
  RxList<ShoppingCart> shoppingCarts = List<ShoppingCart>().obs;
  RxList<ShoppingCartItems> shoppingCartItems = List<ShoppingCartItems>().obs;

  int get quantityItems {
    return carregando.value ? 0 : shoppingCartItems.length;
  }

  int get unity {
    return shoppingCartItems.fold(
        0, (prevValue, element) => prevValue + element.quantity);
  }

  listar() async {
    shoppingCarts.assignAll(await shoppingCartRepository.listar());
    carregando.value = false;
    print(carregando);
  }

  getCartItems(int shoppingCartId) async {
    shoppingCartItems.assignAll(await shoppingCartRepository.getCartItems(shoppingCartId));
    carregando.value = false;
  }

  add(ShoppingCart shoppingCart) async {
    var response =
        await shoppingCartRepository.adicionar(shoppingCart.toJson());
    if (response) listar();
  }

  addItemToCart(AddItemToCartDTO addItemToCartDTO) async {
    var response =
        await shoppingCartRepository.addItemToCart(addItemToCartDTO.toJson());
    if (response) {
      getCartItems(1);
      // exibirSnack('Sucesso', 'Item adicionado ao carrinho');
    }
  }
}
