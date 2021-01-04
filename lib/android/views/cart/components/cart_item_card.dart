import 'package:app_notes/models/product.model.dart';
import 'package:app_notes/utils/constantes.dart';
import 'package:app_notes/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    Key key,
    @required this.cart,
    this.quantity,
  }) : super(key: key);

  final Product cart;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(50),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: cart.image != null
                  ? Image.network(cart.image)
                  : SvgPicture.asset(
                      "assets/icons/no-photo.svg",
                      color: Colors.grey,
                    ),
              width: 20,
              height: 20,
            ),
          ),
        ),
        SizedBox(
          width: getProportionateScreenWidth(15),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.name,
              style: TextStyle(fontSize: 16, color: Colors.black),
              maxLines: 2,
            ),
            const SizedBox(height: 5),
            Text.rich(
              TextSpan(
                text: "x$quantity",
                style: TextStyle(fontSize: 14, color: kPrimaryColor),
              ),
            ),
          ],
        )
      ],
    );
  }
}
