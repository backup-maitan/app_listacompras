import 'package:app_notes/android/views/product-stock/components/body.dart';
import 'package:flutter/material.dart';
import 'package:app_notes/android/widgets/icon_btn_with_counter.dart';
import 'package:get/get.dart';
import 'package:app_notes/android/views/cart/cart.view.dart';
import 'package:app_notes/controllers/shopping-cart.controller.dart';

class ProductStockView extends StatelessWidget {
  final ShoppingCartController shoppingCartController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.orange,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 10,
                color: Color(0xFF000000).withOpacity(0.15),
              )
            ],
          ),
        ),
        title: Column(
          children: [
            Text(
              "Meu Estoque",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Muli'),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => IconBtnWithCounter(
                svgSrc: "assets/icons/Plus Icon.svg",
                numOfItems: shoppingCartController.quantityItems,
                press: () {
                  // Get.to(CartView());
                },
              ),
            ),
          )
        ],
      ),
      body: Body(),
    );
  }
}
