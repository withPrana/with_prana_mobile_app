// ignore_for_file: invalid_use_of_protected_member

import 'package:double_tap_to_exit/double_tap_to_exit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/category_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/common_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/liked_contents_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/user_account_controller.dart';
import 'package:with_prana_mobile_app/core/route/route_controller.dart';
import 'package:with_prana_mobile_app/core/utils/callbacks.dart';
import 'package:with_prana_mobile_app/core/utils/safe_area_lengths.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/screens/profile_screens/subscription_status_screen.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/gradient_dashed_line_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/loader_widgets/data_loader_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/home_screen_widgets/daily_thought_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/home_screen_widgets/explore_topics_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/home_screen_widgets/home_top_bar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/home_screen_widgets/listen_again_section_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/home_screen_widgets/made_for_you_section_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/home_screen_widgets/meditation_categories_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/subscription_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/home_screen_widgets/today_suggestion_widget.dart';

class HomeScreen extends HookWidget {
  static const routePath = "/home";
  HomeScreen({super.key});

  final themeController = Get.find<ThemeController>();
  final homeController = Get.find<HomeController>();
  final userAccountController = Get.find<UserAccountController>();
  final likedContentsController = Get.find<LikedContentsController>();
  final commonController = Get.find<CommonController>();
  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    //////
    useEffect(() {
      userAccountController.getUserDetails();
      Callbacks.postFrameCallback((_) {
        categoryController.getCategories();
      });
      return null;
    }, []);

    final theme = themeController.appTheme.value!;
    return DoubleTapToExit(
      child: Scaffold(
        body: Container(
          width: ScreenSize.width(context),
          height: ScreenSize.height(context),
          padding: EdgeInsets.only(bottom: safeAreaBottomHeight(context)),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.6],
              colors: theme.primaryScreenGradient,
            ),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                ////top bg image and its contents
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration: Duration(milliseconds: 500),
                    builder:
                        (context, opacity, child) => Opacity(
                          opacity: opacity,
                          child: Obx(
                            ///////////////////
                            () => DataLoaderWidget(
                              theme: theme,
                              data: categoryController.categories.value,
                              noDataMessage: "No data",
                              isLoading:
                                  categoryController.isLoadingCategories.value,
                              dataWidget: Column(
                                children: [
                                  ////
                                  TodaySuggestionWidget(theme: theme),
                                  VerticalSpace32(),
                                  ////
                                  MeditationCategoriesWidget(
                                    theme: theme,
                                    categoryController: categoryController,
                                  ),
                                  ////
                                  MadeForYouSectionWidget(
                                    homeController: homeController,
                                    themeController: themeController,
                                    likedContentsController:
                                        likedContentsController,
                                  ),
                                  ////
                                  GradientDashedLineWidget(),
                                  ////
                                  DailyThoughtWidget(),
                                  ////
                                  GradientDashedLineWidget(),
                                  ////
                                  ExploreTopicsWidget(theme: theme),
                                  ////
                                  GradientDashedLineWidget(),
                                  ////
                                  ListenAgainSectionWidget(),
                                  ////
                                  GradientDashedLineWidget(),
                                  ////
                                  SubscriptionWidget(
                                    onSubscribeClicked: () {
                                      RouteController.push(
                                        context,
                                        SubscriptionStatusScreen.routePath,
                                      );
                                    },
                                  ),
                                  VerticalBottomNavigationBarSpace(),
                                ],
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
              ),
              //////Top bar
              HomeTopBarWidget(
                homeController: homeController,
                theme: theme,
                userAccountController: userAccountController,
                commonController: commonController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
