import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/meditation_screen_layout_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/meditation_category_screen_widgets/meditation_category_audios_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/meditation_category_screen_widgets/meditation_category_sub_category_widget.dart';

class MeditationCategoryScreen extends HookWidget {
  static const routePath = "/meditation-category";

  final MeditationCategoryModel meditationCategory;
  MeditationCategoryScreen({super.key, required this.meditationCategory});

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return MeditationScreenLayoutWidget(
      body: Column(
        children: [
          VerticalSpace120(),
          Text(
            "Drift into rest with gentle sounds and soothing breath.",
            style: TypographyStyles.sniglet40020(
              color: meditationCategory.contentColor,
            ),
          ),
          VerticalSpace8(),
          MeditationCategorySubCategoryWidget(
            category: meditationCategory,
            theme: theme,
          ),

          Expanded(
            child: MeditationCategoryAudiosWidget(
              meditationCategory: meditationCategory,
            ),
          ),
        ],
      ),
      meditationCategory: meditationCategory,
    );
  }
}
