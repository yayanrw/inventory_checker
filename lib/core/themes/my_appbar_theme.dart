import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory_checker/core/themes/my_colors.dart';

AppBarTheme appBarTheme() {
  return AppBarTheme(
    elevation: 2,
    systemOverlayStyle: SystemUiOverlayStyle.light,
    iconTheme: IconThemeData(color: MyColors.primary),
    backgroundColor: MyColors.primary,
  );
}
