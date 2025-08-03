// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/services.dart/auth_services.dart';
import 'package:with_prana_mobile_app/core/enums/toast_type_enum.dart';
import 'package:with_prana_mobile_app/core/route/route_controller.dart';
import 'package:with_prana_mobile_app/core/shared_preferences/shared_preferences.dart';
import 'package:with_prana_mobile_app/core/utils/app_dialogs.dart';
import 'package:with_prana_mobile_app/models/auth_models/otp_models.dart';
import 'package:with_prana_mobile_app/models/auth_models/register_account_models.dart';
import 'package:with_prana_mobile_app/view/screens/initial_screens/otp_verification_screen.dart';

class AuthController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final otpTextController = TextEditingController();

  final isLoadingSendOtp = false.obs;
  final isLoadingResendOtp = false.obs;
  final isLoadingOtpVerification = false.obs;
  final isOtpVerified = false.obs;

  ////register and receive otp
  Future<void> registerAccountAndSendOtp(BuildContext context) async {
    isLoadingSendOtp(true);
    final body = RegisterAccountBodyModel(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
    );
    final response = await AuthServices.registerAccount(body);
    if (response) {
      RouteController.push(context, OtpVerificationScreen.routePath);
    }
    isLoadingSendOtp(false);
  }

  ////Verify otp
  Future<void> verifyOtp() async {
    isLoadingOtpVerification(true);
    if (otpTextController.text.trim().isEmpty) {
      AppDialogs.showToast(
        message: "Please enter your OTP",
        toastType: ToastTypeEnum.warning,
      );
    } else if (otpTextController.text.trim().length != 6) {
      AppDialogs.showToast(
        message: "Please enter a valid OTP",
        toastType: ToastTypeEnum.warning,
      );
    } else {
      final body = VerifyOtpBodyModel(
        otp: otpTextController.text.trim(),
        email: emailController.text.trim(),
      );
      final response = await AuthServices.verifyOtp(body);
      if (response) {
        isOtpVerified(true);
        await Future.wait([
          SharedPrefs.setIsLoggedIn(true),
          SharedPrefs.setUserMailId(emailController.text.trim()),
        ]);
        reset();
      }
    }
    isLoadingOtpVerification(false);
  }

  ////Resend otp
  Future<void> resendOtp() async {
    isLoadingResendOtp(true);
    final body = ResendOtpBodyModel(email: emailController.text.trim());
    await AuthServices.resendOtp(body);

    isLoadingResendOtp(false);
  }

  void reset() {
    isLoadingSendOtp(false);
    isLoadingOtpVerification(false);
    isLoadingResendOtp(false);
    nameController.clear();
    emailController.clear();
    otpTextController.clear();
  }
}
