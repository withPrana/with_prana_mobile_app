import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/meditation_player_controller.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/utils/hex_to_color.dart';
import 'package:with_prana_mobile_app/models/category_models/category_models.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/list_view_builder_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/audio_palyer_preview_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/loader_widgets/no_data_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class MeditationCategoryAudiosWidget extends StatelessWidget {
  final CategoryResponseModel meditationCategory;
  final CategoryByIdResponseModel? meditationCategoryById;
  final MeditationPlayerController meditationPlayerController;
  final ColorPalette theme;
  const MeditationCategoryAudiosWidget({
    super.key,
    required this.meditationCategory,
    required this.meditationCategoryById,
    required this.meditationPlayerController,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    if (meditationCategoryById == null ||
        (meditationCategoryById?.meditations ?? []).isEmpty) {
      return NoDataWidget(message: "No meditations found", positionTop: 0);
    } else {
      final contentColor = hexToColor(
        hex: meditationCategory.color ?? '',
        theme: theme,
      );
      final audios =
          (meditationCategoryById!.meditations ?? []).map((meditation) {
            return AudioPreviewModel(
              id: meditation.id??'',
              audioUrl: meditation.link,
              description: meditation.description,
              thumbnail: meditation.thumbnail ?? '',
              iconPath: meditation.thumbnail ?? '',
              title: meditation.title ?? '',
              category: meditationCategory.name ?? '',
              iconColor: contentColor,
              minutes: meditation.duration ?? 0,
            );
          }).toList();
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
}
