import 'package:double_tap_to_exit/double_tap_to_exit.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/auth_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_screen_layout_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/login_screen_widgets/login_form_widget.dart';

class SignInScreen extends StatelessWidget {
  static const routePath = "/sign-in";
  SignInScreen({super.key});

  final themeController = Get.find<ThemeController>();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return DoubleTapToExit(
      child: MainScreenLayoutWidget(
        body: SingleChildScrollView(
          child: Column(
            children: [
              VerticalSpace120(),
              Text(
                "Let’s get you set up",
                style: TypographyStyles.sniglet40024Colored(theme.primaryColor),
              ),
              VerticalSpace8(),
              Text(
                "Sign in to your account using Google, Apple, or verify your email to get started.",
                textAlign: TextAlign.center,
                style: TypographyStyles.poppins40014(),
              ),
              VerticalSpace24(),
              LoginFormWidget(theme: theme, authController: authController),
            ],
          ),
        ),
      ),
    );
  }
}
