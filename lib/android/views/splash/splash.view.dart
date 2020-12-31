import 'package:app_notes/controllers/auth.controller.dart';
import 'package:app_notes/utils/constantes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
      init: authController,
      initState: (_) async {
        await authController.checkIsLogged();
      },
      builder: (_) {
        return Container(
          color: kPrimaryColor,
          child: Center(
              child: Text(
            "Aguarde...",
          )),
        );
      },
    );
  }
}
