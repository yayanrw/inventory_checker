import 'dart:ui';

class MyColors {
  static Color primary = HexColor("#fc5daf");
  static Color primaryDark = HexColor("#fe0084");
  static Color primaryLight = HexColor("#fbbcde");
  static Color primarySmooth = HexColor("#fde4f2");

  static Color secondary = HexColor("#3c3c3c");
  static Color secondaryLight = HexColor("#979797");

  static Color textBlack = const Color(0xff222222);
  static Color textGrey = const Color(0xff94959b);
  static Color textWhiteGrey = const Color(0xfff1f1f5);
  static Color bgWhiteSmooth = const Color(0xfffbfbfb);
  static Color bgScaffoldBackground = const Color(0xfff1f1f5);
  // static Color bgScaffoldBackground = Color.fromARGB(255, 244, 7, 7);

  static Color white = const Color(0xffffffff);
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
