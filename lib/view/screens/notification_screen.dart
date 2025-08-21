import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/bottom_navigation_bar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/list_view_builder_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_appbar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_screen_layout_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/notification_screen_widgets/daily_notifications_widget.dart';

class NotificationScreen extends StatelessWidget {
  static const routePath = "/notifications";
  NotificationScreen({super.key});

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return MainScreenLayoutWidget(
      appBar: MainAppbarWidget(name: "🔔 Notifications"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListViewBuilderWidget(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  width: ScreenSize.width(context),
                  padding: EdgeInsets.all(10.r),
                  decoration: BoxDecoration(
                    color: theme.inverseColor,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: theme.disabledLightColor),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "🗓️ Today",
                        style: TypographyStyles.poppinsBold14Colored(
                          theme.textDarkColor,
                        ),
                      ),
                      VerticalSpace16(),
                      DailyNotificationsWidget(theme: theme),
                    ],
                  ),
                );
              },
              seperatorWidget: VerticalSpace16(),
            ),
            VerticalBottomNavigationBarSpace(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(navigate: true),
    );
  }
}
