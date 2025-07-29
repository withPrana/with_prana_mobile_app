import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/app_version_details_controller.dart';
import 'package:with_prana_mobile_app/controller/common_controller.dart';
import 'package:with_prana_mobile_app/controller/home_controller.dart';
import 'package:with_prana_mobile_app/controller/initial_question_option_controller.dart';
import 'package:with_prana_mobile_app/controller/liked_contents_controller.dart';
import 'package:with_prana_mobile_app/controller/login_controller.dart';
import 'package:with_prana_mobile_app/controller/my_library_controller.dart';
import 'package:with_prana_mobile_app/controller/otp_controller.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/controller/user_controller.dart';

void setupGetxDependencies() {
  if (!Get.isRegistered<ThemeController>()) {
    Get.put(ThemeController(), permanent: true);
  }
  if (!Get.isRegistered<LoginController>()) {
    Get.put(LoginController(), permanent: true);
  }
  if (!Get.isRegistered<InitialQuestionOptionController>()) {
    Get.put(InitialQuestionOptionController(), permanent: true);
  }
  if (!Get.isRegistered<HomeController>()) {
    Get.put(HomeController(), permanent: true);
  }
  if (!Get.isRegistered<OtpController>()) {
    Get.put(OtpController(), permanent: true);
  }
  if (!Get.isRegistered<LikedContentsController>()) {
    Get.put(LikedContentsController(), permanent: true);
  }
  if (!Get.isRegistered<MyLibraryController>()) {
    Get.put(MyLibraryController(), permanent: true);
  }
  if (!Get.isRegistered<UserController>()) {
    Get.put(UserController(), permanent: true);
  }
  if (!Get.isRegistered<AppVersionDetailsController>()) {
    Get.put(AppVersionDetailsController(), permanent: true);
  }
  if (!Get.isRegistered<CommonController>()) {
    Get.put(CommonController(), permanent: true);
  }
}
