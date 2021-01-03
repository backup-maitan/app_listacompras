import 'package:app_notes/android/views/home/components/body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black12,
      //   centerTitle: false,
      //   flexibleSpace: Container(
      //       decoration: BoxDecoration(
      //     gradient: kPrimaryGradientColor,
      //   )),
      //   title: Padding(
      //     padding: const EdgeInsets.all(2.0),
      //     child: Text(
      //       "Olá, Ladislayne",
      //       style: TextStyle(
      //         fontFamily: 'Muli',
      //         color: Colors.white,
      //         fontWeight: FontWeight.w600,
      //         fontSize: getProportionateScreenWidth(18),
      //       ),
      //     ),
      //   ),
      // ),
      body: Body(),
    );
  }
}
