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
  static TextStyle poppinsNormal6Inverse() {
    final themeController = Get.find<ThemeController>();
    return TextStyle(
      fontSize: 16,
      color: themeController.appTheme.value?.inverseColor,
      fontWeight: FontWeight.bold,
      fontFamily: "Poppins",
    );
  }
    static TextStyle poppinsNorma16IBrown() {
    return TextStyle(
      fontSize: 16,
      color: Color(0xff484848),
      fontWeight: FontWeight.w500,
      fontFamily: "Poppins",
    );
  }
}
