import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:with_prana_mobile_app/core/constants/error_text_constants.dart';
import 'package:with_prana_mobile_app/core/enums/api_request_enum.dart';
import 'package:with_prana_mobile_app/core/enums/toast_type_enum.dart';
import 'package:with_prana_mobile_app/core/utils/app_dialogs.dart';

class ApiCalls {
  static final dio = Dio();
  static final cancelToken = CancelToken();

  //// if the user session is expired, navigate login screen and clears store user data
  static Future<void> handleInvalidUser() async {
    // RouteController.pushAndRemoveUntil();

    // AppDialogs.showToast(
    //   message: "Please log in again",
    //   toastType: ToastTypeEnum.info,
    // );
  }

  ////Check specific dio exceptions
  static void checkDioExceptions({
    required DioException e,
    required bool showMessageForError,
    required String errorMessage,
    required String functionFor,
  }) {
    log("$functionFor error : ${e.response.toString()}");
    if (e.response?.statusCode == 401) {
      handleInvalidUser();
    } else if (e.response?.statusCode == 400 && (showMessageForError)) {
      AppDialogs.showToast(
        message:
            e.response == null ||
                    e.response?.data == null ||
                    e.response?.data['message'] == null
                ? errorMessage
                : e.response?.data['message'],
        toastType: ToastTypeEnum.error,
      );
    } else if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout) {
      if (showMessageForError) {
        AppDialogs.showToast(
          message: ErrorTextConstants.txtNetworkerror,
          toastType: ToastTypeEnum.error,
        );
      }
    } else {
      log('$functionFor error: $e');
      if (showMessageForError) {
        AppDialogs.showToast(
          message: errorMessage,
          toastType: ToastTypeEnum.error,
        );
      }
    }
  }

  ////getting response as argument and check whether it returns a valid data or not.
  ////If not it will return null.
  ////Else it will return valid response
  static dynamic checkResponse({
    required Response<dynamic> response,
    required String functionFor,
    required String errorMessage,
    required bool showMessageForSuccess,
    required bool showMessageForError,
    bool? returnStatusCode,
  }) async {
    try {
      if (response.data != null) {
        switch (response.statusCode) {
          //////////////////////////////
          case 200:
          case 201:
            if (showMessageForSuccess) {
              AppDialogs.showToast(
                message: response.data['message'],
                toastType: ToastTypeEnum.success,
              );
            }
            if (returnStatusCode ?? false) {
              return {
                "response": response.data,
                "status_code": response.statusCode,
              };
            } else {
              return response.data;
            }

          /////////////////////////////
          case 401:

            ///logout
            await handleInvalidUser();

            return null;
          /////////////////////////////
          case 400:
            if (showMessageForError) {
              AppDialogs.showToast(
                message: response.data['message'],
                toastType: ToastTypeEnum.error,
              );
            }
            return null;
          default:
            if (showMessageForError) {
              AppDialogs.showToast(
                message: ErrorTextConstants.txtSomethingWentWrong,
                toastType: ToastTypeEnum.error,
              );
            }
            return null;
        }
      }
    } on DioException catch (e) {
      checkDioExceptions(
        e: e,
        showMessageForError: showMessageForError,
        errorMessage: errorMessage,
        functionFor: functionFor,
      );
    } catch (e) {
      log('$functionFor error: $e');
      if (showMessageForError) {
        AppDialogs.showToast(
          message: errorMessage,
          toastType: ToastTypeEnum.error,
        );
      }
    }
    return response.data;
  }

  ////use this function to run the ssl even if its expired or not renewed
  static void runExpiredSsl() {
    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient =
        () =>
            HttpClient()
              ..badCertificateCallback =
                  (X509Certificate cert, String host, int port) => true;
  }

  ////Common Api call
  static Future<dynamic> callApi({
    required ApiRequestEnum request,
    required bool useToken,
    required String url,
    required String functionFor,
    required String errorMessage,
    bool? returnStatusCode,
    Object? body,
    bool? showMessageForSuccess,
    bool? showMessageForError,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    FormData? formData,
  }) async {
    try {
      dio.options.headers = headers;
      if (useToken) {
        // final token = await SharedPrefs.getUserToken();
        // dio.options.headers["Authorization"] = "Bearer $token";
      }
      dynamic response;
      switch (request) {
        case ApiRequestEnum.get:
          response = await dio.get(
            url,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
          );
        case ApiRequestEnum.post:
          response = await dio.post(
            url,
            data: formData ?? body,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
          );
        case ApiRequestEnum.put:
          response = await dio.put(
            url,
            data: formData ?? body,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
          );
        case ApiRequestEnum.patch:
          response = await dio.patch(
            url,
            data: formData ?? body,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
          );
        case ApiRequestEnum.delete:
          response = await dio.delete(
            url,
            data: formData ?? body,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
          );
      }

      final checkedResponse = checkResponse(
        response: response,
        functionFor: functionFor,
        errorMessage: errorMessage,
        showMessageForSuccess: showMessageForSuccess ?? false,
        showMessageForError: showMessageForError ?? false,
        returnStatusCode: returnStatusCode,
      );
      return checkedResponse;
    } on DioException catch (e) {
      checkDioExceptions(
        e: e,
        showMessageForError: showMessageForError ?? false,
        errorMessage: errorMessage,
        functionFor: functionFor,
      );
    } catch (e) {
      log('$functionFor error: $e');
      if (showMessageForError ?? false) {
        AppDialogs.showToast(
          message: errorMessage,
          toastType: ToastTypeEnum.error,
        );
      }
    }
  }

  ////
  ///
  ///
  ///Stops api call
  static void cancelApiCall() {
    cancelToken.cancel();
  }
}
