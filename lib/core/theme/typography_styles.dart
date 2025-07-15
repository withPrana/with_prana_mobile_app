import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';

class TypographyStyles {
  ////sniglet
  static TextStyle snigletNormal24Colored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 24,
      color: themeController.appTheme.value?.primaryColor,
      fontWeight: FontWeight.w500,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle snigletNormal24Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 24,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.w500,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle snigletNormal12Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.w500,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle snigletNormal6Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.w500,
      fontFamily: "Sniglet",
    );
  }

  ////poppins
  static TextStyle poppinsNormal12ColoredItalic() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12,
      color: themeController.appTheme.value?.primaryColor,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.italic,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal12Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsBold12Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal16Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsBold16Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal16() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins50016() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal16Brown() {
    return TextStyle(
      fontSize: 16,
      color: Color(0xff484848),
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal16Disabled() {
    return TextStyle(
      fontSize: 16,
      color: Color(0xffCCCCCC),
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins50016Disabled() {
    return TextStyle(
      fontSize: 16,
      color: Color(0xffCCCCCC),
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal8Error() {
    return TextStyle(
      fontSize: 10,
      color: Colors.red.shade700,
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }
}
