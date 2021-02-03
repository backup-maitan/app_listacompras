import 'package:app_notes/android/views/product-stock/components/body.dart';
import 'package:flutter/material.dart';
import 'package:app_notes/android/widgets/icon_btn_with_counter.dart';
import 'package:get/get.dart';
import 'package:app_notes/controllers/shopping-cart.controller.dart';
import 'package:app_notes/controllers/product.controller.dart';
import 'package:app_notes/controllers/storage.controller.dart';
import 'package:app_notes/android/widgets/default_button.widget.dart';
import 'package:app_notes/utils/size_config.dart';
import 'package:app_notes/dto/create-product.dto.dart';
import 'package:app_notes/utils/util.dart';

class ProductStockView extends StatelessWidget {
  final ShoppingCartController shoppingCartController = Get.find();
  final ProductController productController = Get.find();
  final StorageController storageController = Get.find();

  TextEditingController name = TextEditingController();
  TextEditingController quantity = TextEditingController();

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            height: 400,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Criar Produto",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Muli'),
                  ),
                  Column(
                    children: [
                      SizedBox(height: getProportionateScreenHeight(30)),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {},
                        controller: name,
                        decoration: InputDecoration(
                          labelText: "Nome do Produto",
                          hintText: "Ex: Arroz, Feijão",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          // suffixIcon: CustomSuffixIcon(
                          //   svgIcon: "assets/icons/User.svg",
                          // ),
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {},
                        controller: quantity,
                        decoration: InputDecoration(
                          labelText: "Quantidade",
                          hintText: "Informe a quantidade",
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          // suffixIcon: CustomSuffixIcon(
                          //   svgIcon: "assets/icons/User.svg",
                          // ),
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(30)),
                      DefaultButton(
                        text: "Salvar",
                        press: () async {
                          var storage = await storageController.getDataUser();
                          var result = await this.productController.add(
                                new CreateProductDTO(
                                  userId: storage.user.id,
                                  name: name.text,
                                  quantity: int.parse(quantity.text),
                                ),
                              );
                          Navigator.pop(context);
                          result
                              ? exibirSnack(
                                  "Sucesso", "Produto adicionado no estoque.")
                              : exibirSnack("Ops, algo aconteceu.",
                                  "Produto não adicionado no estoque.");
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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
            child: IconBtnWithCounter(
              svgSrc: "assets/icons/Plus Icon.svg",
              numOfItems: shoppingCartController.quantityItems,
              press: () {
                // Get.to(CartView());
                // Get.to(CreateProductView());
                this.showAlertDialog(context);
              },
            ),
          )
        ],
      ),
      body: Body(),
    );
  }
}
