import 'package:app_notes/utils/constantes.dart';
import 'package:app_notes/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddVoucher extends StatelessWidget {
  const AddVoucher({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          height: getProportionateScreenWidth(40),
          width: getProportionateScreenWidth(40),
          decoration: BoxDecoration(
              color: Color(0xFFF5F6F9),
              borderRadius: BorderRadius.circular(10)),
          child: SvgPicture.asset("assets/icons/receipt.svg"),
        ),
        Spacer(),
        Text("Adicionar cupom de desconto"),
        const SizedBox(
          width: 10,
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: 12,
          color: kTextColor,
        )
      ],
    );
  }
}