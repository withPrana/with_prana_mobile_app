import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:with_prana_mobile_app/controller/login_controller.dart';
import 'package:with_prana_mobile_app/controller/user_controller.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';

class ProfileImageAndNameWidget extends StatelessWidget {
  final ColorPalette theme;
  final UserController userController;
  final LoginController loginController;
  const ProfileImageAndNameWidget({
    super.key,
    required this.theme,
    required this.userController,
    required this.loginController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.r,
      child: Stack(
        children: [
          Container(
            width: 140.r,
            height: 140.r,
            // clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: theme.secondaryColor,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(
                color: theme.disabledLightestColor,
                width: 5.r,
              ),
            ),
            child: Obx(() {
              if (userController.userProfilePicture.value == null) {
                return Icon(
                  Icons.person,
                  color: theme.inverseColor,
                  size: 64.r,
                );
              } else {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(18.r),
                  child: Image.file(
                    userController.userProfilePicture.value!,
                    fit: BoxFit.cover,
                  ),
                );
              }
            }),
          ),
          Positioned(
            top: 125.r,
            right: 0,
            left: 0,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 4.r,
                children: [
                  imageSourceWidget(context, theme, ImageSource.camera),
                  imageSourceWidget(context, theme, ImageSource.gallery),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget imageSourceWidget(
    BuildContext context,
    ColorPalette theme,
    ImageSource source,
  ) {
    return InkWell(
      onTap: () {
        userController.selectProfileImage(context, source);
      },
      child: Container(
        width: 28.r,
        height: 24.r,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(5.r),
          border: Border.all(color: theme.inverseColor, width: 1.2.r),
          boxShadow: [
            BoxShadow(
              color: theme.disabledLightColor,
              blurRadius: 5.r,
              offset: Offset(0, 5.r),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            source == ImageSource.camera
                ? Icons.camera_alt_outlined
                : Icons.image_outlined,
            color: theme.inverseColor,
            size: 18.r,
          ),
        ),
      ),
    );
  }
}
