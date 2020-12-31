import 'package:app_notes/android/views/cart/cart.view.dart';
import 'package:app_notes/android/views/cart/components/cart_item_card.dart';
import 'package:app_notes/android/widgets/default_button.widget.dart';
import 'package:app_notes/android/widgets/icon_btn_with_counter.dart';
import 'package:app_notes/controllers/product.controller.dart';
import 'package:app_notes/controllers/shopping-cart.controller.dart';
import 'package:app_notes/dto/add-item-cart.dto.dart';
import 'package:app_notes/models/product.model.dart';
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
    return GetX<ProductController>(
      init: productController,
      initState: (_) {
        productController.listar();
        shoppingCartController.getCartItems(1);
      },
      builder: (_) {
        return SafeArea(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: SizeConfig.screenWidth * 0.6,
                        height: 50,
                        decoration: BoxDecoration(
                          color: kSecondaryColor.withOpacity(0.1),
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
                              horizontal: getProportionateScreenWidth(20),
                              vertical: getProportionateScreenWidth(9),
                            ),
                          ),
                        ),
                      ),
                      IconBtnWithCounter(
                        svgSrc: "assets/icons/Cart Icon.svg",
                        numOfItems: shoppingCartController.quantityItems,
                        press: () {
                          Get.to(CartView());
                        },
                      ),
                      IconBtnWithCounter(
                        svgSrc: "assets/icons/User.svg",
                        numOfItems: 0,
                        press: () {},
                      )
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                      child: Text(
                        "Estoque de produtos",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: getProportionateScreenWidth(18),
                        ),
                      ),
                    )
                  ],
                ),
                productController.carregando.value
                    ? Center(
                        child: Text("Carregando"),
                      )
                    : Expanded(
                        child: RefreshIndicator(
                          onRefresh: () async {
                            await productController.listar();
                            await shoppingCartController.getCartItems(1);
                          },
                          color: Colors.black,
                          child: ListView.separated(
                            separatorBuilder: (context, index) => Divider(
                              color: Colors.grey,
                              height: getProportionateScreenWidth(1),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(10)),
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Dismissible(
                                direction: DismissDirection.endToStart,
                                key: Key(productController.products[index].id
                                    .toString()),
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
                                child: ListTile(
                                  // leading: Container(
                                  //   width: getProportionateScreenWidth(40),
                                  //   height: getProportionateScreenWidth(40),
                                  //   // child: ClipRRect(
                                  //   //   borderRadius: BorderRadius.circular(20.0),
                                  //   //   child: Image.network(
                                  //   //     productController.products[index].image,
                                  //   //     height: 40.0,
                                  //   //     width: 40.0,
                                  //   //   ),
                                  //   // ),
                                  //   decoration: BoxDecoration(
                                  //     color: kSecondaryColor.withOpacity(0.3),
                                  //     shape: BoxShape.circle,
                                  //   ),
                                  // ),
                                  trailing: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            // showAlertDialog(context);
                                            shoppingCartController.addItemToCart(
                                              AddItemToCartDTO(
                                                  productId: productController
                                                      .products[index].id,
                                                  shoppingCartId: 1,
                                                  quantity: 1),
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
                                      ],
                                    ),
                                  ),
                                  title: Text(
                                      productController.products[index].name),
                                ),
                              ),
                            ),
                            itemCount: productController.products.length,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
