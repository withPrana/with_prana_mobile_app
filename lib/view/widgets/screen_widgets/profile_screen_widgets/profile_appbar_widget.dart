import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:with_prana_mobile_app/controller/login_controller.dart';
import 'package:with_prana_mobile_app/controller/user_controller.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_appbar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/gradient_image_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/profile_screen_widgets/profile_image_and_name_widget.dart';

class ProfileApparWidget extends StatelessWidget {
  final ColorPalette theme;
  final UserController userController;
  final LoginController loginController;
  
  const ProfileApparWidget({
    super.key,
    required this.theme,
    required this.userController,
    required this.loginController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310.r,
      child: Stack(
        children: [
          Container(
            height: 200.r,
            clipBehavior: Clip.antiAlias,
            width: ScreenSize.width(context),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  theme.secondaryColor,
                  theme.secondaryColor.withValues(alpha: 0.8),
                ],
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40.r),
              ),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Transform.scale(
                    scale: 1.2,
                    child: GradientImageWidget(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          theme.inverseColor.withValues(alpha: 0.0),
                          theme.inverseColor.withValues(alpha: 0.2),
                        ],
                      ),
                      image: AssetImage(ImageConstants.imgLotusUpsideDown),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: MainAppbarWidget(name: "👤 Profile", isInverse: true),
                ),
              ],
            ),
          ),
          Positioned(
            top: 130.r,
            right: 0,
            left: 0,
            child: Center(
              child: ProfileImageAndNameWidget(
                userController: userController,
                loginController: loginController,
                theme: theme,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                loginController.nameController.text.trim(),
                style: TypographyStyles.sniglet40022(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
