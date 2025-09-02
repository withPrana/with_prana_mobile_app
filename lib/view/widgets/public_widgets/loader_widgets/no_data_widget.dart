import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';

class NoDataWidget extends StatelessWidget {
  final double? positionTop;
  final String message;
  const NoDataWidget({
    super.key,
    required this.message,
    this.positionTop,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: positionTop ?? ((ScreenSize.height(context) / 2) - 16.r),
      ),
      child: Center(
        child: Text(message, style: TypographyStyles.poppins40014()),
      ),
    );
  }
}
