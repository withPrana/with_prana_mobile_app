import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/app_version_details_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/auth_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/common_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/initial_question_option_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/liked_contents_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/my_library_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/user_controller.dart';

void setupGetxDependencies() {
  if (!Get.isRegistered<ThemeController>()) {
    Get.put(ThemeController(), permanent: true);
  }
  if (!Get.isRegistered<AuthController>()) {
    Get.put(AuthController(), permanent: true);
  }
  if (!Get.isRegistered<InitialQuestionOptionController>()) {
    Get.put(InitialQuestionOptionController(), permanent: true);
  }
  if (!Get.isRegistered<HomeController>()) {
    Get.put(HomeController(), permanent: true);
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
