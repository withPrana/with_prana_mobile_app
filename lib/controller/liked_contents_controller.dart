import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/home_controller.dart';

class LikedContentsController extends GetxController {
  final likedContents = <MadeForYouContentModel>[].obs;
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

  void likeContent(MadeForYouContentModel content) {
    if (likedContents.contains(content)) {
      likedContents.remove(content);
    } else {
      likedContents.add(content);
    }
  }

  void removeLikedContent(MadeForYouContentModel content) {
    likedContents.remove(content);
  }
}
