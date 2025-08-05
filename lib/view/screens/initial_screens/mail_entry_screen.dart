import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/auth_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/enums/text_input_type_enum.dart';
import 'package:with_prana_mobile_app/core/route/route_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/screens/initial_screens/login_screen.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/button_widgets/primary_button_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/content_and_action_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/form_widgets/text_field_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/gradient_image_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/text_and_action_widget.dart';

class MailEntryScreen extends HookWidget {
  static const routePath = "/mail-entry";
  MailEntryScreen({super.key});

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
                      VerticalSpace80(),
                      Text(
                        "Let us know where to send\nyour calm.",
                        style: TypographyStyles.poppins40020SecondaryColored(),
                      ),
                      VerticalSpace8(),
                      Text(
                        "Enter your email to unlock your 14-day free\naccess to all meditations.",
                        style: TypographyStyles.poppins40012(),
                      ),
                      VerticalSpace96(),
                      TextFieldWidget(
                        controller: authController.emailController,
                        hintText: "Enter your email Id",
                        enabled: !authController.isLoadingSendOtp.value,
                        textInputType: TextInputTypeEnum.email,
                        keyboardType: TextInputType.emailAddress,
                        emptyValidationErrorText: "Please enter your email id",
                      ),
                      VerticalSpace6(),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "We’ll only use this to help you continue your practice and\nshare mindful updates — no noise, ever.",
                          textAlign: TextAlign.center,
                          style: TypographyStyles.poppinsNormal10(),
                        ),
                      ),
                      Spacer(),
                      /////bottom
                      ContentAndActionWidget(
                        contentIconPath: ImageConstants.imEnlightment,
                        contentHeading: "Calm Voices That Truly Soothe",
                        contentString:
                            "Our audio is crafted with therapeutic voices and tones designed to emotionally ease your mind.",
                        actions: Column(
                          children: [
                            Obx(
                              () => PrimaryButtonWidget(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    authController.registerAccountAndSendOtp(
                                      context,
                                    );
                                  }
                                },
                                isLoading:
                                    authController.isLoadingSendOtp.value,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: 8,
                                  children: [
                                    Text(
                                      "Next",
                                      style:
                                          TypographyStyles.poppinsBold16Inverse(),
                                    ),
                                    ImageIcon(
                                      AssetImage(IconConstants.icArrowRight),
                                      color: theme.inverseColor,
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
