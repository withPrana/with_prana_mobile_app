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
import 'package:with_prana_mobile_app/view/screens/initial_screens/initial_question_screen_one.dart';
import 'package:with_prana_mobile_app/view/screens/initial_screens/login_screen.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/button_widgets/secondary_button_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/form_widgets/text_field_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/text_and_action_widget.dart';

class NameEntryScreen extends HookWidget {
  static const routePath = "/name-entry";
  NameEntryScreen({super.key});

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
            colors: theme.nameEntryScreenGradient,
          ),
        ),
        child: Stack(
          children: [
            ////top bg image - lotus
            Positioned(
              top: -24,
              child: Transform.scale(
                scale: 1.2,
                child: Image.asset(
                  ImageConstants.imgLotusUpsideDown,
                  width: ScreenSize.width(context),
                  fit: BoxFit.cover,
                  opacity: AlwaysStoppedAnimation(0.1),
                ),
              ),
            ),

            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      VerticalSpace136(),
                      Text(
                        "A moment for your mind,\na path to your soul.",
                        textAlign: TextAlign.center,
                        style: TypographyStyles.snigletNormal24Inverse(),
                      ),
                      VerticalSpace24(),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Let ",
                          style: TypographyStyles.poppinsNormal12Inverse(),
                          children: [
                            TextSpan(
                              text: "With Prana ",
                              style: TypographyStyles.poppinsBold12Inverse(),
                            ),
                            TextSpan(
                              text:
                                  "guide you toward peace,\nclarity, and connection",
                              style: TypographyStyles.poppinsNormal12Inverse(),
                            ),
                          ],
                        ),
                      ),
                      VerticalSpace136(),
                      Text(
                        "What can we call you?",
                        style: TypographyStyles.poppinsNormal12Inverse(),
                      ),
                      VerticalSpace8(),
                      ////name field
                      TextFieldWidget(
                        controller: authController.nameController,
                        hintText: "Enter your name",
                        enabled: true,
                        textInputType: TextInputTypeEnum.name,
                        emptyValidationErrorText: "Please enter your name",
                      ),
                      Spacer(),
                      SecondaryButtonWidget(
                        width: 200.r,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            RouteController.push(
                              context,
                              InitialQuestionScreenOne.routePath,
                            );
                          }
                        },
                        isLoading: false,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 8.r,
                          children: [
                            Text(
                              "Let's Get Started",
                              style: TypographyStyles.poppinsBold16Inverse(),
                            ),
                            ImageIcon(
                              AssetImage(IconConstants.icArrowRight),
                              color: theme.inverseColor,
                              size: 18.r,
                            ),
                          ],
                        ),
                      ),

                      VerticalSpace40(),
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
                      VerticalSpace8(),
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
