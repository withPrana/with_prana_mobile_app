import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/meditation_player_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/hex_to_color.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/models/category_models/category_models.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class AudioPlayerControllerWidget extends StatelessWidget {
  final ColorPalette theme;
  final CategoryResponseModel meditationCategory;
  final MeditationPlayerController meditationPlayerController;
  final AudioPreviewModel audioDetails;
  const AudioPlayerControllerWidget({
    super.key,
    required this.theme,
    required this.meditationCategory,
    required this.meditationPlayerController,
    required this.audioDetails,
  });

  @override
  Widget build(BuildContext context) {
    final contentColor = hexToColor(
      hex: meditationCategory.color ?? '',
      theme: theme,
    );
    final bgColor = contentColor.withValues(alpha: 0.1);
    return Container(
      width: ScreenSize.width(context),
      height: 175.r,
      padding: EdgeInsets.symmetric(horizontal: 40.r, vertical: 30.r),
      decoration: BoxDecoration(
        color: theme.inverseColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.1),
            blurRadius: 10.r,
          ),
        ],
      ),
      child: Column(
        children: [
          Obx(
            () => Slider(
              padding: EdgeInsets.zero,
              thumbColor: contentColor,
              activeColor: contentColor,
              inactiveColor: bgColor,
              value:
                  meditationPlayerController.audioPosition.value.inSeconds
                      .toDouble(),
              min: 0,
              max: meditationPlayerController.audioDuration.value.inSeconds
                  .toDouble()
                  .clamp(0, double.infinity),
              onChanged: (value) {
                print(value.toString);
                meditationPlayerController.seekAudio(value.toInt());
              },
            ),
          ),
          VerticalSpace12(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Text(
                  meditationPlayerController.formattedAudioPosition(),
                  style: TypographyStyles.poppins40012(),
                ),
              ),
              Obx(
                () => Text(
                  meditationPlayerController.formattedAudioDuration(),
                  style: TypographyStyles.poppins40012(),
                ),
              ),
            ],
          ),
          VerticalSpace24(),
          LayoutBuilder(
            builder: (context, constraints) {
              final maxWidth = constraints.maxWidth;
              final itemWidth = maxWidth / 3;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Restart button
                  SizedBox(
                    width: itemWidth,
                    child: InkWell(
                      onTap: () {
                        meditationPlayerController.restartAudio();
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: itemWidth - (88.w)),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.r,
                          vertical: 6.r,
                        ),
                        decoration: BoxDecoration(
                          color: bgColor,
                          border: Border.all(color: contentColor, width: 1.r),
                          borderRadius: BorderRadius.circular(200.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ImageIcon(
                              AssetImage(IconConstants.icRestartAudio),
                              size: 18.r,
                              color: contentColor,
                            ),
                            Text(
                              "Restart",
                              style: TypographyStyles.poppins40012Colored(
                                contentColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// Play/pause button
                  SizedBox(
                    width: itemWidth,
                    child: Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          meditationPlayerController
                              .playAndPauseMeditationAudio(
                                meditationCategory: meditationCategory,
                                audioDetails: audioDetails,
                                playBgAudio: false,
                              );
                        },
                        child: Container(
                          width: 48.r,
                          height: 48.r,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: contentColor,
                          ),
                          child: Center(
                            child: Obx(
                              () => Icon(
                                meditationPlayerController.isPlaying.value
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: theme.inverseColor,
                                size: 24.r,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  /// Add to library button
                  SizedBox(
                    width: itemWidth,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        child: ImageIcon(
                          AssetImage(IconConstants.icAddToLibrary),
                          color: contentColor,
                          size: 24.r,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
