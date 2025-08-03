import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/auth_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/otp_verification_screen_widgets/otp_field_widget.dart';

class OtpEntryWidget extends StatelessWidget {
  final AuthController authController;
  const OtpEntryWidget({super.key, required this.authController});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (authController.isOtpVerified.value) {
        return Text(
          "Your email has been verified! You're all set to continue your practice.",
          textAlign: TextAlign.center,
          style: TypographyStyles.snigletNormal16secondaryColored(),
        );
      } else {
        return Column(
          children: [
            OtpFieldWidget(
              controller: authController.otpTextController,
              onCompleted: (value) => authController.verifyOtp(),
            ),
            VerticalSpace6(),
            Align(
              alignment: Alignment.center,
              child: Text(
                "Just a quick step to verify your email. Enter the code we sent to continue your journey.",
                textAlign: TextAlign.center,
                style: TypographyStyles.poppinsNormal10(),
              ),
            ),
          ],
        );
      }
    });
  }
}
