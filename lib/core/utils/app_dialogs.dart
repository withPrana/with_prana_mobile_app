import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/enums/toast_type_enum.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/loader_widgets/popup_loading_widget.dart';

class AppDialogs {
  ////Popup loading
  static void showPopupLoading({String? message}) {
    final themeController = Get.find<ThemeController>();
    final theme = themeController.appTheme.value!;
    SmartDialog.showLoading(
      maskColor: theme.textDarkColor.withValues(alpha: 0.8),
      builder: (context) {
        return InkWell(
          child: PopupLoadingWidget(message: message, theme: theme));
      },
      useAnimation: true,
      animationTime: Duration(milliseconds: 200),
      backType: SmartBackType.ignore,
    );
  }

  /////Stop loading
  static void stopPopupLoading() {
    SmartDialog.dismiss();
  }

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
              color: bgColor,
              borderRadius: BorderRadius.circular(500.r),
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
