import 'package:app_notes/android/views/cart/components/body.dart';
import 'package:app_notes/android/widgets/default_button.widget.dart';
import 'package:app_notes/controllers/shopping-cart.controller.dart';
import 'package:app_notes/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  final ShoppingCartController shoppingCartController =
      Get.put(ShoppingCartController());

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: shoppingCartController,
      initState: (_) {
        shoppingCartController.getCartItems(1);
      },
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Column(
              children: [
                Text("Carrinho",
                    style: TextStyle(color: Colors.black, fontFamily: 'Muli')),
                Text("${shoppingCartController.shoppingCartItems.length} items",
                    style: Theme.of(context).textTheme.caption)
              ],
            ),
          ),
          body: !shoppingCartController.carregando.value
              ? Body()
              : Center(
                  child: Text("Carregando"),
                ),
          bottomNavigationBar: !shoppingCartController.carregando.value
              ? CheckOurCard(
                  totalItems: shoppingCartController.quantityItems,
                  totalQuantidade: shoppingCartController.unity,
                )
              : null,
        );
      },
    );
  }
}

class CheckOurCard extends StatelessWidget {
  const CheckOurCard({
    Key key,
    this.totalItems,
    this.totalQuantidade,
  }) : super(key: key);

  final int totalItems;
  final int totalQuantidade;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 124,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // AddVoucher(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(text: "Items: ", children: [
                        TextSpan(
                          text: "x$totalItems",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ]),
                    ),
                    Text.rich(
                      TextSpan(text: "Unidades: ", children: [
                        TextSpan(
                          text: "x$totalQuantidade",
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ]),
                    ),
                  ],
                ),
                SizedBox(
                  width: getProportionateScreenWidth(160),
                  child: DefaultButton(
                    text: "Finalizar",
                    press: () {},
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
