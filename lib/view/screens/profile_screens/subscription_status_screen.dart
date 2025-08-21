import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/bottom_navigation_bar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_appbar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_screen_layout_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/subscription_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/subscription_screen_widget.dart/subscription_plans_widget.dart';

class SubscriptionStatusScreen extends StatelessWidget {
  static const routePath = "/subscription-status";
  SubscriptionStatusScreen({super.key});

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return MainScreenLayoutWidget(
      appBar: MainAppbarWidget(name: "Subscription Status"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You’re on the Free Plan",
              style: TypographyStyles.snigletNormal24Colored(
                theme.secondaryColor,
              ),
            ),
            VerticalSpace8(),
            Text(
              "You currently have limited access to meditations.",
              style: TypographyStyles.poppins40014(),
            ),
            VerticalSpace24(),
            Text(
              "What you are missing",
              style: TypographyStyles.sniglet40016Colored(theme.primaryColor),
            ),
            VerticalSpace8(),
            SubscriptionWidget(showButton: false),
            VerticalSpace24(),
            SubscriptionPlansWidget(theme: theme),
            VerticalBottomNavigationBarSpace(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(navigate: true),
    );
  }
}
