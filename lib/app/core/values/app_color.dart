import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const Color yellow100 = Color(0xFFF6C544);
  static const Color orange100 = Color(0xFFF19E39);
  static const Color orange200 = Color(0xFFED752E);
  static const Color black100 = Color(0xFF161921);
  static const Color gray200 = Color(0xFFA2A7B9);
  static const Color gray100 = Color(0xFFF0F2F3);
  static const Color white50 = Color(0xFFFFFFFF);
  static const Color tranparent = Colors.transparent;

  static Color hexColor(String? value, {Color? color}) {
    if (value == null) {
      return color ?? Colors.white;
    }
    try {
      if (value.length == 8) {
        return Color(int.parse(value, radix: 16));
      } else {
        return Color(int.parse(
          value.toUpperCase().replaceAll('#', '').padLeft(8, 'FF'),
          radix: 16,
        ));
      }
    } catch (e) {
      return color ?? Colors.white;
    }
  }
}
