import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:with_prana_mobile_app/models/category_models/category_models.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_appbar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/meditation_category_screen_widgets/meditation_category_bg_widget.dart';

class MeditationScreenLayoutWidget extends HookWidget {
  final CategoryResponseModel meditationCategory;
  final Widget body;
  final Widget? bottomNavigationBar;
  final bool whiteBg;
  final double? padding;
  const MeditationScreenLayoutWidget({
    super.key,
    this.whiteBg = true,
    this.bottomNavigationBar,
    this.padding,
    required this.body,
    required this.meditationCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          MeditationCategoryBgWidget(
            meditationCategory: meditationCategory,
            whiteBg: whiteBg,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding ?? 16.w),
            child: Column(
              children: [
                MainAppbarWidget(
                  name: meditationCategory.name??'',
                  isInverse: true,
                ),
                Expanded(child: body),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
