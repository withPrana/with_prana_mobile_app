import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';

class OtpFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String value)? onCompleted;
  OtpFieldWidget({super.key, required this.controller, this.onCompleted});

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return Align(
      alignment: Alignment.center,
      child: Pinput(
        length: 6,
        controller: controller,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        showCursor: false,
        autofillHints: [],
        defaultPinTheme: _pinTheme(theme: theme),
        focusedPinTheme: _pinTheme(
          theme: theme,
          borderColor: theme.primaryColor,
        ),
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        onCompleted: onCompleted,
      ),
    );
  }

  PinTheme _pinTheme({required ColorPalette theme, Color? borderColor}) {
    return PinTheme(
      width: 40.r,
      height: 40.r,
      padding: EdgeInsets.all(8.r),
      textStyle: TypographyStyles.poppinsNormal16(),
      decoration: BoxDecoration(
        color: theme.inverseColor,
        border: Border.all(color: borderColor ?? theme.disabledLightColor),
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }
}
