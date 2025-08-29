import 'package:auto_scroll_text/auto_scroll_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/route/route_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/screens/play_meditation_screen.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class AudioPalyerPreviewWidget extends StatelessWidget {
  final MeditationCategoryModel meditationCategory;
  final AudioPreviewModel audioDetails;
  final Color? backgroundColor;
  final Color? iconColor;
  final bool enableBorder;
  final bool enableIconBgColor;
  AudioPalyerPreviewWidget({
    super.key,
    this.backgroundColor,
    this.iconColor,
    this.enableBorder = true,
    this.enableIconBgColor = true,
    required this.audioDetails,
    required this.meditationCategory,
  });

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return InkWell(
      onTap: () {
        RouteController.push(context, PlayMeditationScreen.routePath, {
          "category": meditationCategory,
          "audioDetails": audioDetails,
        });
      },
      child: Container(
        width: ScreenSize.width(context),
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: backgroundColor ?? theme.inverseColor,
          border:
              enableBorder
                  ? Border.all(
                    width: 1.r,
                    color: audioDetails.iconColor.withValues(alpha: 0.05),
                  )
                  : null,
          borderRadius: BorderRadius.circular(28.r),
        ),
        child: Row(
          children: [
            ////icon
            Container(
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                color:
                    enableIconBgColor
                        ? audioDetails.iconColor.withValues(alpha: 0.05)
                        : null,
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Center(
                child: ImageIcon(
                  AssetImage(audioDetails.iconPath),
                  color: audioDetails.iconColor,
                  size: 36.r,
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
                    intervalSpaces: 10,
                    delayBefore: Duration(milliseconds: 500),
                    velocity: Velocity(pixelsPerSecond: Offset(20, 0)),
                    style: TypographyStyles.poppins60014Colored(
                      theme.primaryColor,
                    ),
                  ),
                ),

                VerticalSpace4(),
                /////duration and category
                Text(
                  audioDetails.category.isNotEmpty
                      ? "${audioDetails.minutes} min • ${audioDetails.category}"
                      : "${audioDetails.minutes} min",
                  style: TypographyStyles.poppins40012(),
                ),
              ],
            ),
            Spacer(),
            /////play button
            CircleAvatar(
              radius: 19.r,
              backgroundColor: audioDetails.iconColor.withValues(alpha: 0.05),
              child: Center(
                child: Icon(
                  Icons.play_arrow_rounded,
                  size: 24.r,
                  color: theme.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
