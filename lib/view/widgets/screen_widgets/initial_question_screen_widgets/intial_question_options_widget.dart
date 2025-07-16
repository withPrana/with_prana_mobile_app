// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/initial_question_option_controller.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';

class IntialQuestionOptionsWidget extends StatelessWidget {
  IntialQuestionOptionsWidget({super.key});

  final themeController = Get.find<ThemeController>();
  final initialQuestionOptionController =
      Get.find<InitialQuestionOptionController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;

    return Obx(
      () => Column(
        spacing: 18,
        children: List.generate(
          initialQuestionOptionController.options.value.length,
          (index) {
            final option = initialQuestionOptionController.options.value[index];
            return GestureDetector(
              onTap: () {
                initialQuestionOptionController.selectOption(index);
              },
              child: Row(
                spacing: 10,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 50),
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: theme.primaryColor, width: 2),
                      color: option.isSelected ? theme.primaryColor : null,
                    ),
                    child: Center(
                      child: CircleAvatar(
                        radius: 2,
                        backgroundColor:
                            option.isSelected
                                ? theme.inverseColor
                                : theme.primaryColor,
                      ),
                    ),
                  ),
                  Text(
                    option.optionName,
                    style:
                        option.isSelected
                            ? TypographyStyles.poppinsBold16()
                            : TypographyStyles.poppins40016(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
