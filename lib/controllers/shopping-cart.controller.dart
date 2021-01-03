import 'dart:convert';

import 'package:app_notes/dto/add-item-cart.dto.dart';
import 'package:app_notes/models/shopping-cart-items.model.dart';
import 'package:app_notes/models/shopping-cart.model.dart';
import 'package:app_notes/repositories/auth.repository.dart';
import 'package:app_notes/repositories/shopping-cart.repository.dart';
import 'package:app_notes/repositories/user.repository.dart';
import 'package:get/get.dart';

class ShoppingCartController extends GetxController {
  ShoppingCartRepository shoppingCartRepository = ShoppingCartRepository();
  AutenticacaoRepository authRepository = AutenticacaoRepository();

  RxBool carregando = true.obs;

  Rx<ShoppingLists> shoppingList = ShoppingLists().obs;
  RxList<ShoppingLists> shoppingLists = List<ShoppingLists>().obs;
  RxList<ShoppingListsItems> shoppingCartItems = List<ShoppingListsItems>().obs;

  int get quantityItems {
    return carregando.value ? 0 : shoppingCartItems.length;
  }

  int get unity {
    return shoppingCartItems.fold(
        0, (prevValue, element) => prevValue + element.quantity);
  }

  listar() async {
    shoppingLists.assignAll(await shoppingCartRepository.listar());
    carregando.value = false;
    print(carregando);
  }

  getCartItems() async {
    var shoppingList = await authRepository.getFirstShoppingLists();
    shoppingCartItems
        .assignAll(await shoppingCartRepository.getCartItems(shoppingList.id));
    carregando.value = false;
  }

  add(ShoppingLists shoppingLists) async {
    var response =
        await shoppingCartRepository.adicionar(shoppingLists.toJson());
    if (response) listar();
  }

  addItemToCart(AddItemToCartDTO addItemToCartDTO) async {
    var shoppingList = await authRepository.getFirstShoppingLists();
    addItemToCartDTO.shoppingListId = shoppingList.id;

    var response =
        await shoppingCartRepository.addItemToCart(addItemToCartDTO.toJson());
    if (response) {
      getCartItems();
      // exibirSnack('Sucesso', 'Item adicionado ao carrinho');
    }
  }
}
