import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/core/enums/toast_type_enum.dart';
import 'package:with_prana_mobile_app/core/utils/app_dialogs.dart';

class OtpController extends GetxController {
  final otpTextController = TextEditingController();
  final isLoadingOtpVerification = false.obs;
  final isOtpVerified = false.obs;

  Future<void> verifyOtp() async {
    isLoadingOtpVerification(true);
    if (otpTextController.text.trim().isEmpty) {
      AppDialogs.showToast(
        message: "Please enter the OTP to verify",
        toastType: ToastTypeEnum.error,
      );
    } else if (otpTextController.text.trim() == "1234") {
      await Future.delayed(Duration(seconds: 1));
      AppDialogs.showToast(
        message: "Verified",
        toastType: ToastTypeEnum.success,
      );
      isOtpVerified(true);
    } else {
      AppDialogs.showToast(
        message: "The entered OTP is wrong",
        toastType: ToastTypeEnum.error,
      );
    }
    isLoadingOtpVerification(false);
  }
}
