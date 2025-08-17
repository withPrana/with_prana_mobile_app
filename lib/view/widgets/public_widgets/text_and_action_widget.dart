import 'package:flutter/material.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';

class TextAndActionWidget extends StatelessWidget {
  final ColorPalette theme;
  final String primaryText;
  final String actionText;
  final VoidCallback onActionClicked;
  final MainAxisAlignment alignment;
  const TextAndActionWidget({
    super.key,
    this.alignment = MainAxisAlignment.center,
    required this.primaryText,
    required this.actionText,
    required this.onActionClicked,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        Text(
          "$primaryText ",
          style: TypographyStyles.poppins40014Colored(theme.textDarkColor),
        ),
        InkWell(
          onTap: onActionClicked,
          child: Text(
            actionText,
            style: TypographyStyles.poppins40014Colored(theme.primaryColor),
          ),
        ),
      ],
    );
  }
}
