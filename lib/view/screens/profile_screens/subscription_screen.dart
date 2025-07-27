import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_appbar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/gradient_image_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/subscription_features_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/subscription_screen_widget.dart/subscription_plans_widget.dart';

class SubscriptionScreen extends StatelessWidget {
  static const routePath = "subscription";
  SubscriptionScreen({super.key});

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return Scaffold(
      backgroundColor: theme.inverseColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(390.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: theme.primaryLightColor,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40.r)),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                Positioned.fill(
                  child: GradientImageWidget(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: theme.primaryScreenGradient,
                    ),
                    image: AssetImage(ImageConstants.imgLoop),
                  ),
                ),
                Column(
                  children: [
                    MainAppbarWidget(name: "Subscription Page"),
                    Text(
                      "Unlock Your Premium Experience",
                      textAlign: TextAlign.center,
                      style: TypographyStyles.snigletNormal24secondaryColored(),
                    ),
                    VerticalSpace8(),
                    Text(
                      "Go deeper into calm, connection, and clarity with full access.",
                      textAlign: TextAlign.center,
                      style: TypographyStyles.poppins40014(),
                    ),
                    VerticalSpace24(),
                    Container(
                      width: ScreenSize.width(context),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.r,
                        vertical: 20.r,
                      ),
                      decoration: BoxDecoration(
                        color: theme.inverseColor,
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: SubscriptionFeaturesWidget(
                        theme: theme,
                        contentColor: theme.textDarkColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              VerticalSpace24(),
              SubscriptionPlansWidget(theme: theme),
              VerticalSpace24(),
              Text(
                "Secure payments via Apple / Google",
                style: TypographyStyles.poppins40010SecondaryColored(),
              ),
              VerticalSpace24(),
            ],
          ),
        ),
      ),
    );
  }
}
