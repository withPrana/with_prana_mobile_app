import 'package:flutter/material.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/list_view_builder_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/audio_palyer_preview_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class MeditationCategoryAudiosWidget extends StatelessWidget {
  final MeditationCategoryModel meditationCategory;
  const MeditationCategoryAudiosWidget({
    super.key,
    required this.meditationCategory,
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
        iconColor: Color(0xffCCD3FF),
        minutes: 10,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Gentle Morning Start",
        category: "Sleep & Rest",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: Color(0xffFCCCFF),
        minutes: 7,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Quiet Mind, Clear Focus",
        category: "Focus & Mind Support",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: Color(0xffBAE2BA),
        minutes: 12,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Soft Heart, Strong Boundaries",
        category: "Healing & Connection",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: Color(0xffFFCDC9),
        minutes: 14,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Soothing Wind Before Sleep",
        category: "Breathe & Begin",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: Color(0xffCCD3FF),
        minutes: 10,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Gentle Morning Start",
        category: "Sleep & Rest",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: Color(0xffFCCCFF),
        minutes: 7,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Quiet Mind, Clear Focus",
        category: "Focus & Mind Support",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: Color(0xffBAE2BA),
        minutes: 12,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Soft Heart, Strong Boundaries",
        category: "Healing & Connection",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: Color(0xffFFCDC9),
        minutes: 14,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Soothing Wind Before Sleep",
        category: "Breathe & Begin",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: Color(0xffCCD3FF),
        minutes: 10,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Gentle Morning Start",
        category: "Sleep & Rest",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: Color(0xffFCCCFF),
        minutes: 7,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Quiet Mind, Clear Focus",
        category: "Focus & Mind Support",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: Color(0xffBAE2BA),
        minutes: 12,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Soft Heart, Strong Boundaries",
        category: "Healing & Connection",
        description:
            "Get comfortable in bed, dim the lights, and press play. Let the sound gently carry you into stillness.",
        iconColor: Color(0xffFFCDC9),
        minutes: 14,
      ),
    ];
    return ListViewBuilderWidget(
      primary: false,
      padding: EdgeInsets.symmetric(vertical: 24),
      itemBuilder: (context, index) {
        final audioDetails = audios[index];
        return AudioPalyerPreviewWidget(
          audioDetails: audioDetails,
          meditationCategory: meditationCategory,
        );
      },
      seperatorWidget: VerticalSpace8(),
      itemCount: audios.length,
    );
  }
}
