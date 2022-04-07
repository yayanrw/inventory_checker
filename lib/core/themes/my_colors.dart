import 'dart:ui';

class MyColors {
  static Color primary = HexColor("#0090ff");
  static Color primaryDark = HexColor("#006dff");
  static Color primaryLight = HexColor("#44b3ff");
  static Color primarySmooth = HexColor("#b8ddff");

  static Color secondary = HexColor("#eeb70c");
  static Color secondaryDark = HexColor("#ee9702");
  static Color secondaryLight = HexColor("#f3cd4d");
  static Color secondarySmooth = HexColor("#fae8b2");

  static Color textBlack = const Color(0xff222222);
  static Color textGrey = const Color(0xff94959b);
  static Color textWhiteGrey = const Color(0xfff1f1f5);
  static Color bgWhiteSmooth = const Color(0xfffbfbfb);
  static Color bgScaffoldBackground = const Color(0xfff1f1f5);
  // static Color bgScaffoldBackground = Color.fromARGB(255, 244, 7, 7);

  static Color white = const Color(0xffffffff);

  static Color success = const Color(0xff00ff00);
  static Color error = const Color(0xffff0000);
  static Color warning = const Color(0xffffff00);
  static Color info = const Color(0xff0000ff);
  static Color light = const Color(0xffffffff);
  static Color dark = const Color(0xff000000);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
