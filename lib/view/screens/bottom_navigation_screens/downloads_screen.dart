import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/date_formatter.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/bottom_navigation_screen_layout_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_appbar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/button_widgets/primary_button_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class DownloadsScreen extends StatelessWidget {
  DownloadsScreen({super.key});

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return BottomNavigationScreenLayoutWidget(
      appBar: MainAppbarWidget(name: "📥 Downloads"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            VerticalSpace8(),
            Text(
              "Offline listening is part of\nour Premium plan.",
              textAlign: TextAlign.center,
              style: TypographyStyles.snigletNormal22secondaryColored(),
            ),
            VerticalSpace4(),
            Text(
              "Subscribe to access calming voices\nanytime, anywhere.",
              textAlign: TextAlign.center,
              style: TypographyStyles.poppins40014(),
            ),
            VerticalSpace24(),
            PrimaryButtonWidget(
              height: 44.r,
              borderOnly: true,
              borderColor: theme.primaryColor,
              primaryColorText: true,
              name: "Upgrade to Premium",
              onTap: () {},
              isLoading: false,
            ),
            VerticalSpace8(),
            RichText(
              text: TextSpan(
                text: "*14-day free trial ends on ",
                style: TypographyStyles.poppins4008PrimaryColored(),
                children: [
                  TextSpan(
                    text: DateFormatter.formatDate(
                      "${DateTime.now().add(Duration(days: 14))}",
                    ),
                    style: TypographyStyles.poppins6008PrimaryColored(),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 440.w,
                child: OverflowBox(
                  maxWidth: ScreenSize.width(context),
                  maxHeight: 440.w,
                  child: Image.asset(
                    ImageConstants.imgOfflineDownloadBg,
                    width: ScreenSize.width(context),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
