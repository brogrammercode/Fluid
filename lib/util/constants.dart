import 'package:flutter/material.dart';

const white2 = Color(0xfffbfcfa);
const blue = Color(0xff4a86f7);
const dark = Color(0xff040405);

theme() {
  return ThemeData(
    scaffoldBackgroundColor: white2,
    primaryColor: blue,
    canvasColor: blue,
    shadowColor: blue,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: blue),
  );
}

// to give some decoration to the text
TextStyle style(BuildContext context) {
  return TextStyle(
    fontFamily: 'Poppins',
    fontSize: kPad(context) * 0.035,
    color: dark,
  );
}

// this widget is for the media query responsiveness...
double kPad(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
