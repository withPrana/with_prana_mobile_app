import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/auth_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/route/route_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/screens/initial_screens/login_screen.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_appbar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/content_and_action_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/gradient_image_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/text_and_action_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/otp_verification_screen_widgets/bottom_buttons_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/otp_verification_screen_widgets/otp_entry_widget.dart';

class OtpVerificationScreen extends HookWidget {
  static const routePath = "/otp-verification";
  OtpVerificationScreen({super.key});

  final themeController = Get.find<ThemeController>();
  final authController = Get.find<AuthController>();

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
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SafeArea(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MainAppbarWidget(name: "Go back"),
                      // VerticalSpace80(),
                      Text(
                        "Confirm your email",
                        style: TypographyStyles.poppins40020SecondaryColored(),
                      ),
                      VerticalSpace8(),
                      Text(
                        "Please enter the code sent to your inbox at ${authController.emailController.text.trim()} to proceed.",
                        style: TypographyStyles.poppins40012(),
                      ),
                      VerticalSpace96(),
                      OtpEntryWidget(authController: authController),
                      Spacer(),
                      /////bottom
                      ContentAndActionWidget(
                        contentIconPath: ImageConstants.imEnlightment,
                        contentHeading: "Calm Voices That Truly Soothe",
                        contentString:
                            "Our audio is crafted with therapeutic voices and tones designed to emotionally ease your mind.",
                        actions: BottomButtonsWidget(
                          authController: authController,
                          theme: theme,
                        ),
                      ),
                      VerticalSpace8(),
                      Transform.scale(
                        scale: 0.8,
                        child: TextAndActionWidget(
                          primaryText: "Already have an account?",
                          actionText: "Log in",
                          onActionClicked: () {
                            RouteController.pushAndRemoveUntil(
                              context,
                              LoginScreen.routePath,
                            );
                          },
                        ),
                      ),
                      VerticalSpace16(),
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
