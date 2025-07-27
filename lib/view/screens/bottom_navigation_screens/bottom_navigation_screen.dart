import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/home_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(),
      DownloadsScreen(),
      MyLibraryScreen(),
      LikedContentsScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      extendBody: true,
      body: Obx(() => screens[homeController.currentIndex.value]),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
