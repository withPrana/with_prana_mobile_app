import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/enums/text_input_type_enum.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class AuthTextFieldWidget extends StatelessWidget {
  final FocusNode? focusNode;
  final String? title;
  final double? height;
  final double? width;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputTypeEnum textInputType;
  final bool enableValidation;
  final String hintText;
  final bool enabled;
  final bool readOnly;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String? value)? validator;
  final void Function(String value)? onChanged;
  final GlobalKey<FormState>? formKey;
  final String? emptyValidationErrorText;
  final Widget? suffixIcon;

  AuthTextFieldWidget({
    super.key,
    this.focusNode,
    this.title,
    this.height,
    this.width,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.formKey,
    this.suffixIcon,
    this.emptyValidationErrorText,
    this.enableValidation = true,
    this.readOnly = false,
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
        if (title != null)
          Text(title ?? '', style: TypographyStyles.poppins40014Colored(theme.textDarkColor)),
        if (title != null) VerticalSpace4(),
        SizedBox(
          height: height,
          width: width,
          child: TextFormField(
            focusNode: focusNode,
            cursorHeight: 16.r,
            controller: controller,
            enabled: enabled,
            readOnly: readOnly,
            maxLength: maxLength,
            keyboardType: keyboardType,
            cursorColor: theme.secondaryColor,
            onTapOutside: (_) {
              FocusScope.of(context).unfocus();
            },
            style: TextStyle(
              fontSize: 12.r,
              color: themeController.appTheme.value?.textDarkColor,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
              fontStyle: FontStyle.italic,
            ),
            validator:
                validator ??
                (value) {
                  if (enableValidation) {
                    if (value!.trim().isEmpty) {
                      return emptyValidationErrorText ??
                          "This field is required";
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
                color: themeController.appTheme.value?.disabledColor,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins",
                fontStyle: FontStyle.italic,
              ),
              border: _border(theme),
              enabledBorder: _border(theme),
              focusedBorder: _border(theme),
              errorBorder: _border(theme),
              disabledBorder: _border(theme),
              focusedErrorBorder: _border(theme),
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _border(ColorPalette theme) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: theme.textFieldBorder),
      borderRadius: BorderRadius.circular(10.r),
    );
  }
}
