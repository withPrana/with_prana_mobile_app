import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/enums/text_input_type_enum.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';

class TextFieldWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputTypeEnum textInputType;
  final bool enableValidation;
  final String hintText;
  final bool enabled;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String? value)? validator;
  final void Function(String value)? onChanged;
  final TextAlign textAlign;
  final GlobalKey<FormState>? formKey;

  TextFieldWidget({
    super.key,
    this.height,
    this.width,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.formKey,
    this.enableValidation = true,
    this.textAlign = TextAlign.center,
    required this.controller,
    required this.hintText,
    required this.enabled,
    required this.textInputType,
  });

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    List<TextInputFormatter>? formatters;

    switch (textInputType) {
      case TextInputTypeEnum.mobile:
        formatters = [
          LengthLimitingTextInputFormatter(10),
          FilteringTextInputFormatter.digitsOnly,
        ];
        break;
      case TextInputTypeEnum.name:
        formatters = [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9 ]')),
        ];
        break;
      default:
        formatters = inputFormatters;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height,
          width: width,
          child: TextFormField(
            cursorHeight: 16,
            controller: controller,
            enabled: enabled,
            maxLength: maxLength,
            keyboardType: keyboardType,
            textAlign: textAlign,
            cursorColor: theme.secondaryColor,
            onTapOutside: (_) {
              FocusScope.of(context).unfocus();
            },
            style: TypographyStyles.poppins50016(),
            validator:
                validator ??
                (value) {
                  if (enableValidation) {
                    if (value!.trim().isEmpty) {
                      return "This field is required";
                    } else if (textInputType == TextInputTypeEnum.name) {
                      if (value.length < 3) {
                        return "Name must contain at least 3 characters";
                      }
                    } else if (textInputType == TextInputTypeEnum.email) {
                      final String emailPattern =
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                      if (!RegExp(emailPattern).hasMatch(value)) {
                        return "Enter a valid email id";
                      }
                    } else if (textInputType == TextInputTypeEnum.mobile) {
                      if (value.length != 10) {
                        return "Enter a valid mobile number";
                      }
                    }
                    return null;
                  } else {
                    return null;
                  }
                },
            inputFormatters: formatters,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 16, right: 16),
              fillColor: theme.inverseColor,
              filled: true,
              hintText: hintText,
              errorStyle: TypographyStyles.poppinsNormal0Error(),
              hintStyle: TypographyStyles.poppins50016Disabled(),
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
    );
  }

  OutlineInputBorder _border(ColorPalette theme) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: theme.textFieldBorder, width: 2),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
