import 'package:flutter/material.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';

Color hexToColor({required String hex, required ColorPalette theme}) {
  try {
    hex = hex.replaceAll("#", "");
    if (hex.length == 6) {
      hex = "FF$hex";
    }
    return Color(int.parse(hex, radix: 16));
  } catch (e) {
    // log(e.toString());
  }
  return theme.primaryColor;
}
