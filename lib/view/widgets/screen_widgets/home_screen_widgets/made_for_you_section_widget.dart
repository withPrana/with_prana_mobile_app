// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/liked_contents_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/content_with_image_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class MadeForYouSectionWidget extends HookWidget {
  final ThemeController themeController;
  final HomeController homeController;
  final LikedContentsController likedContentsController;

  const MadeForYouSectionWidget({
    super.key,
    required this.themeController,
    required this.homeController,
    required this.likedContentsController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Made Just for You", style: TypographyStyles.sniglet40016()),
        VerticalSpace8(),
        SizedBox(
          height: 260.r,
          child: OverflowBox(
            maxHeight: 260.r,
            maxWidth: ScreenSize.width(context),
            minHeight: 0,
            minWidth: 0,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Obx(() {
                  final content =
                      homeController.madeForYouContents.value[index];
                  return Obx(
                    () => ContentWithImageWidget(
                      theme: theme,
                      content: content,
                      isLiked: likedContentsController.likedContents.value
                          .contains(content),
                      onLiked: () {
                        likedContentsController.likeContent(content);
                      },
                    ),
                  );
                });
              },
              separatorBuilder: (context, index) => SizedBox(width: 10.r),
              itemCount: homeController.madeForYouContents.value.length,
            ),
          ),
        ),
      ],
    );
  }
}
