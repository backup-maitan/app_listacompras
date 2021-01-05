import 'package:app_notes/android/widgets/custom-suffix-icon.widget.dart';
import 'package:app_notes/android/widgets/default_button.widget.dart';
import 'package:app_notes/controllers/auth.controller.dart';
import 'package:app_notes/utils/constantes.dart';
import 'package:app_notes/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Registrar",
                style: headingStyle,
              ),
              Text(
                "Preencha o formulario para criar uma conta.",
                textAlign: TextAlign.center,
              ),
              RegisterForm()
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return GetBuilder(
      builder: (_) {
        return Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(30)),
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {},
              controller: name,
              decoration: InputDecoration(
                labelText: "Nome completo",
                hintText: "Digite seu nome completo",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSuffixIcon(
                  svgIcon: "assets/icons/User.svg",
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildConfirmPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            // Container(
            //   height: 200,
            //   child: FormError(),
            // ),
            SizedBox(height: getProportionateScreenHeight(30)),
            DefaultButton(
              text: "Continuar",
              press: () async {
                await authController.register(
                  name: name.text,
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

  TextField buildConfirmPasswordFormField() {
    return TextField(
      obscureText: true,
      onChanged: (value) {},
      controller: confirmPassword,
      decoration: InputDecoration(
        labelText: "Senha",
        hintText: "Confirme a senha",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
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
        hintText: "Digite uma senha",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Lock.svg",
        ),
      ),
    );
  }

  TextField buildEmailFormField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {},
      controller: email,
      decoration: InputDecoration(
        labelText: "E-mail",
        hintText: "Digite seu melhor e-mail",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgIcon: "assets/icons/Mail.svg",
        ),
      ),
    );
  }
}
