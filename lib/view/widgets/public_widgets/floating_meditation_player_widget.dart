import 'package:auto_scroll_text/auto_scroll_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/meditation_player_controller.dart';
import 'package:with_prana_mobile_app/core/route/route_controller.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
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
      final meditationCategory =
          meditationPlayerController.lastPlayedMeditationCategory.value;
      final audioDetails =
          meditationPlayerController.lastPlayedAudioDetails.value;
      final audioPosition = meditationPlayerController.audioPosition.value;
      final lastPlayedAudioId =
          meditationPlayerController.lastPlayedAudioId.value;
      if (audioDetails == null ||
          meditationCategory == null ||
          lastPlayedAudioId.isEmpty) {
        return SizedBox();
      } else {
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
              padding: EdgeInsets.all(10.r),
              margin: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color: meditationCategory.contentColor,
                border: Border.all(
                  width: 1.r,
                  color: audioDetails.iconColor.withValues(alpha: 0.2),
                ),
                borderRadius: BorderRadius.circular(20.r),
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
                            AssetImage(audioDetails.iconPath),
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
                            width: 160.w,
                            child: AutoScrollText(
                              audioDetails.title,
                              curve: Curves.easeInOut,
                              intervalSpaces: 20,
                              delayBefore: Duration(milliseconds: 500),
                              velocity: Velocity(
                                pixelsPerSecond: Offset(40, 0),
                              ),
                              style: TypographyStyles.poppinsBold12Inverse(),
                            ),
                          ),

                          VerticalSpace4(),
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
                                color: meditationCategory.contentColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  VerticalSpace8(),
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
