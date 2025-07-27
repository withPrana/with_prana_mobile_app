import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/home_controller.dart';
import 'package:with_prana_mobile_app/controller/login_controller.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/controller/user_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/route/route_controller.dart';
import 'package:with_prana_mobile_app/view/screens/profile_screens/subscription_status_screen.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/profile_screen_widgets/profile_appbar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/profile_screen_widgets/profile_menu_group_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/profile_screen_widgets/profile_menu_item_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final themeController = Get.find<ThemeController>();
  final userController = Get.find<UserController>();
  final loginController = Get.find<LoginController>();
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        homeController.changeBottomNavScreenIndex(0);
      },
      child: Scaffold(
        backgroundColor: theme.inverseColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(300.h),
          child: ProfileApparWidget(
            theme: theme,
            userController: userController,
            loginController: loginController,
            homeController: homeController,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                VerticalSpace24(),
                ////menu group 1
                ProfileMenuGroupWidget(
                  menuList: [
                    ProfileMenuItemWidget(
                      iconPath: IconConstants.icProfileMenuSubscriptionStatus,
                      menuName: "Subscription Status",
                      theme: theme,
                      badge: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 2.r,
                          horizontal: 8.r,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          border: Border.all(color: Color(0xffF58E05)),
                        ),
                        child: Center(
                          child: Text(
                            "Free Plan",
                            style: TextStyle(
                              fontSize: 10.r,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffF58E05),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        RouteController.push(
                          context,
                          SubscriptionStatusScreen.routePath,
                        );
                      },
                    ),
                    ProfileMenuItemWidget(
                      iconPath: IconConstants.icProfileMenuAccoutInfo,
                      menuName: "Account Info",
                      theme: theme,
                      onTap: () {},
                    ),
                  ],
                  theme: theme,
                ),
                VerticalSpace10(),
                ////menu group 2
                ProfileMenuGroupWidget(
                  menuList: [
                    ProfileMenuItemWidget(
                      iconPath: IconConstants.icProfileMenuDownloads,
                      menuName: "Downloads",
                      theme: theme,
                      onTap: () {},
                    ),
                    ProfileMenuItemWidget(
                      iconPath: IconConstants.icProfileMenuFavorites,
                      menuName: "Favorites",
                      theme: theme,
                      onTap: () {},
                    ),
                    ProfileMenuItemWidget(
                      iconPath: IconConstants.icProfileMenuNotifications,
                      menuName: "Notifications",
                      theme: theme,
                      onTap: () {},
                    ),
                  ],
                  theme: theme,
                ),
                VerticalSpace10(),
                ////menu group 3
                ProfileMenuGroupWidget(
                  menuList: [
                    ProfileMenuItemWidget(
                      iconPath: IconConstants.icProfileMenuContactSupport,
                      menuName: "Contact Support",
                      theme: theme,
                      onTap: () {},
                    ),
                    ProfileMenuItemWidget(
                      iconPath: IconConstants.icProfileMenuTermsAndPrivacy,
                      menuName: "Terms & Privacy",
                      theme: theme,
                      onTap: () {},
                    ),
                  ],
                  theme: theme,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
