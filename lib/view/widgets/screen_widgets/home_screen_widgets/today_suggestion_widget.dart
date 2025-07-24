import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:with_prana_mobile_app/controller/login_controller.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/gradient_image_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/home_screen_widgets/play_today_suggestion_button_widget.dart';

class TodaySuggestionWidget extends StatelessWidget {
  final ColorPalette theme;
  final LoginController loginController;
  const TodaySuggestionWidget({
    super.key,
    required this.theme,
    required this.loginController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenSize.width(context),
      height: 280.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -120.h,
            left: -24.w,
            right: -24.w,
            child: SizedBox(
              height: 420.h,
              child: OverflowBox(
                maxWidth: ScreenSize.width(context) + 48.w,
                maxHeight: 420.h,
                child: GradientImageWidget(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.4, 1],
                    colors: [
                      theme.primaryScreenGradient[0],
                      theme.primaryScreenGradient[0],
                    ],
                  ),
                  width: ScreenSize.width(context),
                  image: AssetImage(ImageConstants.imgFlower),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 12.r,
            child: Column(
              children: [
                ////Today's suggestion
                Text(
                  "Today’s Suggestion",
                  style: TypographyStyles.poppins40010Dark(),
                ),
                Text(
                  "Inhale peace,\nexhale tension.",
                  textAlign: TextAlign.center,
                  style: TypographyStyles.sniglet40034secondaryColored(),
                ),
                VerticalSpace8(),
                PlayTodaySuggestionButtonWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
