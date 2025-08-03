// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/liked_contents_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_screen_layout_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_appbar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/liked_contents_screen_widgets/liked_content_categories_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/liked_contents_screen_widgets/liked_contents_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/liked_contents_screen_widgets/no_contents_widget.dart';

class LikedContentsScreen extends StatelessWidget {
  LikedContentsScreen({super.key});

  final likedContentsController = Get.find<LikedContentsController>();
  final homeController = Get.find<HomeController>();
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return MainScreenLayoutWidget(
      enableAnimation: true,
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        homeController.changeBottomNavScreenIndex(0);
      },
      appBar: MainAppbarWidget(
        name: "💖 Favorites",
        onPop: () {
          homeController.changeBottomNavScreenIndex(0);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            VerticalSpace16(),
            Obx(() {
              if (likedContentsController.likedContents.value.isNotEmpty) {
                return Column(
                  children: [
                    LikedContentCategoriesWidget(
                      likedContentsController: likedContentsController,
                      themeController: themeController,
                    ),
                    VerticalSpace24(),
                    LikedContentsWidget(
                      likedContentsController: likedContentsController,
                    ),
                  ],
                );
              } else {
                return TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: 1),
                  duration: Duration(milliseconds: 500),
                  builder:
                      (context, opacity, child) => Opacity(
                        opacity: opacity,
                        child: NoContentsWidget(
                          themeController: themeController,
                          homeController: homeController,
                        ),
                      ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
