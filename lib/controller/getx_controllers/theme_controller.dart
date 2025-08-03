import 'package:get/get.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';

class ThemeController extends GetxController {
  final appTheme = Rx<ColorPalette?>(null);

  @override
  void onInit() {
    super.onInit();
    appTheme(LightTheme());
  }
}
