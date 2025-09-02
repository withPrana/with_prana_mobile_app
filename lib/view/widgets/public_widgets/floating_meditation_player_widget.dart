import 'package:auto_scroll_text/auto_scroll_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/meditation_player_controller.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/route/route_controller.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/hex_to_color.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/screens/play_meditation_screen.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class FloatingMeditationPlayerWidget extends StatelessWidget {
  final MeditationPlayerController meditationPlayerController;
  final ColorPalette theme;
  const FloatingMeditationPlayerWidget({
    super.key,
    required this.theme,
    required this.meditationPlayerController,
  });

  @override
  Widget build(BuildContext context) {
    ///////////
    return Obx(() {
      ////////
      final meditationCategory =
          meditationPlayerController.lastPlayedMeditationCategory.value;
      final audioDetails =
          meditationPlayerController.lastPlayedAudioDetails.value;
      final audioPosition = meditationPlayerController.audioPosition.value;
      final lastPlayedAudioId =
          meditationPlayerController.lastPlayedAudioId.value;
      /////////
      if (audioDetails == null ||
          meditationCategory == null ||
          lastPlayedAudioId.isEmpty) {
        return SizedBox();
      } else {
        final contentColor = hexToColor(
          hex: meditationCategory.color ?? '',
          theme: theme,
        );
        ////////
        return Dismissible(
          key: Key("floating-player$lastPlayedAudioId"),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            meditationPlayerController.removeFloatingMediationPlayer();
          },
          child: InkWell(
            onTap: () {
              RouteController.push(context, PlayMeditationScreen.routePath, {
                "category": meditationCategory,
                "audioDetails": audioDetails,
                "startingPoint": audioPosition,
              });
            },
            child: Container(
              width: ScreenSize.width(context),
              padding: EdgeInsets.symmetric(horizontal: 4.r, vertical: 2.r),
              margin: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: contentColor,
                border: Border.all(
                  width: 1.r,
                  color: audioDetails.iconColor.withValues(alpha: 0.2),
                ),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      ////icon
                      Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: BoxDecoration(
                          color: theme.inverseColor,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child: ImageIcon(
                            AssetImage(ImageConstants.imgAudioPreviewOne),
                            color: audioDetails.iconColor,
                            size: 24.r,
                          ),
                        ),
                      ),
                      SizedBox(width: 14.r),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /////title
                          SizedBox(
                            width: 180.w,
                            child: AutoScrollText(
                              audioDetails.title,
                              curve: Curves.easeInOut,
                              intervalSpaces: 10,
                              delayBefore: Duration(milliseconds: 500),
                              velocity: Velocity(
                                pixelsPerSecond: Offset(20, 0),
                              ),
                              style: TypographyStyles.poppinsBold12Inverse(),
                            ),
                          ),

                          // VerticalSpace2(),
                          /////duration and category
                          Text(
                            audioDetails.category,
                            style: TypographyStyles.poppins40010Inverse(),
                          ),
                        ],
                      ),
                      Spacer(),
                      SizedBox(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_outline,
                            color: theme.inverseColor,
                            size: 24.r,
                          ),
                        ),
                      ),
                      /////play button
                      InkWell(
                        onTap: () {
                          meditationPlayerController
                              .playAndPauseMeditationAudio(
                                meditationCategory: meditationCategory,
                                audioDetails: audioDetails,
                                playBgAudio: true,
                              );
                        },
                        child: CircleAvatar(
                          radius: 14.r,
                          backgroundColor: theme.inverseColor,
                          child: Center(
                            child: Obx(
                              () => Icon(
                                meditationPlayerController.isPlaying.value
                                    ? Icons.pause
                                    : Icons.play_arrow_rounded,
                                size: 16.r,
                                color: contentColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  VerticalSpace4(),
                  LayoutBuilder(
                    builder:
                        (context, constraints) => SizedBox(
                          width: constraints.maxWidth - 100,
                          child: LinearProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                              theme.inverseColor,
                            ),
                            backgroundColor: theme.disabledColor,
                            borderRadius: BorderRadius.circular(500),
                            value:
                                meditationPlayerController
                                    .audioPosition
                                    .value
                                    .inSeconds /
                                meditationPlayerController
                                    .audioDuration
                                    .value
                                    .inSeconds,
                          ),
                        ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
