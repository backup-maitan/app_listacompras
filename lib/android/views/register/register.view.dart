import 'package:app_notes/android/views/register/components/body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Criar Conta"),
      ),
      body: Body(),
    );
  }
}
