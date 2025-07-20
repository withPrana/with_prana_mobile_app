import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/date_formatter.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/button_widgets/primary_button_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/content_and_action_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class SubscriptionWidget extends StatelessWidget {
  SubscriptionWidget({super.key});

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
            style: TypographyStyles.poppins40010PrimaryColored(),
          ),
          VerticalSpace24(),
          subscriptionFeaturesWidget(theme),
        ],
      ),
      actions: Column(
        children: [
          PrimaryButtonWidget(
            name: "Subscribe Now",
            onTap: null,
            isLoading: false,
          ),
          VerticalSpace10(),
          RichText(
            text: TextSpan(
              text: "*14-day free trial ends on ",
              style: TypographyStyles.poppins4008PrimaryColored(),
              children: [
                TextSpan(
                  text: DateFormatter.formatDate(
                    "${DateTime.now().add(Duration(days: 14))}",
                  ),
                  style: TypographyStyles.poppins6008PrimaryColored(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column subscriptionFeaturesWidget(ColorPalette theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What You Get",
          style: TypographyStyles.poppinsBold10PrimaryColored(),
        ),
        VerticalSpace16(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            eachSubscriptionFeatureWidget(
              theme,
              IconConstants.icSubscriptionFullAccess,
              "Full Access to All Meditations",
            ),
            eachSubscriptionFeatureWidget(
              theme,
              IconConstants.icSubscriptionExclusiveSleepAudios,
              "Exclusive Sleep & Rest Audios",
            ),
          ],
        ),
        VerticalSpace16(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            eachSubscriptionFeatureWidget(
              theme,
              IconConstants.icSubscriptionWeeklyContent,
              "New Weekly Content",
            ),
            eachSubscriptionFeatureWidget(
              theme,
              IconConstants.icSubscriptionDownload,
              "Download & Listen Offline",
            ),
          ],
        ),
      ],
    );
  }

  Widget eachSubscriptionFeatureWidget(
    ColorPalette theme,
    String iconPath,
    String featureName,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8.r,
      children: [
        ImageIcon(AssetImage(iconPath), color: theme.primaryColor, size: 16.r),
        SizedBox(
          width: 94.w,
          child: Text(
            featureName,
            style: TypographyStyles.poppinsBold10PrimaryColored(),
          ),
        ),
      ],
    );
  }
}
