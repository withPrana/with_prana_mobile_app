import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class SupportMessageFieldWidget extends StatelessWidget {
  final String? title;
  final double? height;
  final double? width;
  final TextEditingController controller;
  final bool enableValidation;
  final String hintText;
  final bool enabled;
  final int? maxLength;
  final String? Function(String? value)? validator;
  final void Function(String value)? onChanged;
  final GlobalKey<FormState>? formKey;
  final String? emptyValidationErrorText;
  final int? maxLines;

  SupportMessageFieldWidget({
    super.key,
    this.title,
    this.height,
    this.width,
    this.maxLength,
    this.validator,
    this.onChanged,
    this.formKey,
    this.maxLines,
    this.emptyValidationErrorText,
    this.enableValidation = true,
    required this.controller,
    required this.hintText,
    required this.enabled,
  });

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title ?? '', style: TypographyStyles.poppins40012()),
                  VerticalSpace4(),
                ],
              ),
            SizedBox(
              height: height,
              width: width,
              child: TextFormField(
                cursorHeight: 16.r,
                controller: controller,
                enabled: enabled,
                maxLength: maxLength,
                maxLines: maxLines,
                cursorColor: theme.secondaryColor,
                onTapOutside: (_) {
                  FocusScope.of(context).unfocus();
                },
                style: TypographyStyles.poppins40012(),
                validator:
                    validator ??
                    (value) {
                      if (enableValidation) {
                        if (value!.trim().isEmpty) {
                          return emptyValidationErrorText ??
                              "This field is required";
                        }
                        return null;
                      } else {
                        return null;
                      }
                    },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10.r,
                    vertical: 10.r,
                  ),
                  fillColor: theme.inverseColor,
                  filled: true,
                  hintText: hintText,
                  errorStyle: TypographyStyles.poppinsNormal10Error(),
                  hintStyle: TextStyle(
                    fontSize: 12.r,
                    color: theme.textDisabledColor,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                  border: _border(theme),
                  enabledBorder: _border(theme),
                  focusedBorder: _border(theme),
                  errorBorder: _border(theme),
                  disabledBorder: _border(theme),
                  focusedErrorBorder: _border(theme),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  OutlineInputBorder _border(ColorPalette theme) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: theme.disabledLightColor),
      borderRadius: BorderRadius.circular(10.r),
    );
  }
}
