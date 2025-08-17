// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/my_library_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_screen_layout_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_appbar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/my_library_screens_widgets/library_categories_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/my_library_screens_widgets/library_contents_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/my_library_screens_widgets/no_library_contents_widget.dart';

class MyLibraryScreen extends StatelessWidget {
  MyLibraryScreen({super.key});

  final myLibraryController = Get.find<MyLibraryController>();
  final homeController = Get.find<HomeController>();
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return MainScreenLayoutWidget(
      enableAnimation: true,
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        homeController.changeBottomNavScreenIndex(
          context: context,
          index: 0,
          navigate: false,
        );
      },
      appBar: MainAppbarWidget(
        name: "My Library",
        onPop: () {
          homeController.changeBottomNavScreenIndex(
            context: context,
            index: 0,
            navigate: false,
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            VerticalSpace8(),
            Obx(() {
              if (myLibraryController.libraryContents.value.isNotEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Organize your meditations.",
                      style: TypographyStyles.sniglet40016Colored(theme.primaryColor),
                    ),
                    VerticalSpace16(),
                    LibraryCategoriesWidget(
                      myLibraryController: myLibraryController,
                      themeController: themeController,
                    ),
                    VerticalSpace24(),
                    LibraryContentsWidget(
                      myLibraryController: myLibraryController,
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
                        child: NoLibraryContentsWidget(
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
