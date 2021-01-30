import 'package:app_notes/controllers/auth.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: FlatButton(
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Color(0xFFF5F6F9),
            onPressed: () {},
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/User.svg",
                  width: 22,
                  color: Colors.orange,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    "Minha Conta",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: FlatButton(
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Color(0xFFF5F6F9),
            onPressed: () {},
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/Cart Icon.svg",
                  width: 22,
                  color: Colors.orange,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    "Minhas compras",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: FlatButton(
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Color(0xFFF5F6F9),
            onPressed: () async {
              await authController.logOut();
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/Log out.svg",
                  width: 22,
                  color: Colors.orange,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    "Sair",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
