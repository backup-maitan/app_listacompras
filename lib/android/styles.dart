import 'package:flutter/material.dart';

const brightness = Brightness.light;
// const primaryColor = basePrimaryColor;
// const accentColor = baseAccentColor;

ThemeData androidTheme() {
  return ThemeData(
    brightness: brightness,
    textTheme: new TextTheme(
        // button: TextStyle(
        //   fontFamily: "Poppins",
        // ),
        // caption: TextStyle(
        //   fontFamily: "Poppins",
        // ),
        // overline: TextStyle(
        //   fontFamily: "Poppins",
        // ),
        ),
    // primaryColor: primaryColor,
    // accentColor: accentColor,
  );
}
