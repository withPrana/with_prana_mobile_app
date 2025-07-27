import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';

class MainAppbarWidget extends StatelessWidget {
  final String name;
  final bool isInverse;
  MainAppbarWidget({super.key, this.isInverse = false, required this.name});

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return AppBar(
      toolbarHeight: 72.r,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      forceMaterialTransparency: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Row(
        spacing: 16.r,
        children: [
          ////back button
          Container(
            width: 24.r,
            height: 24.r,
            decoration: BoxDecoration(
              color: theme.inverseColor,
              border: Border.all(color: theme.disabledLightestColor),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: Center(
              child: ImageIcon(
                AssetImage(IconConstants.icArrowBack),
                size: 14.r,
                color: Colors.black,
              ),
            ),
          ),
          Text(
            name,
            style:
                isInverse
                    ? TypographyStyles.poppinsBold14Inverse()
                    : TypographyStyles.poppinsBold14DarkColored(),
          ),
        ],
      ),
    );
  }
}
