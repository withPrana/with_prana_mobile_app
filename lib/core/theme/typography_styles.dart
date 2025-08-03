import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';

class TypographyStyles {
  ////sniglet
  static TextStyle sniglet40036secondaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 36.r,
      color: themeController.appTheme.value?.secondaryColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle snigletNormal16secondaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16.r,
      color: themeController.appTheme.value?.secondaryColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle snigletNormal24secondaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 24.r,
      color: themeController.appTheme.value?.secondaryColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle sniglet40024() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 24.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle snigletNormal24Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 24.r,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle sniglet40020() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 20.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle sniglet40016() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle sniglet40016PrimaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16.r,
      color: themeController.appTheme.value?.primaryColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle sniglet40018PrimaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 18.r,
      color: themeController.appTheme.value?.primaryColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle snigletNormal12Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12.r,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle snigletNormal16() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle snigletNormal16Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16.r,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Sniglet",
    );
  }

  ////poppins
  ///
  static TextStyle poppinsNormal10Error() {
    return TextStyle(
      fontSize: 10.r,
      color: Colors.red.shade700,
      fontWeight: FontWeight.normal,
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

  static TextStyle poppins40010() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 10.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins40010Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 10.r,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins40010Disabled() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 10.r,
      color: themeController.appTheme.value?.disabledColor,
      fontWeight: FontWeight.w400,
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

  static TextStyle poppins40010SecondaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 10.r,
      color: themeController.appTheme.value?.secondaryColor,
      fontWeight: FontWeight.w400,
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

  static TextStyle poppins60010PrimaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 10.r,
      color: themeController.appTheme.value?.primaryColor,
      fontWeight: FontWeight.w600,
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

  static TextStyle poppins50014() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 14.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal12secondaryColoredItalic() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12.r,
      color: themeController.appTheme.value?.secondaryColor,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal12() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal12PrimaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12.r,
      color: themeController.appTheme.value?.primaryColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal12Disabled() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12.r,
      color: themeController.appTheme.value?.disabledColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal12Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12.r,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsBold12Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12.r,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsBold12DarkColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12.r,
      color: themeController.appTheme.value?.textDarkColor,
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

  static TextStyle poppinsBold14Primary() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 14.r,
      color: themeController.appTheme.value?.textDarkColor,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsBold14PrimaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 14.r,
      color: themeController.appTheme.value?.primaryColor,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal16Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16.r,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins60014PrimaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 14.r,
      color: themeController.appTheme.value?.primaryColor,
      fontWeight: FontWeight.w600,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins60014Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 14.r,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.w600,
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

  static TextStyle poppins40012Dark() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12.r,
      color: themeController.appTheme.value?.textDarkColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins40012PrimaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12.r,
      color: themeController.appTheme.value?.primaryColor,
      fontWeight: FontWeight.w400,
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

  static TextStyle poppins40014Dark() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 14.r,
      color: themeController.appTheme.value?.textDarkColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsBold16Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16.r,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins40016() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal16() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins50016() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsBold16() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsBold16DarkColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16.r,
      color: themeController.appTheme.value?.textDarkColor,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsBold16PrimaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16.r,
      color: themeController.appTheme.value?.primaryColor,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins50016Brown() {
    return TextStyle(
      fontSize: 16.r,
      color: Color(0xff484848),
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal16Disabled() {
    return TextStyle(
      fontSize: 16.r,
      color: Color(0xffCCCCCC),
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins50016Disabled() {
    return TextStyle(
      fontSize: 16.r,
      color: Color(0xffCCCCCC),
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins60016PrimaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16.r,
      color: themeController.appTheme.value?.primaryColor,
      fontWeight: FontWeight.w600,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins40020SecondaryColored() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 20.r,
      color: themeController.appTheme.value?.secondaryColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins",
    );
  }
}
