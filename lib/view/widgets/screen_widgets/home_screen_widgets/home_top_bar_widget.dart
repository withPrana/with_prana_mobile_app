import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:with_prana_mobile_app/controller/home_controller.dart';
import 'package:with_prana_mobile_app/controller/login_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';

class HomeTopBarWidget extends StatelessWidget {
  final HomeController homeController;
  final LoginController loginController;
  final ColorPalette theme;
  const HomeTopBarWidget({
    super.key,
    required this.homeController,
    required this.theme,
    required this.loginController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 64.r,
        bottom: 16.r,
      ),
      decoration: BoxDecoration(
        color: theme.primaryLightColor,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.8, 1],
          colors: [
            theme.primaryScreenGradient[0],
            theme.primaryScreenGradient[0].withValues(alpha: 0),
          ],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ////Daily wishes like good morning, afternoon, etc
          Container(
            padding: EdgeInsets.symmetric(vertical: 6.r, horizontal: 10.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500.r),
              color: theme.inverseColor.withValues(alpha: 0.25),
            ),
            child: Row(
              spacing: 5.r,
              children: [
                ImageIcon(
                  AssetImage(IconConstants.icMorning),
                  size: 18.r,
                  color: theme.textColor,
                ),
                Text(
                  "${homeController.getGreeting()}, ${loginController.nameController.text.trim()}",
                  style: TypographyStyles.poppins40012Dark(),
                ),
              ],
            ),
          ),
          ImageIcon(
            AssetImage(IconConstants.icFlower),
            color: theme.textDarkColor,
            size: 24.r,
          ),
        ],
      ),
    );
  }
}
