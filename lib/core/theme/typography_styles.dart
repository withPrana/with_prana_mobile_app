import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';

class TypographyStyles {
  ////sniglet
  static TextStyle snigletNormal24secondaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 24,
      color: themeController.appTheme.value?.secondaryColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle snigletNormal24Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 24,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle snigletNormal12Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle snigletNormal6() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle snigletNormal6Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Sniglet",
    );
  }

  ////poppins
  ///
  static TextStyle poppinsNormal0Error() {
    return TextStyle(
      fontSize: 10,
      color: Colors.red.shade700,
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal12secondaryColoredItalic() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12,
      color: themeController.appTheme.value?.secondaryColor,
      fontWeight: FontWeight.normal,
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

  static TextStyle poppinsBold14PrimaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 14,
      color: themeController.appTheme.value?.primaryColor,
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

  static TextStyle poppins60014PrimaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 14,
      color: themeController.appTheme.value?.primaryColor,
      fontWeight: FontWeight.w600,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins40012PrimaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12,
      color: themeController.appTheme.value?.primaryColor,
      fontWeight: FontWeight.w400,
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

  static TextStyle poppins40016() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.w400,
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

  static TextStyle poppinsBold16() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.bold,
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

  static TextStyle poppins40020SecondaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 20,
      color: themeController.appTheme.value?.secondaryColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins",
    );
  }
}
