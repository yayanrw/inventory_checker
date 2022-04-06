import 'package:flutter/material.dart';
import 'package:inventory_checker/core/config/apps_config.dart';
import 'package:inventory_checker/core/themes/my_appbar_theme.dart';
import 'package:inventory_checker/core/themes/my_colors.dart';
import 'package:inventory_checker/core/themes/my_text_selection_theme.dart';

ThemeData myThemes() {
  return ThemeData(
      scaffoldBackgroundColor: MyColors.bgScaffoldBackground,
      primaryColor: MyColors.primary,
      highlightColor: MyColors.primarySmooth,
      textSelectionTheme: myTextSelectionThemeData(),
      appBarTheme: appBarTheme(),
      fontFamily: AppsConfig.fontFamily,
      visualDensity: VisualDensity.adaptivePlatformDensity);
}
