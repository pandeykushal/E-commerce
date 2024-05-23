import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color(0XFFFFFFFF);
  static const Color white = Color(0XFFFFFFFF);
  static const Color primary1 = Color(0xFF000000);
  static const Color black = Color(0xFF101010);
  static const Color red = Color(0xFFD70909);
  static const Color darkGray = Color(0XFFA9A9A9);
  static const Color lightgray = Color(0XFFE7E7E7);
  static const Color darkCharcoal = Color(0XFF2F2E2E);
  static const Color pink = Color(0XFFFF4C5E);
  static const Color gray = Color(0XFFF3F3F3);
}

double sizeHeight(BuildContext context) {
  var sizeHeight = MediaQuery.of(context).size.height;
  return sizeHeight;
}

double sizewidth(BuildContext context) {
  var sizewidth = MediaQuery.of(context).size.width;
  return sizewidth;
}
