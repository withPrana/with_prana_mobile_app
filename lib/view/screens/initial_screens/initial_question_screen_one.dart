// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/initial_question_option_controller.dart';
import 'package:with_prana_mobile_app/controller/login_controller.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/enums/toast_type_enum.dart';
import 'package:with_prana_mobile_app/core/route/route_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/app_dialogs.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/screens/initial_screens/initial_question_screen_two.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/button_widgets/primary_button_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/content_and_action_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/gradient_image_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/initial_question_screen_widgets/intial_question_options_widget.dart';

class InitialQuestionScreenOne extends StatelessWidget {
  static const routePath = "/initial-question-one";
  InitialQuestionScreenOne({super.key});

  final themeController = Get.find<ThemeController>();
  final loginController = Get.find<LoginController>();
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
              left: 24.w,
              right: 24.w,
              child: GradientImageWidget(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    theme.primaryScreenGradient[0],
                    theme.primaryScreenGradient[1].withValues(alpha: 0.5),
                  ],
                ),
                width: ScreenSize.width(context) / 1.15,
                image: AssetImage(ImageConstants.imgCareHand),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                                  InitialQuestionScreenTwo.routePath,
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
                            "Hi, ${loginController.nameController.text.trim()}!",
                            style: TypographyStyles.snigletNormal16(),
                          ),
                          VerticalSpace8(),
                          Text(
                            "What do you feel your heart\nneeds right now?",
                            style:
                                TypographyStyles.poppins40020SecondaryColored(),
                          ),
                          VerticalSpace104(),
                          /////options
                          IntialQuestionOptionsWidget(firstQuestion: true),
                        ],
                      ),
                    ),
                    Spacer(),
                    /////bottom
                    ContentAndActionWidget(
                      contentIconPath: ImageConstants.imgMusicTherapy,
                      contentHeading: "Soulful Soundscapes, Not Lessons",
                      contentString:
                          "we give you calming, immersive sounds to help you relax instantly.",
                      actions: PrimaryButtonWidget(
                        onTap: () {
                          if (initialQuestionOptionController.options.value.any(
                            (element) => element.isSelected,
                          )) {
                            RouteController.push(
                              context,
                              InitialQuestionScreenTwo.routePath,
                            );
                          } else {
                            AppDialogs.showToast(
                              message: "You haven’t selected anything yet.",
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
                              style: TypographyStyles.poppinsBold16Inverse(),
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
