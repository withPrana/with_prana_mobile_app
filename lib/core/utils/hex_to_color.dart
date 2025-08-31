import 'dart:developer';

import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  try {
    hex = hex.replaceAll("#", "");
    if (hex.length == 6) {
      hex = "FF$hex";
    }
    return Color(int.parse(hex, radix: 16));
  } catch (e) {
    log(e.toString());
  }
  return Colors.white;
}
