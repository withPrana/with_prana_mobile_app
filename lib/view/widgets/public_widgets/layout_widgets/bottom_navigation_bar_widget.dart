import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/home_controller.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/screens/home_screen.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class BottomNavigationItemModel {
  String iconPath;
  String name;
  int index;
  String routePath;

  BottomNavigationItemModel({
    required this.iconPath,
    required this.name,
    required this.index,
    required this.routePath,
  });
}

class BottomNavigationBarWidget extends StatelessWidget {
  BottomNavigationBarWidget({super.key});

  final themeController = Get.find<ThemeController>();
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final bottomNavigationItems = [
      BottomNavigationItemModel(
        iconPath: IconConstants.icBottomNavHome,
        name: "Home",
        index: 0,
        routePath: HomeScreen.routePath,
      ),
      BottomNavigationItemModel(
        iconPath: IconConstants.icBottomNavDownloads,
        name: "Downloads",
        index: 1,
        routePath: HomeScreen.routePath,
      ),
      BottomNavigationItemModel(
        iconPath: IconConstants.icBottomNavMyLirary,
        name: "My Library",
        index: 2,
        routePath: HomeScreen.routePath,
      ),
      BottomNavigationItemModel(
        iconPath: IconConstants.icBottomNavLiked,
        name: "Liked",
        index: 3,
        routePath: HomeScreen.routePath,
      ),
      BottomNavigationItemModel(
        iconPath: IconConstants.icBottomNavProfile,
        name: "Profile",
        index: 4,
        routePath: HomeScreen.routePath,
      ),
    ];

    final theme = themeController.appTheme.value!;
    return Container(
      width: ScreenSize.width(context),
      height: 88.h,
      padding: EdgeInsets.only(top: 12.h, bottom: 24.h),
      decoration: BoxDecoration(
        color: theme.inverseColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
        border: Border(top: BorderSide(color: theme.disabledLightColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(
          5,
          (index) => bottomNavigationItem(bottomNavigationItems[index], theme),
        ),
      ),
    );
  }

  Widget bottomNavigationItem(
    BottomNavigationItemModel item,
    ColorPalette theme,
  ) {
    return Obx(() {
      final isSelected = homeController.currentIndex.value == item.index;
      return InkWell(
        onTap: () {
          homeController.changeBottomNavScreenIndex(item.index);
        },
        child: SizedBox(
          width: 60.r,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              isSelected
                  ? TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.5, end: 1),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutBack,
                    builder:
                        (context, scale, child) => Transform.scale(
                          scale: scale,
                          child: Container(
                            padding: EdgeInsets.all(8.r),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.selectedBottomNavigationItemColor,
                            ),
                            child: Align(
                              child: ImageIcon(
                                AssetImage(item.iconPath),
                                size: 18.r,
                                color:
                                    isSelected
                                        ? theme.primaryColor
                                        : theme.disabledColor,
                              ),
                            ),
                          ),
                        ),
                  )
                  : ImageIcon(
                    AssetImage(item.iconPath),
                    size: 18.r,
                    color:
                        isSelected ? theme.primaryColor : theme.disabledColor,
                  ),
              isSelected ? VerticalSpace2() : VerticalSpace8(),
              Text(
                item.name,
                style:
                    isSelected
                        ? TypographyStyles.poppinsNormal10PrimaryColored()
                        : TypographyStyles.poppinsNormal10Disabled(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
