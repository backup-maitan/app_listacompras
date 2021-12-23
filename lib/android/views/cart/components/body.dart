import 'package:app_notes/android/views/cart/components/cart_item_card.dart';
import 'package:app_notes/controllers/shopping-cart.controller.dart';
import 'package:app_notes/dto/add-item-cart.dto.dart';
import 'package:app_notes/models/product.model.dart';
import 'package:app_notes/utils/constantes.dart';
import 'package:app_notes/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  final ShoppingCartController shoppingCartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemBuilder: (context, index) {
          var product = shoppingCartController.shoppingCartItems[index].product!;
          var quantity =
              shoppingCartController.shoppingCartItems[index].quantity;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Dismissible(
              direction: DismissDirection.endToStart,
              key: Key(product.id.toString()),
              background: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Color(0xFFFFE6E6),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Spacer(),
                    SvgPicture.asset("assets/icons/Trash.svg")
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CartItemCard(
                    cart: Product(
                      id: product.id,
                      name: product.name,
                      image: product.image,
                    ),
                    quantity: quantity,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            shoppingCartController.addItemToCart(
                              AddItemToCartDTO(
                                  productId: product.id,
                                  quantity: shoppingCartController
                                          .shoppingCartItems[index].quantity! +
                                      1),
                            );
                          },
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            width: getProportionateScreenWidth(32),
                            height: getProportionateScreenWidth(32),
                            child: Icon(Icons.add),
                            decoration: BoxDecoration(
                              color: kSecondaryColor.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenHeight(10),
                        ),
                        InkWell(
                          onTap: () {
                            shoppingCartController.addItemToCart(
                              AddItemToCartDTO(
                                  productId: product.id,
                                  quantity: shoppingCartController
                                          .shoppingCartItems[index].quantity! -
                                      1),
                            );
                          },
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            width: getProportionateScreenWidth(32),
                            height: getProportionateScreenWidth(32),
                            child: Icon(Icons.remove),
                            decoration: BoxDecoration(
                              color: kSecondaryColor.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: shoppingCartController.shoppingCartItems.length,
      ),
    );
  }
}
