import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/services.dart/liked_contents_service.dart';
import 'package:with_prana_mobile_app/core/shared_preferences/shared_preferences.dart';
import 'package:with_prana_mobile_app/models/liked_contents_models/like_models.dart';
import 'package:with_prana_mobile_app/models/liked_contents_models/liked_contents_models.dart';

class LikedContentsController extends GetxController {
  final likedContents = <LikedContentsResponseModel>[].obs;

  final isLoadingLikedContents = false.obs;

  ///like
  Future<void> likeMeditation(String meditationId) async {
    final userId = await SharedPrefs.getUserId();
    final body = AddLikeBodyModel(userId: userId, meditationId: meditationId);
    await LikedContentsService.likeMeditation(body);
  }

  ///dislike
  Future<void> dislikeMeditation(String meditationId) async {
    final userId = await SharedPrefs.getUserId();
    final body = AddLikeBodyModel(userId: userId, meditationId: meditationId);
    await LikedContentsService.dislikeMeditation(body);
  }

  Future<void> getLikedContents() async {
    isLoadingLikedContents.value = true;
    final userId = await SharedPrefs.getUserId();
    final response = await LikedContentsService.getLikedContents(userId);
    likedContents.value = response;
    isLoadingLikedContents.value = false;
  }
}
