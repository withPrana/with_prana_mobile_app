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
  final Color textDarkColor;
  final Color inverseColor;
  final Color textFieldBorder;
  final Color shadowColor;
  final Color disabledLightColor;
  final Color disabledLightestColor;
  final Color disabledColor;
  final Color selectedBottomNavigationItemColor;
  final Color monthlyPlanBgColor;
  final Color monthlyPlanMainColor;
  final Color yearlyPlanBgColor;
  final Color yearlyPlanMainColor;

  ColorPalette({
    required this.splashGradient,
    required this.nameEntryScreenGradient,
    required this.primaryScreenGradient,
    required this.primaryColor,
    required this.secondaryColor,
    required this.primaryLightColor,
    required this.textColor,
    required this.textDarkColor,
    required this.inverseColor,
    required this.textFieldBorder,
    required this.shadowColor,
    required this.disabledLightColor,
    required this.disabledLightestColor,
    required this.disabledColor,
    required this.selectedBottomNavigationItemColor,
    required this.monthlyPlanBgColor,
    required this.monthlyPlanMainColor,
    required this.yearlyPlanBgColor,
    required this.yearlyPlanMainColor,
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
        textDarkColor: Colors.black,
        inverseColor: Color(0xffFFFFFF),
        textFieldBorder: Color(0xffF5F5F5),
        shadowColor: Colors.black26,
        disabledLightColor: Color(0xffEDEDED),
        disabledLightestColor: Color(0xffF5F5F5),
        disabledColor: Color(0xff808080),
        selectedBottomNavigationItemColor: Color(0xffC6ECE9),
        monthlyPlanBgColor: Color(0xffFEF9C4),
        monthlyPlanMainColor: Color(0xffFF780B),
        yearlyPlanBgColor: Color(0xffD8F6E0),
        yearlyPlanMainColor: Color(0xff04C03A),
      );
}
