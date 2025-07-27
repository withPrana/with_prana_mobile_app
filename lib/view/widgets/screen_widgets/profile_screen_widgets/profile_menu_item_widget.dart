import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';

class ProfileMenuItemWidget extends StatelessWidget {
  final String iconPath;
  final String menuName;
  final Widget? badge;
  final ColorPalette theme;
  final VoidCallback onTap;
  const ProfileMenuItemWidget({
    super.key,
    required this.iconPath,
    required this.menuName,
    required this.theme,
    this.badge,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageIcon(AssetImage(iconPath), color: theme.textDarkColor, size: 20.r),
        SizedBox(width: 10.r),
        Text(menuName, style: TypographyStyles.poppins40012Dark()),
        Spacer(),
        if (badge != null) badge!,
        SizedBox(width: 10.r),
        Container(
          width: 24.r,
          height: 24.r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: theme.disabledLightColor, width: 1.r),
          ),
          child: Center(
            child: Icon(
              Icons.arrow_forward,
              color: theme.textDarkColor,
              size: 12.r,
            ),
          ),
        ),
      ],
    );
  }
}
