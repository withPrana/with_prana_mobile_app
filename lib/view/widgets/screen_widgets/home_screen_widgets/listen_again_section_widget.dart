// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/models/category_models/category_models.dart';
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
        thumbnail: "",
        title: "Soothing Wind Before Sleep",
        category: "Breathe & Begin",
        iconColor: Color(0xffCCD3FF),
        minutes: 10,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewTwo,
        thumbnail: "",
        title: "Gentle Morning Start",
        category: "Sleep & Rest",
        iconColor: Color(0xffFCCCFF),
        minutes: 7,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewThree,
        thumbnail: "",
        title: "Quiet Mind, Clear Focus",
        category: "Focus & Mind Support",
        iconColor: Color(0xffBAE2BA),
        minutes: 12,
      ),
      AudioPreviewModel(
        iconPath: ImageConstants.imgAudioPreviewFour,
        thumbnail: "",
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
              meditationCategory: CategoryResponseModel(),
              audioDetails: audioDetails);
          },
          seperatorWidget: VerticalSpace8(),
        ),
      ],
    );
  }
}
