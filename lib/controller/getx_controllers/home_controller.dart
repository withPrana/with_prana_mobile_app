// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/core/route/route_controller.dart';
import 'package:with_prana_mobile_app/view/screens/bottom_navigation_screens/bottom_navigation_screen.dart';

//////
class AudioPreviewModel {
  final String iconPath;
  final String title;
  final String category;
  final String thumbnail;
  final String? description;
  final Color iconColor;
  final String? audioUrl;
  final int minutes;

  AudioPreviewModel({
    required this.iconPath,
    required this.title,
    required this.category,
    required this.thumbnail,
    this.description,
    required this.iconColor,
    this.audioUrl,
    required this.minutes,
  });
}

////
class MadeForYouContentModel {
  int index;
  String iconPath;
  Color iconColor;
  bool isLiked;
  String imagePath;
  String title;
  String category;
  int minutes;

  MadeForYouContentModel({
    required this.index,
    required this.iconPath,
    required this.iconColor,
    required this.isLiked,
    required this.imagePath,
    required this.title,
    required this.category,
    required this.minutes,
  });
}
////

class HomeController extends GetxController {
  final currentIndex = 0.obs;

  ////Greet user in home screen based on the current time
  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour > 4 && hour < 12) {
      return 'Good morning';
    } else if (hour > 12 && hour < 17) {
      return 'Good afternoon';
    } else if (hour > 17 && hour < 21) {
      return 'Good evening';
    } else {
      return 'Good night';
    }
  }

  void changeBottomNavScreenIndex({
    required BuildContext context,
    required int index,
    required bool navigate,
  }) {
    if (currentIndex.value != index) {
      if (navigate) {
        RouteController.pushAndRemoveUntil(
          context,
          BottomNavigationScreen.routePath,
        );
      }
      currentIndex(index);
    }
  }
}
