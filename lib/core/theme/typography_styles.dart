import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';

class TypographyStyles {
  ////sniglet
  static TextStyle snigletNormal22secondaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 22.r,
      color: themeController.appTheme.value?.secondaryColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle snigletNormal22Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 22.r,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle snigletNormal10Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 10.r,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle snigletNormal14() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 14.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle snigletNormal14Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 14.r,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Sniglet",
    );
  }

  ////poppins
  ///
  static TextStyle poppinsNormal8Error() {
    return TextStyle(
      fontSize: 8.r,
      color: Colors.red.shade700,
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal8() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 8.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins40012() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal10secondaryColoredItalic() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 10.r,
      color: themeController.appTheme.value?.secondaryColor,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal10() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 10.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal10Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 10.r,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsBold10Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 10.r,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsBold12PrimaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12.r,
      color: themeController.appTheme.value?.primaryColor,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal14Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 14.r,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins60012PrimaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12.r,
      color: themeController.appTheme.value?.primaryColor,
      fontWeight: FontWeight.w600,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins40010PrimaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 10.r,
      color: themeController.appTheme.value?.primaryColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsBold14Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 14.r,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins40014() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 14.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal14() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 14.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins50014() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 14.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsBold14() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 14.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins50014Brown() {
    return TextStyle(
      fontSize: 14.r,
      color: Color(0xff484848),
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal14Disabled() {
    return TextStyle(
      fontSize: 14.r,
      color: Color(0xffCCCCCC),
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins50014Disabled() {
    return TextStyle(
      fontSize: 14.r,
      color: Color(0xffCCCCCC),
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins40018SecondaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 18.r,
      color: themeController.appTheme.value?.secondaryColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins",
    );
  }
}
