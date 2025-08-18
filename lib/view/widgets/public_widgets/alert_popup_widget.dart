import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/button_widgets/primary_button_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class AlertPopupWidget extends StatelessWidget {
  final ColorPalette theme;
  final String title;
  final Widget content;
  final String cancelButtonName;
  final String submitButtonName;
  final VoidCallback onCancel;
  final VoidCallback onSubmit;
  final bool isLoadingSubmit;
  const AlertPopupWidget({
    super.key,
    required this.theme,
    required this.title,
    required this.content,
    required this.onCancel,
    required this.onSubmit,
    required this.cancelButtonName,
    required this.submitButtonName,
    required this.isLoadingSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: ScreenSize.width(context) * 0.75,
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: theme.inverseColor,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TypographyStyles.sniglet40020Colored(theme.primaryColor),
            ),
            VerticalSpace8(),
            content,
            VerticalSpace24(),
            Row(
              spacing: 10.r,
              children: [
                Expanded(
                  child: PrimaryButtonWidget(
                    borderColor: theme.disabledLightColor,
                    foregroundColor: theme.primaryColor,
                    borderOnly: true,
                    name: cancelButtonName,
                    onTap: onCancel,
                    isLoading: false,
                  ),
                ),
                Expanded(
                  child: PrimaryButtonWidget(
                    borderColor: theme.disabledLightColor,
                    onTap: onSubmit,
                    name: submitButtonName,
                    isLoading: isLoadingSubmit,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
