import 'package:flutter/material.dart';

Color nightBgClr = const Color(0xFF17171C);
Color lightBgClr = const Color(0xFFF1F2F3);
Color actionsClmnnClr = const Color(0xFF4B5EFC);
Color actionsRowColor = const Color(0xFFD2D3DA);
Color actionsLightRowClr = const Color(0xFFD2D3DA);
Color nightactionsClmnClr = const Color(0xFF4E505F);
Color numbersClr = const Color(0xFF2E2F38);
Color lastAction = const Color(0xFF747477);
Color switchBtnBgClr = const Color(0xFF2E2F38);
Color switchBtnClr = const Color(0xFF4E505F);
Color black = Colors.black;
Color white = Colors.white;


TextStyle kTextStyle({
  Color? color,
  double size = 14,
  FontWeight fontWeight = FontWeight.w500,
  double? letterSpacing,
  double? height,
}) {
  return TextStyle(
      color: color ?? Colors.white,
      fontSize: size,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      height: height);
}