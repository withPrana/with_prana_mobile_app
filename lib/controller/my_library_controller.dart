import 'dart:ui';

import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/home_controller.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';

class MyLibraryController extends GetxController {
  final libraryContents =
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
      ].obs;

  final categories =
      [
        "🌙 Sleep & Rest",
        "🎯 Focus & Mind Support",
        "🫂 Healing & Connection",
        "🌙 Sleep & Rest",
        "🎯 Focus & Mind Support",
      ].obs;    

    final selectedCategory = "".obs;

  void selectCategory(String category) {
    if (selectedCategory.value != category) {
      selectedCategory(category);
    }
  }    
}
