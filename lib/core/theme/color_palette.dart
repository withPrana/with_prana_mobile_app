import 'package:flutter/material.dart';

////common color theme. Can be used as instance for light theme and dark theme
class ColorPalette {
  final List<Color> splashGradient;
  final Color primaryColor;
  final Color inverseColor;

  ColorPalette({
    required this.splashGradient,
    required this.primaryColor,
    required this.inverseColor,
  });
}

class LightTheme extends ColorPalette {
  LightTheme()
    : super(
        splashGradient: [Color(0xffE5F2D6), Color(0xffFFFFFF)],
        primaryColor: Color(0xff2B7272),
        inverseColor: Color(0xffFFFFFF),
      );
}
