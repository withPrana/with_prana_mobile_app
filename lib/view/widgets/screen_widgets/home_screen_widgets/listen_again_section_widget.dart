// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/audio_palyer_preview_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/list_view_builder_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class ListenAgainSectionWidget extends StatelessWidget {
  const ListenAgainSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final listenAgainAudios = [
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewOne,
        title: "Soothing Wind Before Sleep",
        category: "Breathe & Begin",
        iconColor: Color(0xffCCD3FF),
        minutes: 10,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewTwo,
        title: "Gentle Morning Start",
        category: "Sleep & Rest",
        iconColor: Color(0xffFCCCFF),
        minutes: 7,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewThree,
        title: "Quiet Mind, Clear Focus",
        category: "Focus & Mind Support",
        iconColor: Color(0xffBAE2BA),
        minutes: 12,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewFour,
        title: "Soft Heart, Strong Boundaries",
        category: "Healing & Connection",
        iconColor: Color(0xffFFCDC9),
        minutes: 14,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Listen Again", style: TypographyStyles.sniglet40016()),
        VerticalSpace8(),
        ListViewBuilderWidget(
          itemCount: listenAgainAudios.length,
          itemBuilder: (context, index) {
            final audioDetails = listenAgainAudios[index];
            return AudioPalyerPreviewWidget(
              meditationCategory: MeditationCategoryModel(
                  iconPath: IconConstants.icMeditationCategoryTwo,
                  name: 'Sleep\n& Rest',
                  color: const Color(0xFFF8F9FF),
                  contentColor: const Color(0xFF545C90),
                ),
              audioDetails: audioDetails);
          },
          seperatorWidget: VerticalSpace8(),
        ),
      ],
    );
  }
}
