import 'package:app_notes/dto/add-item-cart.dto.dart';
import 'package:app_notes/dto/checkout.dto.dart';
import 'package:app_notes/models/shopping-cart-items.model.dart';
import 'package:app_notes/models/shopping-cart.model.dart';
import 'package:app_notes/repositories/shopping-cart.repository.dart';
import 'package:app_notes/repositories/storage.repository.dart';
import 'package:app_notes/utils/util.dart';
import 'package:get/get.dart';

class ShoppingCartController extends GetxController {
  ShoppingCartRepository shoppingCartRepository = ShoppingCartRepository();
  StorageRepository storageRepository = StorageRepository();

  RxBool carregando = true.obs;

  Rx<ShoppingLists> shoppingList = ShoppingLists().obs;
  RxList<ShoppingLists> shoppingLists = List<ShoppingLists>.empty().obs;
  RxList<ShoppingListsItems> shoppingCartItems = List<ShoppingListsItems>.empty().obs;

  int get quantityItems {
    return carregando.value ? 0 : shoppingCartItems.length;
  }

  int get unity {
    return shoppingCartItems.fold(
        0, (prevValue, element) => prevValue + element.quantity!);
  }

  // listar() async {
  //   shoppingLists.assignAll(await shoppingCartRepository.listar());
  //   carregando.value = false;
  //   print(carregando);
  // }

  // add(ShoppingLists shoppingLists) async {
  //   var response =
  //       await shoppingCartRepository.adicionar(shoppingLists.toJson());
  //   if (response) listar();
  // }

  Future<ShoppingLists> firstShoppingLists() async {
    var shoppingLists = await storageRepository.getShoppingLists();
    return shoppingLists.length > 0 ? shoppingLists.first : new ShoppingLists();
  }

  getItems() async {
    var shoppingList = await firstShoppingLists();
    this.carregando.value = true;
    shoppingCartItems
        .assignAll(await shoppingCartRepository.getCartItems(shoppingList.id));

    this.carregando.value = false;
  }

  getItemWithOutLoader() async {
    var shoppingList = await firstShoppingLists();
    shoppingCartItems
        .assignAll(await shoppingCartRepository.getCartItems(shoppingList.id));
  }

  addItemToCart(AddItemToCartDTO addItemToCartDTO) async {
    var shoppingList = await firstShoppingLists();
    addItemToCartDTO.shoppingListId = shoppingList.id;

    print(addItemToCartDTO);

    var response =
        await shoppingCartRepository.addItemToCart(addItemToCartDTO.toJson());
    if (response) {
      getItemWithOutLoader();
      // exibirSnack('Sucesso', 'Item adicionado ao carrinho');
    }
  }

  checkOut() async {
    var shoppingList = await firstShoppingLists();
    var response = await shoppingCartRepository
        .checkOut(CheckoutDTO(shoppingListId: shoppingList.id));
    if (response) {
      carregando.value = true;
      exibirSnack('Sucesso', 'Compra finalizada.');
      await Future.delayed(Duration(seconds: 3));
      Get.offNamed('/product-stock');
    }
  }
}
