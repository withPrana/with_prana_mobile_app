import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class SubscriptionFeaturesWidget extends StatelessWidget {
  final ColorPalette theme;
  final Color? contentColor;
  const SubscriptionFeaturesWidget({
    super.key,
    required this.theme,
    this.contentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What You Get",
          style: TextStyle(
            height: 1.6,
            fontSize: 12.r,
            color: contentColor ?? theme.primaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins",
          ),
        ),
        VerticalSpace16(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.r),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  eachSubscriptionFeatureWidget(
                    IconConstants.icSubscriptionFullAccess,
                    "Full Access to All Meditations",
                  ),
                  eachSubscriptionFeatureWidget(
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
                    IconConstants.icSubscriptionWeeklyContent,
                    "New Weekly Content",
                  ),
                  eachSubscriptionFeatureWidget(
                    IconConstants.icSubscriptionDownload,
                    "Download & Listen Offline",
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget eachSubscriptionFeatureWidget(String iconPath, String featureName) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8.r,
      children: [
        ImageIcon(AssetImage(iconPath), color: theme.primaryColor, size: 20.r),
        SizedBox(
          width: 100.w,
          child: Text(
            featureName,

            style: TextStyle(
              height: 1.6,
              fontSize: 12.r,
              color: contentColor ?? theme.primaryColor,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins",
            ),
          ),
        ),
      ],
    );
  }
}
