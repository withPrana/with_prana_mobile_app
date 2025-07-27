import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/date_formatter.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/button_widgets/primary_button_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/content_and_action_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/subscription_features_widget.dart';

class SubscriptionWidget extends StatelessWidget {
  final VoidCallback? onSubscribeClicked;
  SubscriptionWidget({super.key, this.onSubscribeClicked});

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return ContentAndActionWidget(
      enableCustomContent: true,
      customContent: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageIcon(
            AssetImage(IconConstants.icUnlock),
            size: 16.r,
            color: theme.primaryColor,
          ),
          VerticalSpace10(),
          Text(
            "Unlock With Prana Premium",
            style: TypographyStyles.poppins60016PrimaryColored(),
          ),
          VerticalSpace10(),
          Text(
            "Experience deeper rest, healing, and clarity — anytime you need.",
            style: TypographyStyles.poppins40012PrimaryColored(),
          ),
          VerticalSpace24(),
          SubscriptionFeaturesWidget(theme: theme),
        ],
      ),
      actions: Column(
        children: [
          PrimaryButtonWidget(
            name: "Subscribe Now",
            onTap: onSubscribeClicked,
            isLoading: false,
          ),
          VerticalSpace10(),
          RichText(
            text: TextSpan(
              text: "*14-day free trial ends on ",
              style: TypographyStyles.poppins40010PrimaryColored(),
              children: [
                TextSpan(
                  text: DateFormatter.formatDate(
                    "${DateTime.now().add(Duration(days: 14))}",
                  ),
                  style: TypographyStyles.poppins60010PrimaryColored(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
