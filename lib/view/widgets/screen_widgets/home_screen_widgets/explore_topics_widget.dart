// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class ExploreTopicsWidget extends StatelessWidget {
  ExploreTopicsWidget({super.key});

  final themeController = Get.find<ThemeController>();
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Explore by Topic", style: TypographyStyles.sniglet40016()),
        VerticalSpace8(),
        Obx(
          () => Wrap(
            runSpacing: 10.r,
            spacing: 8.r,
            children:
                homeController.topics.value
                    .map((topicName) => topic(topicName, theme))
                    .toList(),
          ),
        ),
      ],
    );
  }

  Widget topic(String topicName, ColorPalette theme) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 10.r),
      decoration: BoxDecoration(
        color: theme.primaryLightColor,
        border: Border.all(color: theme.primaryColor),
        borderRadius: BorderRadius.circular(500.r),
      ),
      child: Text(topicName, style: TypographyStyles.poppins40012()),
    );
  }
}
