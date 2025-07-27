import 'package:flutter/material.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_appbar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_screen_layout_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/home_screen_widgets/subscription_widget.dart';

class SubscriptionStatusScreen extends StatelessWidget {
  static const routePath = "subscription-status";
  const SubscriptionStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScreenLayoutWidget(
      enableAnimation: false,
      appBar: MainAppbarWidget(name: "Subscription Status"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You’re on the Free Plan",
              style: TypographyStyles.snigletNormal24secondaryColored(),
            ),
            VerticalSpace8(),
            Text(
              "You currently have limited access to meditations.",
              style: TypographyStyles.poppins40014(),
            ),
            VerticalSpace24(),
            Text(
              "What you are missing",
              style: TypographyStyles.sniglet40016PrimaryColored(),
            ),
            VerticalSpace8(),
            SubscriptionWidget(),
          ],
        ),
      ),
    );
  }
}
