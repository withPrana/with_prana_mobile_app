// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/user_account_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/route/route_controller.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/view/screens/link_web_screen.dart';
import 'package:with_prana_mobile_app/view/screens/notification_screen.dart';

class HomeTopBarWidget extends StatelessWidget {
  final HomeController homeController;
  final UserAccountController userAccountController;
  final ColorPalette theme;
  const HomeTopBarWidget({
    super.key,
    required this.homeController,
    required this.theme,
    required this.userAccountController,
  });

  @override
  Widget build(BuildContext context) {
    ////
    void showDropdownMenu(BuildContext context) {
      showMenu(
        context: context,
        position: RelativeRect.fromLTRB(100.0, 100.0, 0.0, 0.0),
        menuPadding: EdgeInsets.only(left: 10.r, right: 10.r),
        constraints: BoxConstraints(maxWidth: 205.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
          side: BorderSide(color: theme.disabledLightColor),
        ),
        color: theme.inverseColor,
        items: [
          homeMenuItem(
            menuIconPath: IconConstants.icHomeMenuNotifications,
            menuName: "Notifications",
            menuScreenPath: NotificationScreen.routePath,
          ),
          _customPopupMenuDivider(),
          homeMenuItem(
            menuIconPath: IconConstants.icHomeMenuUseOnYourComputer,
            menuName: "Use on your computer",
            menuScreenPath: LinkWebScreen.routePath,
          ),
        ],
        elevation: 8.0,
      ).then((value) {
        if (value != null) {
          RouteController.push(context, value);
        }
      });
    }

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
                Obx(
                  () => Text(
                    "${homeController.getGreeting()}, ${userAccountController.userDetails.value.name ?? ''}",
                    style: TypographyStyles.poppins40012Colored(
                      theme.textDarkColor,
                    ),
                  ),
                ),
              ],
            ),
          ),

          InkWell(
            onTap: () {
              showDropdownMenu(context);
            },
            child: ImageIcon(
              AssetImage(IconConstants.icFlower),
              color: theme.textDarkColor,
              size: 24.r,
            ),
          ),
        ],
      ),
    );
  }

  PopupMenuItem<String> homeMenuItem({
    required String menuIconPath,
    required String menuName,
    required String menuScreenPath,
  }) {
    return PopupMenuItem<String>(
      value: menuScreenPath,
      child: Row(
        spacing: 8.r,
        children: [
          ImageIcon(
            AssetImage(menuIconPath),
            size: 20.r,
            color: theme.textDarkColor,
          ),
          Text(
            menuName,
            style: TypographyStyles.poppins40012Colored(theme.textDarkColor),
          ),
        ],
      ),
    );
  }

  PopupMenuEntry<String> _customPopupMenuDivider() {
    return PopupMenuDivider(height: 1.0);
  }
}
