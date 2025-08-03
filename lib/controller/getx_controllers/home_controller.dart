// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/route/route_controller.dart';
import 'package:with_prana_mobile_app/view/screens/bottom_navigation_screens/bottom_navigation_screen.dart';

////
class MeditationCategoryModel {
  final String iconPath;
  final String name;
  final Color color;
  final Color contentColor;

  MeditationCategoryModel({
    required this.iconPath,
    required this.name,
    required this.color,
    required this.contentColor,
  });
}

//////
class AudioPreviewModel {
  final String iconPath;
  final String title;
  final String category;
  final Color iconColor;
  final int minutes;

  AudioPreviewModel({
    required this.iconPath,
    required this.title,
    required this.category,
    required this.iconColor,
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
  final meditationCategories =
      [
        MeditationCategoryModel(
          iconPath: IconConstants.icMeditationCategoryOne,
          name: 'Breathe &\nBegin',
          color: const Color(0xFFFFF9FF),
          contentColor: const Color(0xFF8E4692),
        ),
        MeditationCategoryModel(
          iconPath: IconConstants.icMeditationCategoryTwo,
          name: 'Sleep\n& Rest',
          color: const Color(0xFFF8F9FF),
          contentColor: const Color(0xFF545C90),
        ),
        MeditationCategoryModel(
          iconPath: IconConstants.icMeditationCategoryThree,
          name: 'Focus & Mind\nSupport',
          color: const Color(0xFFF1F9F4),
          contentColor: const Color(0xFF2B7272),
        ),
        MeditationCategoryModel(
          iconPath: IconConstants.icMeditationCategoryFour,
          name: 'Healing &\nConnection',
          color: const Color(0xFFFFF7F6),
          contentColor: const Color(0xFFA2605B),
        ),
      ].obs;

  final listenAgainAudios =
      [
        AudioPreviewModel(
          iconPath: ImageConstants.imgAudioPreviewOne,
          title: "Soothing Wind Before Sleep",
          category: "Breathe & Begin",
          iconColor: Color(0xffCCD3FF),
          minutes: 10,
        ),
        AudioPreviewModel(
          iconPath: ImageConstants.imgAudioPreviewOne,
          title: "Gentle Morning Start",
          category: "Sleep & Rest",
          iconColor: Color(0xffFCCCFF),
          minutes: 7,
        ),
        AudioPreviewModel(
          iconPath: ImageConstants.imgAudioPreviewOne,
          title: "Quiet Mind, Clear Focus",
          category: "Focus & Mind Support",
          iconColor: Color(0xffBAE2BA),
          minutes: 12,
        ),
        AudioPreviewModel(
          iconPath: ImageConstants.imgAudioPreviewOne,
          title: "Soft Heart, Strong Boundaries",
          category: "Healing & Connection",
          iconColor: Color(0xffFFCDC9),
          minutes: 14,
        ),
      ].obs;

  final topics =
      [
        "🌿 Overthinking",
        "🛌 Night Routine",
        "💼 Burnout",
        "🌀 Grounding",
        "🧒 Inner Child",
        "💖 Self-Worth",
        "🌊 Relaxation",
        "🧠 ADHD",
        "✨ Spiritual Connection",
      ].obs;

  final madeForYouContents =
      [
        MadeForYouContentModel(
          index: 0,
          iconPath: ImageConstants.imgAudioPreviewOne,
          iconColor: Color(0xffFCCCFF),
          isLiked: false,
          imagePath: "assets/images/made_for_you_bg_image_one.jpg",
          title: "Soft Heart, Strong Boundaries",
          category: "Healing & Connection",
          minutes: 5,
        ),
        MadeForYouContentModel(
          index: 1,
          iconPath: ImageConstants.imgAudioPreviewTwo,
          iconColor: Color(0xffBAE2BA),
          isLiked: false,
          imagePath: "assets/images/made_for_you_bg_image_two.jpg",
          title: "Soft Heart, Strong Boundaries",
          category: "Healing & Connection",
          minutes: 7,
        ),
        MadeForYouContentModel(
          index: 2,
          iconPath: ImageConstants.imgAudioPreviewThree,
          iconColor: Color(0xffFFCDC9),
          isLiked: false,
          imagePath: "assets/images/made_for_you_bg_image_one.jpg",
          title: "Soft Heart, Strong Boundaries",
          category: "Healing & Connection",
          minutes: 4,
        ),
        MadeForYouContentModel(
          index: 3,
          iconPath: ImageConstants.imgAudioPreviewFour,
          iconColor: Color(0xffCCD3FF),
          isLiked: false,
          imagePath: "assets/images/made_for_you_bg_image_two.jpg",
          title: "Soft Heart, Strong Boundaries",
          category: "Healing & Connection",
          minutes: 9,
        ),
      ].obs;

  ////Greet user in home screen based on the current time
  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 11) {
      return 'Good morning';
    } else if (hour < 17) {
      return 'Good afternoon';
    } else if (hour < 21) {
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
