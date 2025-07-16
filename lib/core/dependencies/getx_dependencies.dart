import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/initial_question_option_controller.dart';
import 'package:with_prana_mobile_app/controller/login_controller.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';

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
}
