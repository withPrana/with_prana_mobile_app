import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';

class TypographyStyles {
  ////sniglet
  ////12
  static TextStyle snigletNormal12Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12.r,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Sniglet",
    );
  }

  ////16
  static TextStyle sniglet40016() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle sniglet40016Colored(Color color) {
    return TextStyle(
      fontSize: 16.r,
      color: color,
      fontWeight: FontWeight.w400,
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

  static TextStyle snigletNormal16Colored(Color color) {
    return TextStyle(
      fontSize: 16.r,
      color: color,
      fontWeight: FontWeight.normal,
      fontFamily: "Sniglet",
    );
  }

  ////18
  static TextStyle sniglet40018Colored(Color color) {
    return TextStyle(
      fontSize: 18.r,
      color: color,
      fontWeight: FontWeight.w400,
      fontFamily: "Sniglet",
    );
  }

  /////20
  static TextStyle sniglet40020() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 20.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle sniglet40020Colored(Color color) {
    return TextStyle(
      fontSize: 20.r,
      color: color,
      fontWeight: FontWeight.w400,
      fontFamily: "Sniglet",
    );
  }

  /////24
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

  static TextStyle sniglet40024Colored(Color? color) {
    return TextStyle(
      fontSize: 24.r,
      color: color,
      fontWeight: FontWeight.w400,
      fontFamily: "Sniglet",
    );
  }

  static TextStyle snigletNormal24Colored(Color color) {
    return TextStyle(
      fontSize: 24.r,
      color: color,
      fontWeight: FontWeight.normal,
      fontFamily: "Sniglet",
    );
  }

  ////36
  static TextStyle sniglet40036Colored(Color color) {
    return TextStyle(
      fontSize: 36.r,
      color: color,
      fontWeight: FontWeight.w400,
      fontFamily: "Sniglet",
    );
  }

  /////////////////////////////////////////////////////poppins
  ////10
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

  static TextStyle poppins40010Colored(Color color) {
    return TextStyle(
      fontSize: 10.r,
      color: color,
      fontWeight: FontWeight.w400,
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

  static TextStyle poppinsNormal10Error() {
    return TextStyle(
      fontSize: 10.r,
      color: Colors.red.shade700,
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins60010Colored(Color color) {
    return TextStyle(
      fontSize: 10.r,
      color: color,
      fontWeight: FontWeight.w600,
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

  /////12
  static TextStyle poppins40012() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins40012Colored(Color color) {
    return TextStyle(
      fontSize: 12.r,
      color: color,
      fontWeight: FontWeight.w400,
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

  static TextStyle poppinsNormal12Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 12.r,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal12Colored(Color color) {
    return TextStyle(
      fontSize: 12.r,
      color: color,
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal12ColoredItalic(Color color) {
    return TextStyle(
      fontSize: 12.r,
      color: color,
      fontWeight: FontWeight.normal,
      fontStyle: FontStyle.italic,
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

  static TextStyle poppinsBold12Colored(Color color) {
    return TextStyle(
      fontSize: 12.r,
      color: color,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }

  /////14
  static TextStyle poppins40014() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 14.r,
      color: themeController.appTheme.value?.textColor,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins40014Colored(Color color) {
    return TextStyle(
      fontSize: 14.r,
      color: color,
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

  static TextStyle poppins50014Colored(Color color) {
    return TextStyle(
      fontSize: 14.r,
      color: color,
      fontWeight: FontWeight.w500,
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

  static TextStyle poppins60014Colored(Color color) {
    return TextStyle(
      fontSize: 14.r,
      color: color,
      fontWeight: FontWeight.w600,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsBold14Colored(Color color) {
    return TextStyle(
      fontSize: 14.r,
      color: color,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }

  /////16
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

  static TextStyle poppinsNormal16Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16.r,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.normal,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsNormal16Colored(Color color) {
    return TextStyle(
      fontSize: 16.r,
      color: color,
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

  static TextStyle poppins50016Colored(Color color) {
    return TextStyle(
      fontSize: 16.r,
      color: color,
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins60016Colored(Color color) {
    return TextStyle(
      fontSize: 16.r,
      color: color,
      fontWeight: FontWeight.w600,
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

  static TextStyle poppinsBold16Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16.r,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppinsBold16Colored(Color color) {
    return TextStyle(
      fontSize: 16.r,
      color: color,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }

  static TextStyle poppins40020Colored(Color color) {
    return TextStyle(
      fontSize: 20.r,
      color: color,
      fontWeight: FontWeight.w400,
      fontFamily: "Poppins",
    );
  }
}
