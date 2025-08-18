// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:with_prana_mobile_app/controller/services.dart/auth_services.dart';
import 'package:with_prana_mobile_app/core/enums/toast_type_enum.dart';
import 'package:with_prana_mobile_app/core/route/route_controller.dart';
import 'package:with_prana_mobile_app/core/shared_preferences/shared_preferences.dart';
import 'package:with_prana_mobile_app/core/utils/app_dialogs.dart';
import 'package:with_prana_mobile_app/models/auth_models/otp_models.dart';
import 'package:with_prana_mobile_app/models/auth_models/register_account_models.dart';
import 'package:with_prana_mobile_app/models/auth_models/sign_in_models.dart';
import 'package:with_prana_mobile_app/view/screens/bottom_navigation_screens/bottom_navigation_screen.dart';
import 'package:with_prana_mobile_app/view/screens/initial_screens/otp_verification_screen.dart';
import 'package:with_prana_mobile_app/view/screens/initial_screens/sign_in_screen.dart';

class AuthController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final otpTextController = TextEditingController();

  final isLoadingSendOtp = false.obs;
  final isLoadingResendOtp = false.obs;
  final isLoadingOtpVerification = false.obs;
  final isOtpVerified = false.obs;

  final isLoadingGoogleSignIn = false.obs;

  Future<void> decodeTokenAndStoreUserDetails({required String token}) async {
    final decodedToken = JWT.decode(token);
    final decodedTokenPayload = decodedToken.payload;
    final userId = decodedTokenPayload["id"];
    final userEmailId = decodedTokenPayload["email"];
    final userName = decodedTokenPayload["name"];

    await Future.wait([
      SharedPrefs.setIsLoggedIn(true),
      SharedPrefs.setUserId(userId),
      SharedPrefs.setUserMailId(userEmailId),
      SharedPrefs.setUserName(userName),
    ]);
    isOtpVerified(true);
  }

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

  ////register and receive otp
  Future<void> signInAndSendOtp(BuildContext context) async {
    isLoadingSendOtp(true);
    final body = SignInBodyModel(email: emailController.text.trim());
    final response = await AuthServices.signIn(body);
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
      if (response.$1) {
        await decodeTokenAndStoreUserDetails(token: response.$2?.token ?? '');
        isOtpVerified(true);
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

  ////Sign in with google
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;
      final googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize(
        serverClientId:
            "184414208616-6otgfa132suehhmfv5pv04ssi6eierbq.apps.googleusercontent.com",
      );
      final googleAccount = await googleSignIn.authenticate();

      final googleAuth = await googleAccount.authorizationClient
          .authorizationForScopes(['email', 'profile']);

      if (googleAuth == null) return;

      final idToken = googleAccount.authentication.idToken ?? '';
      final accessToken = googleAuth.accessToken;

      final credential = GoogleAuthProvider.credential(
        idToken: idToken,
        accessToken: accessToken,
      );
      AppDialogs.showPopupLoading(message: "Signing you in");
      final userCredential = await firebaseAuth.signInWithCredential(
        credential,
      );
      final user = userCredential.user;
      if (user != null) {
        await Future.wait([
          SharedPrefs.setUserMailId(user.email ?? ''),
          SharedPrefs.setUserName(user.displayName ?? ''),
          SharedPrefs.setIsLoggedIn(true),
        ]);
        RouteController.pushAndRemoveUntil(
          context,
          BottomNavigationScreen.routePath,
        );
      }
    } catch (e) {
      log("google sign in error : $e");
      AppDialogs.showToast(
        message: "Failed to sign in",
        toastType: ToastTypeEnum.error,
      );
    } finally {
      AppDialogs.stopPopupLoading();
    }
  }

  Future<void> signOut(BuildContext context) async {
    AppDialogs.showPopupLoading(message: "Signing out");
    await Future.delayed(Duration(seconds: 1));
    await SharedPrefs.clearAll();
    RouteController.pushAndRemoveUntil(context, SignInScreen.routePath);
    AppDialogs.stopPopupLoading();
  }

  void resetAll() {
    isLoadingSendOtp(false);
    isLoadingOtpVerification(false);
    isLoadingResendOtp(false);
    isLoadingGoogleSignIn(false);
    isOtpVerified(false);
    nameController.clear();
    emailController.clear();
    otpTextController.clear();
  }
}
