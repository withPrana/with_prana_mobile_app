// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/initial_question_option_controller.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/enums/toast_type_enum.dart';
import 'package:with_prana_mobile_app/core/route/route_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/app_dialogs.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/screens/mail_entry_screen.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/button_widgets/primary_button_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/content_and_action_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/gradient_image_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/initial_question_screen_widgets/intial_question_options_widget.dart';

class InitialQuestionScreenTwo extends StatelessWidget {
  static const routePath = "/initial-question-two";
  InitialQuestionScreenTwo({super.key});

  final themeController = Get.find<ThemeController>();
  final initialQuestionOptionController =
      Get.find<InitialQuestionOptionController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return Scaffold(
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
              top: -64.h,
              left: 24.w,
              right: 24.w,
              child: GradientImageWidget(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.4, 1],
                  colors: [
                    theme.primaryScreenGradient[0],
                    theme.primaryScreenGradient[1].withValues(alpha: 0.5),
                  ],
                ),
                width: ScreenSize.width(context) / 1.15,
                image: AssetImage(ImageConstants.imgBoatSteering),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpace16(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                RouteController.push(
                                  context,
                                  MailEntryScreen.routePath,
                                );
                              },
                              child: Text(
                                "Skip",
                                style:
                                    TypographyStyles.poppinsBold12PrimaryColored(),
                              ),
                            ),
                          ),
                          VerticalSpace56(),
                          Text(
                            "Time preference",
                            style: TypographyStyles.snigletNormal14(),
                          ),
                          VerticalSpace8(),
                          Text(
                            "When do you prefer to take\na moment for yourself?",
                            style:
                                TypographyStyles.poppins40018SecondaryColored(),
                          ),
                          VerticalSpace104(),
                          /////options
                          IntialQuestionOptionsWidget(firstQuestion: false),
                        ],
                      ),
                    ),
                    Spacer(),
                    /////bottom
                    ContentAndActionWidget(
                      contentIconPath: ImageConstants.imgMeditation,
                      contentHeading: "Spirit-Connected Listening",
                      contentString:
                          "With meditations inspired by spiritual traditions, reconnect to your faith, heart, or inner peace.",
                      actions: PrimaryButtonWidget(
                        onTap: () {
                          if (initialQuestionOptionController.optionsTwo.value
                              .any((element) => element.isSelected)) {
                            RouteController.push(
                              context,
                              MailEntryScreen.routePath,
                            );
                          } else {
                            AppDialogs.showToast(
                              message: "Please select any",
                              toastType: ToastTypeEnum.info,
                            );
                          }
                        },
                        isLoading: false,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 8,
                          children: [
                            Text(
                              "Next",
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
                    ),
                    VerticalSpace24(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
