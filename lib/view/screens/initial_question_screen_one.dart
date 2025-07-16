import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/login_controller.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
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
            colors: theme.initialQuestionScreenGradient,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 24,
              right: 24,
              child: GradientImageWidget(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    theme.initialQuestionScreenGradient[0],
                    theme.initialQuestionScreenGradient[1].withValues(
                      alpha: 0.5,
                    ),
                  ],
                ),
                width: ScreenSize.width(context) / 1.15,
                image: AssetImage(ImageConstants.imgcareHand),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpace24(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Skip",
                              style:
                                  TypographyStyles.poppinsBold14PrimaryColored(),
                            ),
                          ),
                          VerticalSpace56(),
                          Text(
                            "Hi, ${loginController.nameController.text.trim()}!",
                            style: TypographyStyles.snigletNormal6(),
                          ),
                          VerticalSpace8(),
                          Text(
                            "What do you feel your heart\nneeds right now?",
                            style:
                                TypographyStyles.poppins40020SecondaryColored(),
                          ),
                          VerticalSpace104(),
                          /////options
                          IntialQuestionOptionsWidget(),
                        ],
                      ),
                    ),
                    Spacer(),
                    /////bottom
                    ContentAndActionWidget(
                      contentIconPath: ImageConstants.imgMusicTherapy,
                      contentHeading: "Spirit-Connected Listening",
                      contentString:
                          "With meditations inspired by spiritual traditions, reconnect to your faith, heart, or inner peace.",
                      actions: PrimaryButtonWidget(
                        onTap: () {},
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
                    VerticalSpace16(),
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
