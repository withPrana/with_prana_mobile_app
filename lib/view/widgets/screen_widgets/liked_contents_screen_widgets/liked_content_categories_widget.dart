// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:with_prana_mobile_app/controller/liked_contents_controller.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';

class LikedContentCategoriesWidget extends StatelessWidget {
  final LikedContentsController likedContentsController;
  final ThemeController themeController;
  const LikedContentCategoriesWidget({
    super.key,
    required this.likedContentsController,
    required this.themeController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return SizedBox(
      height: 32.h,
      child: OverflowBox(
        maxWidth: ScreenSize.width(context),
        maxHeight: 32.h,
        minHeight: 0,
        minWidth: 0,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemBuilder: (context, index) {
            return Obx(() {
              final category = likedContentsController.categories.value[index];
              final isSelected =
                  likedContentsController.selectedCategory.value == category;

              return InkWell(
                onTap: () {
                  likedContentsController.selectCategory(category);
                },
                child: AnimatedContainer(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.r,
                    horizontal: 10.r,
                  ),
                  duration: Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color:
                        isSelected
                            ? theme.primaryLightColor
                            : theme.inverseColor,
                    border:
                        isSelected
                            ? Border.all(color: theme.primaryColor)
                            : null,
                    borderRadius: BorderRadius.circular(200.w),
                  ),
                  child: Center(
                    child: Text(
                      category,
                      style:
                          isSelected
                              ? TypographyStyles.poppins40010PrimaryColored()
                              : TypographyStyles.poppins40010(),
                    ),
                  ),
                ),
              );
            });
          },
          separatorBuilder: (context, index) => SizedBox(width: 8.r),
          itemCount: 5,
        ),
      ),
    );
  }
}
