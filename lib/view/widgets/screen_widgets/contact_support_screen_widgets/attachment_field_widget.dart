import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/contact_support_controller.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class AttachmentFieldWidget extends StatelessWidget {
  final ColorPalette theme;
  final ContactSupportController contactSupportController;
  const AttachmentFieldWidget({
    super.key,
    required this.theme,
    required this.contactSupportController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "📎 Attach Screenshot (Optional)",
          style: TypographyStyles.poppins40012(),
        ),
        VerticalSpace4(),
        Obx(
          () => TextFormField(
            cursorHeight: 16.r,
            controller: contactSupportController.attachmentFileNameController,
            enabled: !contactSupportController.isLoadingSendMessage.value,
            cursorColor: theme.secondaryColor,
            readOnly: true,
            onTapOutside: (_) {
              FocusScope.of(context).unfocus();
            },
            style: TypographyStyles.poppins40012(),

            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.r,
                vertical: 10.r,
              ),
              fillColor: theme.inverseColor,
              filled: true,
              counter: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Attach JPG, PNG, or PDF — max 5MB",
                  style: TypographyStyles.poppins40010Disabled(),
                ),
              ),
              errorStyle: TypographyStyles.poppinsNormal10Error(),
              border: _border(theme),
              enabledBorder: _border(theme),
              focusedBorder: _border(theme),
              errorBorder: _border(theme),
              disabledBorder: _border(theme),
              focusedErrorBorder: _border(theme),
              suffixIcon: InkWell(
                onTap: () {
                  if (contactSupportController.attachmentFile.value == null) {
                    contactSupportController.attachFile();
                  } else {
                    contactSupportController.removeAttchedFile();
                  }
                },
                child: Transform.rotate(
                  angle:
                      contactSupportController.attachmentFile.value == null
                          ? (pi / 180 * 45)
                          : 0,
                  child: Icon(
                    contactSupportController.attachmentFile.value == null
                        ? Icons.attach_file
                        : Icons.close,
                    color: theme.textDarkColor,
                    size: 18.r,
                  ),
                ),
              ),
            ),
          ),
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
