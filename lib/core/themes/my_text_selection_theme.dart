import 'package:flutter/material.dart';
import 'package:inventory_checker/core/themes/my_colors.dart';

TextSelectionThemeData myTextSelectionThemeData() {
  return TextSelectionThemeData(
    cursorColor: MyColors.primary,
    selectionColor: MyColors.primaryLight,
    selectionHandleColor: MyColors.primary,
  );
}
