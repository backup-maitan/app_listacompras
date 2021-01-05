import 'package:app_notes/android/views/cart/cart.view.dart';
import 'package:app_notes/android/widgets/icon_btn_with_counter.dart';
import 'package:app_notes/android/widgets/loader.widget.dart';
import 'package:app_notes/controllers/product.controller.dart';
import 'package:app_notes/controllers/shopping-cart.controller.dart';
import 'package:app_notes/dto/add-item-cart.dto.dart';
import 'package:app_notes/utils/constantes.dart';
import 'package:app_notes/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final ShoppingCartController shoppingCartController =
      Get.put(ShoppingCartController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetX<ProductController>(
      init: productController,
      initState: (_) async {
        await productController.listar();
        await shoppingCartController.getItems();
      },
      builder: (_) {
        return Container(
          color: Colors.orange,
          child: SafeArea(
            child: Container(
              color: Color(0xFFF1F1F1),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 10,
                          color: Color(0xFF000000).withOpacity(0.15),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: getProportionateScreenWidth(20),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20),
                            vertical: getProportionateScreenWidth(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: SizeConfig.screenWidth * 0.6,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: kPrimaryLightColor,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextField(
                                  onChanged: (value) {},
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    hintText: "Buscar produto",
                                    prefixIcon: Icon(Icons.search),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenWidth(20),
                                      vertical: getProportionateScreenWidth(9),
                                    ),
                                  ),
                                ),
                              ),
                              IconBtnWithCounter(
                                svgSrc: "assets/icons/Cart Icon.svg",
                                numOfItems:
                                    shoppingCartController.quantityItems,
                                press: () {
                                  Get.to(CartView());
                                },
                              ),
                              IconBtnWithCounter(
                                svgSrc: "assets/icons/User.svg",
                                numOfItems: 0,
                                press: () {
                                  Get.toNamed('/profile');
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 4,
                                color: Color(0xFF000000).withOpacity(0.15),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/User.svg",
                                width: 22,
                                color: Colors.orange,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Estoque de Produtos",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 4,
                                color: Color(0xFF000000).withOpacity(0.15),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/User.svg",
                                width: 22,
                                color: Colors.orange,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Minhas Listas",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 5),
                                blurRadius: 4,
                                color: Color(0xFF000000).withOpacity(0.15),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/User.svg",
                                width: 22,
                                color: Colors.orange,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Produtos",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
