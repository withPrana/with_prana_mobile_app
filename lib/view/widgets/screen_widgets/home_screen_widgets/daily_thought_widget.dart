import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/audio_palyer_preview_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class DailyThoughtWidget extends StatelessWidget {
  DailyThoughtWidget({super.key});

  final themeController = Get.find<ThemeController>();
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return Column(
      children: [
        Container(
          width: ScreenSize.width(context),
          padding: EdgeInsets.all(18.r),
          decoration: BoxDecoration(
            color: theme.primaryLightColor,
            borderRadius: BorderRadius.circular(28.r),
          ),
          child: Column(
            children: [
              Text(
                "✨ Daily Thought",
                style: TypographyStyles.poppinsBold12Colored(
                  theme.primaryColor,
                ),
              ),
              VerticalSpace8(),
              AudioPalyerPreviewWidget(
                meditationCategory: MeditationCategoryModel(
                  iconPath: IconConstants.icMeditationCategoryTwo,
                  name: 'Sleep\n& Rest',
                  color: const Color(0xFFF8F9FF),
                  contentColor: const Color(0xFF545C90),
                ),
                audioDetails: AudioPreviewModel(
                  iconPath: ImageConstants.imgAudioPreviewOne,
                  title: "Peace begins with a smile",
                  category: "",
                  iconColor: Color(0xffCCD3FF),
                  minutes: 10,
                ),
                enableBorder: false,
                enableIconBgColor: false,
              ),
            ],
          ),
        ),
        VerticalSpace8(),
        Text(
          "View All",
          style: TypographyStyles.poppinsBold12Colored(theme.primaryColor),
        ),
      ],
    );
  }
}
