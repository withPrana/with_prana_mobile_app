import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class SubscriptionPlansWidget extends StatelessWidget {
  final ColorPalette theme;
  const SubscriptionPlansWidget({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        eachSubscriptionPlanWidget(
          context: context,
          planName: "Monthly Plan",
          planPeriod: "month",
          planAmount: "4.79",
          planSubtitle: "Most flexible",
          buttonContent: "Subscribe Monthly",
          color: theme.monthlyPlanMainColor,
          bgColor: theme.monthlyPlanBgColor,
        ),
        eachSubscriptionPlanWidget(
          context: context,
          planName: "Yearly Plan",
          planPeriod: "year",
          planAmount: "49.99",
          planSubtitle: "⭐ Best Value ⭐",
          buttonContent: "Go Yearly – Save 35%",
          color: theme.yearlyPlanMainColor,
          bgColor: theme.yearlyPlanBgColor,
        ),
      ],
    );
  }

  Widget eachSubscriptionPlanWidget({
    required BuildContext context,
    required String planName,
    required String planPeriod,
    required String planAmount,
    required String planSubtitle,
    required String buttonContent,
    required Color color,
    required Color bgColor,
  }) {
    return Container(
      width: (ScreenSize.width(context) / 2) - 24.w,
      padding: EdgeInsets.symmetric(vertical: 20.r, horizontal: 10.r),
      decoration: BoxDecoration(
        color: bgColor,
        border: Border.all(color: color, width: 1.r),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Text(
            planName,
            style: TypographyStyles.poppinsBold12Colored(theme.textDarkColor),
          ),
          VerticalSpace10(),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "\$$planAmount",
              style: TextStyle(
                fontSize: 36.r,
                color: color,
                fontFamily: "Sniglet",
              ),
              children: [
                TextSpan(
                  text: "\n/$planPeriod",
                  style: TypographyStyles.sniglet40020(),
                ),
              ],
            ),
          ),
          VerticalSpace8(),
          Text(planSubtitle, style: TypographyStyles.poppins40010()),
          VerticalSpace10(),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10.r),
            decoration: BoxDecoration(
              color: color,
              border: Border.all(color: theme.inverseColor, width: 1.r),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: Text(
                buttonContent,
                style: TypographyStyles.poppinsBold10Inverse(),
              ),
            ),
          ),

          VerticalSpace4(),
          Text(
            "Cancel anytime. Billed via your app store.",
            textAlign: TextAlign.center,
            style: TypographyStyles.poppins40010(),
          ),
        ],
      ),
    );
  }
}
