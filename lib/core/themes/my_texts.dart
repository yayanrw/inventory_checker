import 'package:flutter/material.dart';
import 'package:inventory_checker/core/config/apps_config.dart';

TextTheme myTexts({Color? color, FontWeight? weight}) {
  color = color ?? AppsConfig.defaultTextColor;
  weight = weight ?? FontWeight.w500;

  return TextTheme(
    headline1: TextStyle(
        fontSize: 93, fontWeight: weight, letterSpacing: -1.5, color: color),
    headline2: TextStyle(
        fontSize: 58, fontWeight: weight, letterSpacing: -0.5, color: color),
    headline3: TextStyle(fontSize: 46, fontWeight: weight, color: color),
    headline4: TextStyle(
        fontSize: 33, fontWeight: weight, letterSpacing: 0.25, color: color),
    headline5: TextStyle(fontSize: 23, fontWeight: weight, color: color),
    headline6: TextStyle(
        fontSize: 19, fontWeight: weight, letterSpacing: 0.15, color: color),
    subtitle1: TextStyle(
        fontSize: 15, fontWeight: weight, letterSpacing: 0.15, color: color),
    subtitle2: TextStyle(
        fontSize: 15, color: color, fontWeight: weight, letterSpacing: 0.15),
    bodyText1: TextStyle(
        fontSize: 16, fontWeight: weight, letterSpacing: 0.5, color: color),
    bodyText2: TextStyle(
        fontSize: 14, fontWeight: weight, letterSpacing: 0.25, color: color),
    button: TextStyle(
        fontSize: 14, fontWeight: weight, letterSpacing: 1.25, color: color),
    caption: TextStyle(
        fontSize: 12, fontWeight: weight, letterSpacing: 0.4, color: color),
    overline: TextStyle(
        fontSize: 10, fontWeight: weight, letterSpacing: 1.5, color: color),
  );
}
