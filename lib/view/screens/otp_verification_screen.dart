import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/login_controller.dart';
import 'package:with_prana_mobile_app/controller/otp_controller.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/content_and_action_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/gradient_image_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/otp_verification_screen_widgets/bottom_buttons_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/otp_verification_screen_widgets/otp_entry_widget.dart';

class OtpVerificationScreen extends HookWidget {
  static const routePath = "/otp-verification";
  OtpVerificationScreen({super.key});

  final themeController = Get.find<ThemeController>();
  final loginController = Get.find<LoginController>();
  final otpController = Get.find<OtpController>();

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final theme = themeController.appTheme.value!;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: ScreenSize.width(context),
        height: ScreenSize.height(context),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: theme.primaryScreenGradient,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -68.h,
              left: 24.w,
              right: 24.w,
              child: GradientImageWidget(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.3, 1],
                  colors: [
                    theme.primaryScreenGradient[0],
                    theme.primaryScreenGradient[1].withValues(alpha: 0.5),
                  ],
                ),
                width: ScreenSize.width(context) / 1.15,
                image: AssetImage(ImageConstants.imgTree),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SafeArea(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VerticalSpace80(),
                      Text(
                        "Confirm your email",
                        style: TypographyStyles.poppins40018SecondaryColored(),
                      ),
                      VerticalSpace8(),
                      Text(
                        "Please enter the code sent to your inbox at ${loginController.emailController.text.trim()} to proceed.",
                        style: TypographyStyles.poppins40012(),
                      ),
                      VerticalSpace96(),
                      OtpEntryWidget(otpController: otpController),
                      Spacer(),
                      /////bottom
                      ContentAndActionWidget(
                        contentIconPath: ImageConstants.imEnlightment,
                        contentHeading: "Calm Voices That Truly Soothe",
                        contentString:
                            "Our audio is crafted with therapeutic voices and tones designed to emotionally ease your mind.",
                        actions: BottomButtonsWidget(
                          otpController: otpController,
                          theme: theme,
                        ),
                      ),
                      VerticalSpace24(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
