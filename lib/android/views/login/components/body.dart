import 'package:app_notes/android/widgets/custom-suffix-icon.widget.dart';
import 'package:app_notes/android/widgets/default_button.widget.dart';
import 'package:app_notes/controllers/auth.controller.dart';
import 'package:app_notes/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Bem vindo",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Entre com email e senha",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getProportionateScreenWidth(28),
              ),
              LoginForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              NoAccountText()
            ],
          ),
        ),
      ),
    );
  }
}

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Não tem uma conta? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Get.toNamed('/register'),
          child: Text(
            "Criar conta",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: Colors.orange),
          ),
        ),
      ],
    );
  }
}

class LoginForm extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GetBuilder(
      builder: (_) {
        return Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            // Container(
            //   height: 200,
            //   child: FormError(),
            // ),
            SizedBox(height: getProportionateScreenHeight(30)),
            DefaultButton(
              text: "Continuar",
              press: () async {
                await authController.authenticate(
                  email: email.text,
                  password: pass.text,
                );
              },
            )
          ],
        );
      },
    );
  }

  TextField buildEmailFormField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {},
      controller: email,
      decoration: InputDecoration(
        labelText: "E-mail",
        hintText: "Entre com e-mail",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Mail.svg",
        ),
      ),
    );
  }

  TextField buildPasswordFormField() {
    return TextField(
      obscureText: true,
      onChanged: (value) {},
      controller: pass,
      decoration: InputDecoration(
        labelText: "Senha",
        hintText: "Entre com a senha",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }
}

// class FormError extends StatelessWidget {
//   const FormError({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // final AuthController authController = Get.put(AuthController());
//     SizeConfig().init(context);
//     return GetBuilder<AuthController>(
//       init: AuthController(),
//       builder: (controller) {
//         return Obx(
//           () => ListView.builder(
//               itemCount: controller.errors.length,
//               itemBuilder: (ctx, index) {
//                 return Text(controller.errors[index].message);
//               }),
//         );
//       },
//     );
//   }

//   Row formErrorText({String error}) {
//     print(error);
//     return Row(
//       children: [
//         SvgPicture.asset(
//           "assets/icons/Error.svg",
//           height: getProportionateScreenWidth(14),
//           width: getProportionateScreenWidth(14),
//         ),
//         SizedBox(
//           width: getProportionateScreenWidth(10),
//         ),
//         Text(error),
//       ],
//     );
//   }
// }
