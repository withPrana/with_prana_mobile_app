import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';

class MainScreenLayoutWidget extends StatelessWidget {
  final Widget? appBar;
  final Widget body;
  final bool enableAnimation;
  final bool canPop;
  final Widget? bottomNavigationBar;

  ///Horizontal padding of the screen. Do not use screen util. Its already used inside
  final double horizontalPadding;
  final void Function(bool didPop, Object? result)? onPopInvokedWithResult;
  MainScreenLayoutWidget({
    super.key,
    this.appBar,
    this.bottomNavigationBar,
    this.horizontalPadding = 16,
    this.enableAnimation = false,
    this.canPop = true,
    required this.body,
    this.onPopInvokedWithResult,
  });

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: onPopInvokedWithResult,
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration:
              enableAnimation ? Duration(milliseconds: 500) : Duration.zero,
          builder:
              (context, opacity, child) => Opacity(
                opacity: opacity,
                child: Container(
                  width: ScreenSize.width(context),
                  height: ScreenSize.height(context),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: theme.primaryScreenGradient,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding.w,
                    ),
                    child: Column(
                      children: [
                        if (appBar != null) appBar!,
                        Expanded(child: body),
                      ],
                    ),
                  ),
                ),
              ),
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
