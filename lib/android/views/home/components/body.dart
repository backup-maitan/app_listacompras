import 'package:app_notes/controllers/product.controller.dart';
import 'package:app_notes/controllers/shopping-cart.controller.dart';
import 'package:app_notes/utils/constantes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_notes/android/widgets/icon_btn_with_counter.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final ShoppingCartController shoppingCartController =
      Get.put(ShoppingCartController());
  @override
  Widget build(BuildContext context) {
    return GetX(
      init: productController,
      initState: (_) async {
        await productController.listar();
        await shoppingCartController.getItems();
      },
      builder: (_) {
        return Container(
          decoration: BoxDecoration(
            gradient: kPrimaryGradientColor,
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Olá, Ricardo",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                        IconBtnWithCounter(
                          svgSrc: "assets/icons/User.svg",
                          numOfItems: 0,
                          press: () {
                            Get.toNamed('/profile');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Text(
                    "Escolha uma opção.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      // CardDashboardMenuItem(
                      //   menuTitle: "Minhas Listas",
                      //   menuSubTitle: "3 Items",
                      //   svgSrc: "assets/icons/lista-de-controle.svg",
                      // ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/product-stock');
                        },
                        child: CardDashboardMenuItem(
                          menuTitle: "Meu Estoque",
                          menuSubTitle: "99+ Items",
                          svgSrc: "assets/icons/packages.svg",
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed('/carrinho');
                        },
                        child: CardDashboardMenuItem(
                          menuTitle: "Carrinho de Compras",
                          menuSubTitle:
                              "${shoppingCartController.quantityItems} items",
                          svgSrc: "assets/icons/carrinho-carrinho.svg",
                        ),
                      ),
                    ],
                  ),
                ),
                // Expanded(
                //   child: Container(
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Center(
                //         child: Image.asset("assets/images/splash_1.png"),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        );
      },
    );
  }
}

class CardDashboardMenuItem extends StatelessWidget {
  String menuTitle;
  String menuSubTitle;
  String svgSrc;

  CardDashboardMenuItem({
    Key key,
    this.menuTitle,
    this.menuSubTitle,
    this.svgSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            // color: Colors.white,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 10,
                  color: Color(0xFF000000).withOpacity(0.15),
                )
              ],
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        SvgPicture.asset(
                          svgSrc,
                          width: 52.0,
                          height: 52.0,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              menuTitle,
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            if (this.menuSubTitle != null)
                              Text(
                                this.menuSubTitle,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset("assets/icons/arrow_right.svg"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
