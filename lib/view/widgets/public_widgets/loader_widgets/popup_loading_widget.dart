import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';

class PopupLoadingWidget extends StatelessWidget {
  final String? message;
  final ColorPalette theme;
  const PopupLoadingWidget({super.key, this.message, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 100.r,
          height: 100.r,
          child: SpinKitFadingCircle(color: theme.inverseColor, size: 50.r),
        ),
        message != null
            ? Column(
              children: [
                SizedBox(height: 8.h),
                Text(
                  message!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.r, color: theme.inverseColor),
                ),
              ],
            )
            : SizedBox(),
      ],
    );
  }
}
