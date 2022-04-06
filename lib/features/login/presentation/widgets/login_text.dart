import 'package:flutter/material.dart';
import 'package:inventory_checker/core/themes/my_colors.dart';
import 'package:inventory_checker/core/themes/my_texts.dart';
import 'package:inventory_checker/core/utils/my_strings.dart';

Widget loginText() {
  return Text(
    MyStrings.loginToYourAccount,
    style: myTexts(color: MyColors.primary, weight: FontWeight.w700).headline4,
  );
}
