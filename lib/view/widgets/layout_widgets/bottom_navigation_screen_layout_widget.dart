import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';

class BottomNavigationScreenLayoutWidget extends StatelessWidget {
  final Widget? appBar;
  final Widget body;
  BottomNavigationScreenLayoutWidget({
    super.key,
    this.appBar,
    required this.body,
  });

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: ScreenSize.width(context),
        height: ScreenSize.height(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: theme.primaryScreenGradient,
          ),
        ),
        child: Column(children: [if (appBar != null) appBar!, body]),
      ),
    );
  }
}
