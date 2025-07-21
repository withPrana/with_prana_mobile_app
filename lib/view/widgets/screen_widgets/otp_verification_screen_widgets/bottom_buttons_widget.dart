import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/otp_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/route/route_controller.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/view/screens/bottom_navigation_screen.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/button_widgets/primary_button_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class BottomButtonsWidget extends StatelessWidget {
  final OtpController otpController;
  final ColorPalette theme;
  const BottomButtonsWidget({
    super.key,
    required this.otpController,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (otpController.isOtpVerified.value) {
        return Column(
          children: [
            PrimaryButtonWidget(
              onTap: () {
                RouteController.pushAndRemoveUntil(
                  context,
                  BottomNavigationScreen.routePath,
                );
              },
              isLoading: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Start Free Trial",
                    style: TypographyStyles.poppinsBold14Inverse(),
                  ),
                  ImageIcon(
                    AssetImage(IconConstants.icArrowRight),
                    color: theme.inverseColor,
                    size: 18,
                  ),
                ],
              ),
            ),

            VerticalSpace16(),
            GestureDetector(
              onTap: () {
                RouteController.pushAndRemoveUntil(
                  context,
                  BottomNavigationScreen.routePath,
                );
              },
              child: Text(
                "Skip for now",
                style: TypographyStyles.poppinsBold12PrimaryColored(),
              ),
            ),
          ],
        );
      } else {
        return Column(
          children: [
            Obx(
              () => PrimaryButtonWidget(
                onTap: () {
                  otpController.verifyOtp();
                },
                isLoading: otpController.isLoadingOtpVerification.value,
                name: "Verify",
              ),
            ),
            VerticalSpace16(),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Resend code",
                style: TypographyStyles.poppinsBold12PrimaryColored(),
              ),
            ),
          ],
        );
      }
    });
  }
}
