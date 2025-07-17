import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:with_prana_mobile_app/core/enums/toast_type_enum.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';

class AppDialogs {
  ////toast messages
  static void showToast({
    required String message,
    required ToastTypeEnum toastType,
  }) {
    // Determine icon based on message type
    Icon icon;
    Color bgColor;
    switch (toastType) {
      case ToastTypeEnum.success:
        icon = Icon(
          Icons.download_done_rounded,
          size: 16.r,
          color: Colors.green,
        );
        bgColor = Colors.green.shade100;

        break;
      case ToastTypeEnum.info:
        icon = Icon(Icons.info_outline, size: 16.r, color: Colors.blue);
        bgColor = Colors.blue.shade100;

        break;
      case ToastTypeEnum.warning:
        icon = Icon(Icons.warning, size: 16.r, color: Colors.orange);
        bgColor = Colors.orange.shade100;

        break;
      case ToastTypeEnum.error:
        icon = Icon(Icons.error_outline, size: 16.r, color: Colors.red);
        bgColor = Colors.red.shade100;

        break;
    }

    SmartDialog.showToast(
      message,
      animationType: SmartAnimationType.centerFade_otherSlide,
      builder: (context) {
        return SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32.w, vertical: 56.h),
            padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.r),
            decoration: BoxDecoration(
              // color: theme.inverseColor,
              color: bgColor,
              borderRadius: BorderRadius.circular(500.r),
              // boxShadow: [
              //   BoxShadow(
              //     color: theme.shadowColor.withValues(alpha: 0.5),
              //     blurRadius: 10.r,
              //     offset: Offset(0, 10.r),
              //   ),
              // ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon,
                SizedBox(width: 8.r),
                Flexible(
                  child: Text(
                    message,
                    style: TypographyStyles.poppinsNormal10(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      useAnimation: true,
      displayType: SmartToastType.last,
      displayTime: Duration(seconds: 4),
    );
  }
}
