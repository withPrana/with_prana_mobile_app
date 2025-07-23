import 'package:double_tap_to_exit/double_tap_to_exit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/home_controller.dart';
import 'package:with_prana_mobile_app/view/screens/bottom_navigation_screens/downloads_screen.dart';
import 'package:with_prana_mobile_app/view/screens/bottom_navigation_screens/home_screen.dart';
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
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
    ];
    return DoubleTapToExit(
      child: Scaffold(
        extendBody: true,
        body: Obx(() => screens[homeController.currentIndex.value]),
        bottomNavigationBar: BottomNavigationBarWidget(),
      ),
    );
  }
}
