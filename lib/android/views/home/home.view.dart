import 'package:app_notes/android/views/home/components/body.dart';
import 'package:app_notes/controllers/product.controller.dart';
import 'package:app_notes/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
            actions: [],
            automaticallyImplyLeading: false,
            title: Text("Olá, Ladislayne"),
          ),*/
      body: Body(),
    );
  }
}
