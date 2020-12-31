import 'package:flutter/material.dart';
import 'package:get/get.dart';

exibirSnack(String titulo, String mensagem) {
  // if (!Get.isSnackbarOpen)
    Get.snackbar(titulo, mensagem,
        isDismissible: true,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 5,
        margin: EdgeInsets.all(15),
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: Colors.black,
        duration: Duration(seconds: 3),
        colorText: Colors.white,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        animationDuration: Duration(
          milliseconds: 300,
        ));
}
