import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/screens/bottom_navigation_screens/downloads_screen.dart';
import 'package:with_prana_mobile_app/view/screens/bottom_navigation_screens/home_screen.dart';
import 'package:with_prana_mobile_app/view/screens/bottom_navigation_screens/liked_contents_screen.dart';
import 'package:with_prana_mobile_app/view/screens/bottom_navigation_screens/my_library_screen.dart';
import 'package:with_prana_mobile_app/view/screens/bottom_navigation_screens/profile_screen.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/bottom_navigation_bar_widget.dart';

class BottomNavigationScreen extends StatelessWidget {
  static const routePath = "/bottom-navigation";
  BottomNavigationScreen({super.key});

  final homeController = Get.find<HomeController>();
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    final screens = [
      HomeScreen(),
      DownloadsScreen(),
      MyLibraryScreen(),
      LikedContentsScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      extendBody: true,
      body: Container(
        width: ScreenSize.width(context),
        height: ScreenSize.height(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.6],
            colors: theme.primaryScreenGradient,
          ),
        ),
        child: Obx(() => screens[homeController.currentIndex.value]),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(navigate: false),
    );
  }
}
