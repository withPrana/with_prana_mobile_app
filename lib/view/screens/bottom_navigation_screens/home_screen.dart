import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/home_controller.dart';
import 'package:with_prana_mobile_app/controller/login_controller.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/bottom_navigation_screen_layout_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/gradient_dashed_line_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/home_screen_widgets/daily_thought_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/home_screen_widgets/explore_topics_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/home_screen_widgets/home_top_bar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/home_screen_widgets/listen_again_section_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/home_screen_widgets/made_for_you_section_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/home_screen_widgets/meditation_categories_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/home_screen_widgets/subscription_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/home_screen_widgets/today_suggestion_widget.dart';

class HomeScreen extends StatelessWidget {
  static const routePath = "/home";
  HomeScreen({super.key});

  final themeController = Get.find<ThemeController>();
  final loginController = Get.find<LoginController>();
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return BottomNavigationScreenLayoutWidget(
      body: Stack(
        children: [
          SingleChildScrollView(
            ////top bg image and its contents
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                children: [
                  ////
                  TodaySuggestionWidget(
                    theme: theme,
                    loginController: loginController,
                  ),
                  VerticalSpace32(),
                  ////
                  MeditationCategoriesWidget(),
                  ////
                  MadeForYouSectionWidget(),
                  ////
                  GradientDashedLineWidget(),
                  ////
                  DailyThoughtWidget(),
                  ////
                  GradientDashedLineWidget(),
                  ////
                  ExploreTopicsWidget(),
                  ////
                  GradientDashedLineWidget(),
                  ////
                  ListenAgainSectionWidget(),
                  ////
                  GradientDashedLineWidget(),
                  ////
                  SubscriptionWidget(),
                  VerticalSpace152(),
                ],
              ),
            ),
          ),
          HomeTopBarWidget(
            homeController: homeController,
            theme: theme,
            loginController: loginController,
          ),
        ],
      ),
    );
  }
}
