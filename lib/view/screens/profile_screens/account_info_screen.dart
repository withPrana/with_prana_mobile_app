import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/user_account_controller.dart';
import 'package:with_prana_mobile_app/core/utils/callbacks.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/bottom_navigation_bar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_appbar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/normal_screen_layout_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/account_info_screen_widget/account_info_form_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/profile_screen_widgets/profile_image_and_name_widget.dart';

class AccountInfoScreen extends HookWidget {
  static const routePath = "/account-info";
  AccountInfoScreen({super.key});

  final themeController = Get.find<ThemeController>();
  final userAccountController = Get.find<UserAccountController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;

    useEffect(() {
      Callbacks.postFrameCallback((_) {
        userAccountController.initReset();
      });
      return null;
    }, []);

    return NormalScreenLayoutWidget(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: MainAppbarWidget(name: "Account Info"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: ScreenSize.width(context),
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                border: Border.all(color: theme.disabledLightColor),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /////
                  ProfileImageAndNameWidget(
                    theme: theme,
                    userAccountController: userAccountController,
                  ),
                  /////
                  AccountInfoFormWidget(theme: theme),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(navigate: true),
    );
  }
}
