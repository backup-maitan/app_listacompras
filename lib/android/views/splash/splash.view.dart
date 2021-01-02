import 'package:app_notes/controllers/auth.controller.dart';
import 'package:app_notes/utils/constantes.dart';
import 'package:app_notes/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<AuthController>(
      init: authController,
      initState: (_) {
        authController.checkIsLogged();
      },
      builder: (controller) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: kPrimaryGradientColor
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Lista de Compras",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                  Icon(
                    Icons.shopping_cart,
                    size: 72,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
