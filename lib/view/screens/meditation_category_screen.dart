import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_appbar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/meditation_category_screen_widgets/meditation_category_bg_widget.dart';

class MeditationCategoryScreen extends HookWidget {
  static const routePath = "/meditation-category";

  final MeditationCategoryModel category;
  const MeditationCategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          MeditationCategoryBgWidget(category: category),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                MainAppbarWidget(name: "🌙 Sleep & Rest", isInverse: true),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        VerticalSpace120(),
                        Text(
                          "Drift into rest with gentle sounds and soothing breath.",
                          style: TypographyStyles.sniglet40020(
                            color: category.contentColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
