// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/home_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/audio_palyer_preview_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/layout_widgets/list_view_builder_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class ListenAgainSectionWidget extends StatelessWidget {
  ListenAgainSectionWidget({super.key});

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Listen Again", style: TypographyStyles.sniglet40014()),
        VerticalSpace8(),
        Obx(
          () => ListViewBuilderWidget(
            itemCount: homeController.listenAgainAudios.value.length,
            itemBuilder: (context, index) {
              final audioDetails =
                  homeController.listenAgainAudios.value[index];
              return AudioPalyerPreviewWidget(audioDetails: audioDetails);
            },
            seperatorWidget: VerticalSpace8(),
          ),
        ),
      ],
    );
  }
}
