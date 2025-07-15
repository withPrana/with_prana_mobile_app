import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';

class InitialQuestionScreenOne extends StatelessWidget {
  static const routePath = "/initial-question-one";
  InitialQuestionScreenOne({super.key});

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return Scaffold(
      body: Container(
        width: ScreenSize.width(context),
        height: ScreenSize.height(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: theme.initialQuestionScreenGradient,
          ),
        ),
        child: Stack(children: [Image.asset(ImageConstants.imgcareHand)]),
      ),
    );
  }
}
