import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/meditation_player_controller.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/list_view_builder_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/audio_palyer_preview_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class MeditationCategoryAudiosWidget extends StatelessWidget {
  final MeditationCategoryModel meditationCategory;
  final MeditationPlayerController meditationPlayerController;
  const MeditationCategoryAudiosWidget({
    super.key,
    required this.meditationCategory,
    required this.meditationPlayerController,
  });

  @override
  Widget build(BuildContext context) {
    final audios = [
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Soothing Wind Before Sleep",
        category: "Breathe & Begin",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: meditationCategory.contentColor,
        minutes: 10,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Gentle Morning Start",
        category: "Sleep & Rest",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: meditationCategory.contentColor,
        minutes: 7,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Quiet Mind, Clear Focus",
        category: "Focus & Mind Support",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: meditationCategory.contentColor,
        minutes: 12,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Soft Heart, Strong Boundaries",
        category: "Healing & Connection",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: meditationCategory.contentColor,
        minutes: 14,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Soothing Wind Before Sleep",
        category: "Breathe & Begin",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: meditationCategory.contentColor,
        minutes: 10,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Gentle Morning Start",
        category: "Sleep & Rest",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: meditationCategory.contentColor,
        minutes: 7,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Quiet Mind, Clear Focus",
        category: "Focus & Mind Support",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: meditationCategory.contentColor,
        minutes: 12,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Soft Heart, Strong Boundaries",
        category: "Healing & Connection",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: meditationCategory.contentColor,
        minutes: 14,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Soothing Wind Before Sleep",
        category: "Breathe & Begin",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: meditationCategory.contentColor,
        minutes: 10,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Gentle Morning Start",
        category: "Sleep & Rest",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: meditationCategory.contentColor,
        minutes: 7,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Quiet Mind, Clear Focus",
        category: "Focus & Mind Support",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: meditationCategory.contentColor,
        minutes: 12,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Soft Heart, Strong Boundaries",
        category: "Healing & Connection",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: meditationCategory.contentColor,
        minutes: 14,
      ),
    ];
    return Obx(
      () => ListViewBuilderWidget(
        primary: false,
        padding: EdgeInsets.only(
          top: 24,
          bottom:
              meditationPlayerController.showFloatingMeditationPlayer.value
                  ? 200
                  : 120,
        ),
        itemBuilder: (context, index) {
          final audioDetails = audios[index];
          return AudioPalyerPreviewWidget(
            audioDetails: audioDetails,
            meditationCategory: meditationCategory,
          );
        },
        seperatorWidget: VerticalSpace8(),
        itemCount: audios.length,
      ),
    );
  }
}
