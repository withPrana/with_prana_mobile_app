import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/auth_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/enums/text_input_type_enum.dart';
import 'package:with_prana_mobile_app/core/route/route_controller.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/screens/initial_screens/name_entry_screen.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/button_widgets/primary_button_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/form_widgets/auth_text_field_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/text_and_action_widget.dart';

class LoginFormWidget extends HookWidget {
  final ColorPalette theme;
  final AuthController authController;
  const LoginFormWidget({
    super.key,
    required this.theme,
    required this.authController,
  });

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    return Container(
      width: ScreenSize.width(context),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: theme.inverseColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            signInMethodWidget(
              iconPath: IconConstants.icGoogleSignIn,
              signInMethod: "Google",
              onTap: () {
                authController.signInWithGoogle(context);
              },
            ),
            VerticalSpace16(),
            signInMethodWidget(
              iconPath: IconConstants.icAppleSignIn,
              signInMethod: "Apple",
              onTap: () {},
            ),
            VerticalSpace32(),
            Text(
              "or",
              style: TypographyStyles.poppins40014Colored(theme.disabledColor),
            ),
            VerticalSpace32(),
            Obx(
              () => AuthTextFieldWidget(
                title: "Email address",
                controller: authController.emailController,
                hintText: "abc@example.com",
                enabled: !authController.isLoadingSendOtp.value,
                textInputType: TextInputTypeEnum.email,
              ),
            ),
            VerticalSpace40(),
            Obx(
              () => PrimaryButtonWidget(
                name: "Log in",
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    authController.registerAccountAndSendOtp(context);
                  }
                  // Future.wait([
                  //   SharedPrefs.setIsLoggedIn(true),
                  //   SharedPrefs.setUserName("Shamjad"),
                  //   SharedPrefs.setUserMailId("shamjad@gmail.com"),
                  // ]);
                },
                isLoading: authController.isLoadingSendOtp.value,
              ),
            ),
            VerticalSpace16(),
            TextAndActionWidget(
              theme: theme,
              primaryText: "Don’t have an account?",
              actionText: "Sign up",
              onActionClicked: () {
                RouteController.push(context, NameEntryScreen.routePath);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget signInMethodWidget({
    required String iconPath,
    required String signInMethod,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: theme.disabledLightColor),
        ),
        child: Center(
          child: Row(
            spacing: 10.r,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconPath, width: 20.r),
              Text(
                "Continue with $signInMethod",
                style: TypographyStyles.poppinsBold14Colored(
                  theme.textDarkColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
