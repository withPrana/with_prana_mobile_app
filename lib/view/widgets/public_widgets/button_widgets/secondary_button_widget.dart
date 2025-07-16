import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';

class SecondaryButtonWidget extends StatelessWidget {
  final String? name;
  final Widget? child;
  final VoidCallback onTap;
  final bool isLoading;
  final double? width;
  final double? height;
  final Color? borderColor;
  SecondaryButtonWidget({
    super.key,
    required this.onTap,
    required this.isLoading,
    this.width,
    this.height,
    this.name,
    this.child,
    this.borderColor,
  });

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;

    return Material(
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          splashColor: Colors.white,
          onTap: isLoading ? null : onTap,
          child: Container(
            width: width,
            height: height ?? 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: borderColor ?? theme.inverseColor,
                width: 2,
              ),
              color: theme.secondaryColor,
            ),
            child: Center(
              child:
                  child ??
                  Text(
                    name ?? '',
                    style: TypographyStyles.snigletNormal6Inverse(),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
