import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primaryLight = Color(0xff4659A4);
  static const Color primaryDark = Color(0xff4659A4);

  static const Color secondaryLight = Color(0xfff38e49);
  static const Color secondaryDark = Color(0xff492710);

  static const Color backgroundDark = Color(0xFF111B21);
  static const Color backgroundLight = Color(0xFFF0F0F3);

  static const Color greyDark = Color(0xFF5A5A5A);
  static const Color greyLight = Colors.grey;

  static const Color blueDark = Color(0xFF53BDEB);
  static const Color blueLight = Color(0xFF027EB5);
  static const Color blue = Color(0xFF1367CF);

  static const Color greenDark = Color(0xFF00A884);
  static const Color greenLight = Color(0xFF008069);

  static const Color greyBackground = Color(0xFF202C33);

  static const Color redDark = Color(0xFFC62828);
  static const Color redLight = Color(0xFFF44336);

  static const Color shadowColorLightBlue = Color(0xFFA3B1C6);

  static const Color transparent = Colors.transparent;

  static const Color profileBgColor = Color(0XFFEDE7F9);

  static const Color white = Colors.white;

  static const Color black38 = Colors.black38;

  static const Color black = Colors.black;

  static getDropdownColor(String value) =>
      value.toLowerCase() == '-- Select Option --'.toLowerCase()
          ? AppColors.greyLight
          : AppColors.black;

  static const MaterialColor primaryMapColor =
      MaterialColor(0xff4659A4, colorMap);

  static const MaterialColor primaryDarkMapColor =
      MaterialColor(0xff4659A4, colorMap);

  static const Map<int, Color> colorMap = {
    50: Color.fromRGBO(70, 89, 164, .1),
    100: Color.fromRGBO(70, 89, 164, .2),
    200: Color.fromRGBO(70, 89, 164, .3),
    300: Color.fromRGBO(70, 89, 164, .4),
    400: Color.fromRGBO(70, 89, 164, .5),
    500: Color.fromRGBO(70, 89, 164, .6),
    600: Color.fromRGBO(70, 89, 164, .7),
    700: Color.fromRGBO(70, 89, 164, .8),
    800: Color.fromRGBO(70, 89, 164, .9),
    900: Color.fromRGBO(70, 89, 164, 1),
  };
}
