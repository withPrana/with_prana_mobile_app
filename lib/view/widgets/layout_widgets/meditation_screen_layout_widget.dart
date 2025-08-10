import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_appbar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/meditation_category_screen_widgets/meditation_category_bg_widget.dart';

class MeditationScreenLayoutWidget extends HookWidget {
  final MeditationCategoryModel meditationCategory;
  final Widget body;
  final Widget? bottomNavigationBar;
  const MeditationScreenLayoutWidget({
    super.key,
    required this.body,
    required this.meditationCategory,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          MeditationCategoryBgWidget(meditationCategory: meditationCategory),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                MainAppbarWidget(name: "🌙 Sleep & Rest", isInverse: true),
                Expanded(child: SingleChildScrollView(child: body)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
