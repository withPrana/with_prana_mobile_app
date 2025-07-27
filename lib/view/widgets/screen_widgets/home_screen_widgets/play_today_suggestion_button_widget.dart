import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';

class PlayTodaySuggestionButtonWidget extends StatelessWidget {
  PlayTodaySuggestionButtonWidget({super.key});

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.r, horizontal: 10.r),
      decoration: BoxDecoration(
        color: theme.inverseColor,
        border: Border.all(color: theme.disabledLightColor),
        borderRadius: BorderRadius.circular(500.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 5.r,
        children: [
          Icon(Icons.play_arrow_rounded, color: theme.textColor, size: 14.r),
          Text("9 minutes", style: TypographyStyles.poppins40012Dark()),
        ],
      ),
    );
  }
}
