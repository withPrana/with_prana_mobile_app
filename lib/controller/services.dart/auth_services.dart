import 'package:with_prana_mobile_app/controller/services.dart/api_calls.dart';
import 'package:with_prana_mobile_app/core/constants/api_endpoints.dart';
import 'package:with_prana_mobile_app/core/constants/error_text_constants.dart';
import 'package:with_prana_mobile_app/core/enums/api_request_enum.dart';
import 'package:with_prana_mobile_app/models/auth_models/otp_models.dart';
import 'package:with_prana_mobile_app/models/auth_models/register_account_models.dart';

class AuthServices {
  ////Register user details and receive Otp
  static Future<bool> registerAccount(RegisterAccountBodyModel body) async {
    final response = await ApiCalls.callApi(
      request: ApiRequestEnum.post,
      body: body.toJson(),
      useToken: false,
      url: ApiEndpoints.registerAccount,
      functionFor: "Register account",
      errorMessage: ErrorTextConstants.txtUnableToSendOtp,
      showMessageForError: true,
      showMessageForSuccess: true,
    );
    if (response != null) {
      return true;
    } else {
      return false;
    }
  }

  ////Verify Otp
  static Future<bool> verifyOtp(VerifyOtpBodyModel body) async {
    final response = await ApiCalls.callApi(
      request: ApiRequestEnum.post,
      body: body.toJson(),
      useToken: false,
      url: ApiEndpoints.verifyOtp,
      functionFor: "Verify otp",
      errorMessage: ErrorTextConstants.txtUnableToVerifyOtp,
      showMessageForError: true,
      showMessageForSuccess: true,
    );
    if (response != null) {
      return true;
    } else {
      return false;
    }
  }

  ////Verify Otp
  static Future<void> resendOtp(ResendOtpBodyModel body) async {
    final response = await ApiCalls.callApi(
      request: ApiRequestEnum.post,
      body: body.toJson(),
      useToken: false,
      url: ApiEndpoints.resendOtp,
      functionFor: "Resend otp",
      errorMessage: ErrorTextConstants.txtUnableToSendOtp,
      showMessageForError: true,
      showMessageForSuccess: true,
    );
    if (response != null) {}
  }
}
