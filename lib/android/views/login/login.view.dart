import 'package:app_notes/controllers/auth.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class LoginView extends StatelessWidget {
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: authController,
      initState: (_) async {
        await authController.checkIsLogged();
      },
      builder: (_) {
        return Scaffold(
          appBar: AppBar(),
          body: Body(),
        );
      },
    );
  }
}
