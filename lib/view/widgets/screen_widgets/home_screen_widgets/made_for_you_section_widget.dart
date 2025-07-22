// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:soft_edge_blur/soft_edge_blur.dart';
import 'package:with_prana_mobile_app/controller/home_controller.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class MadeForYouSectionWidget extends HookWidget {
  MadeForYouSectionWidget({super.key});

  final themeController = Get.find<ThemeController>();
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Made Just for You", style: TypographyStyles.sniglet40014()),
        VerticalSpace8(),
        SizedBox(
          height: 240.r,
          child: OverflowBox(
            maxHeight: 240.r,
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
                  return ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(26.r),
                    ),
                    child: Container(
                      width: 190.r,
                      height: 220.r,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 10.r,
                          color: theme.disabledLightColor,
                        ),
                        borderRadius: BorderRadius.circular(26.r),
                      ),
                      child: Stack(
                        children: [
                          ////image and blur effect
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(18.r),
                              child: SoftEdgeBlur(
                                edges: [
                                  EdgeBlur(
                                    type: EdgeType.bottomEdge,
                                    size: 120.r,
                                    sigma: 10,
                                    tintColor: Colors.black12,
                                    controlPoints: [
                                      ControlPoint(
                                        position: 0.5,
                                        type: ControlPointType.visible,
                                      ),
                                      ControlPoint(
                                        position: 1,
                                        type: ControlPointType.transparent,
                                      ),
                                    ],
                                  ),
                                ],
                                child: Image.asset(
                                  index % 2 == 0
                                      ? "assets/images/made_for_you_bg_image_one.jpg"
                                      : "assets/images/made_for_you_bg_image_two.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          ////
                          Padding(
                            padding: EdgeInsets.all(10.r),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Soft Heart, Strong Boundaries",
                                  style: TypographyStyles.poppins60012Inverse(),
                                ),
                                Text(
                                  "14 min • Healing & Connection",
                                  style: TypographyStyles.poppins4008Inverse(),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 10.r,
                            right: 10.r,
                            child: InkWell(
                              onTap: () {
                                homeController.likeContent(index);
                              },
                              child: CircleAvatar(
                                radius: 14.r,
                                backgroundColor:
                                    content.isLiked
                                        ? Colors.red
                                        : theme.inverseColor.withValues(
                                          alpha: 0.6,
                                        ),
                                child: Center(
                                  child: ImageIcon(
                                    AssetImage(IconConstants.icFavourite),
                                    size: 16.r,
                                    color:
                                        content.isLiked
                                            ? theme.inverseColor
                                            : theme.disabledColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ////
                        ],
                      ),
                    ),
                  );
                });
              },
              separatorBuilder: (context, index) => SizedBox(width: 10.r),
              itemCount: 4,
            ),
          ),
        ),
      ],
    );
  }
}
