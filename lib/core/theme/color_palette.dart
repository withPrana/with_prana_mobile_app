import 'package:flutter/material.dart';

////common color theme. Can be used as instance for light theme and dark theme
class ColorPalette {
  final List<Color> splashGradient;
  final List<Color> nameEntryScreenGradient;
  final List<Color> primaryScreenGradient;
  final Color primaryColor;
  final Color secondaryColor;
  final Color primaryLightColor;
  final Color textColor;
  final Color inverseColor;
  final Color textFieldBorder;
  final Color shadowColor;

  ColorPalette({
    required this.splashGradient,
    required this.nameEntryScreenGradient,
    required this.primaryScreenGradient,
    required this.primaryColor,
    required this.secondaryColor,
    required this.primaryLightColor,
    required this.textColor,
    required this.inverseColor,
    required this.textFieldBorder,
    required this.shadowColor,
  });
}

class LightTheme extends ColorPalette {
  LightTheme()
    : super(
        splashGradient: [Color(0xffE5F2D6), Color(0xffFFFFFF)],
        nameEntryScreenGradient: [Color(0xff2B7272), Color(0xffFFFFFF)],
        primaryScreenGradient: [Color(0xffDDF3E5), Color(0xffFFFFFF)],
        primaryColor: Color(0xff1F5D57),
        secondaryColor: Color(0xff2B7272),
        primaryLightColor: Color(0xffDDF3E5),
        textColor: Color(0xff484848),
        inverseColor: Color(0xffFFFFFF),
        textFieldBorder: Color(0xffF5F5F5),
        shadowColor: Colors.black26,
      );
}
