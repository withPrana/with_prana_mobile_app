import 'package:with_prana_mobile_app/controller/services.dart/api_calls.dart';
import 'package:with_prana_mobile_app/core/constants/api_endpoints.dart';
import 'package:with_prana_mobile_app/core/constants/error_text_constants.dart';
import 'package:with_prana_mobile_app/core/enums/api_request_enum.dart';
import 'package:with_prana_mobile_app/models/liked_contents_models/like_models.dart';
import 'package:with_prana_mobile_app/models/liked_contents_models/liked_contents_models.dart';

class LikedContentsService {
  ////like meditation
  static Future<bool> likeMeditation(AddLikeBodyModel body) async {
    final response = await ApiCalls.callApi(
      request: ApiRequestEnum.post,
      useToken: true,
      body: body.toJson(),
      url: ApiEndpoints.addLikeEndpoint,
      functionFor: "Like content",
      errorMessage: "Unable to like the content",
      showMessageForError: true,
      showMessageForSuccess: true,
    );

    if (response != null) {
      return true;
    }
    return false;
  }

  ////dislike meditation
  static Future<bool> dislikeMeditation(AddLikeBodyModel body) async {
    final response = await ApiCalls.callApi(
      request: ApiRequestEnum.delete,
      useToken: true,
      url: ApiEndpoints.dislikeEndpoint,
      body: body.toJson(),
      functionFor: "dislike content",
      errorMessage: "Unable to dislike the content",
      showMessageForError: true,
      showMessageForSuccess: true,
    );

    if (response != null) {
      return true;
    }
    return false;
  }

  static Future<List<LikedContentsResponseModel>> getLikedContents(
    String userId,
  ) async {
    final response = await ApiCalls.callApi(
      request: ApiRequestEnum.get,
      useToken: true,
      url: "${ApiEndpoints.getLikedContentsEndpoint}/$userId",
      functionFor: "Liked contents",
      errorMessage: ErrorTextConstants.txtUnableToGetData,
      showMessageForError: true,
    );

    if (response != null && response["likedMeditations"] is List) {
      final likedContents = <LikedContentsResponseModel>[];
      for (final content in response["likedMeditations"]) {
        likedContents.add(LikedContentsResponseModel.fromJson(content));
      }
      // final List<LikedContentsResponseModel> likedContents =
      //     response["likedMeditations"].map((content) {
      //       return LikedContentsResponseModel.fromJson(content);
      //     }).toList();

      return likedContents;
    }
    return [];
  }
}
