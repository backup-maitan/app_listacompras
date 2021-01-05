import 'package:app_notes/android/views/profile/components/body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.orange,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 10,
                color: Color(0xFF000000).withOpacity(0.15),
              )
            ],
          ),
        ),
        title: Text(
          "Meu Perfil",
          style: TextStyle(color: Colors.white, fontFamily: 'Muli'),
        ),
      ),
      body: Body(),
    );
  }
}
