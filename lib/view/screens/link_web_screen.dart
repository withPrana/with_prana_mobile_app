import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/bottom_navigation_bar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_appbar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_screen_layout_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class LinkWebScreen extends StatelessWidget {
  static const routePath = "link-web";
  LinkWebScreen({super.key});

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return MainScreenLayoutWidget(
      appBar: MainAppbarWidget(name: "Link Device"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            VerticalSpace16(),
            Text(
              "Link WithPrana Web App",
              style: TypographyStyles.sniglet40024Colored(theme.secondaryColor),
            ),
            VerticalSpace8(),
            Text(
              "Scan the QR code from withprana.app/web to continue your meditation journey on your computer.",
              textAlign: TextAlign.center,
              style: TypographyStyles.poppins40014(),
            ),
            VerticalSpace40(),
            Image.asset(
              ImageConstants.imgScanWeb,
              width: 240.r,
              fit: BoxFit.cover,
            ),
            VerticalSpace40(),
            Text(
              "Your login is secure and will be synced across devices. This does not share any personal data.",
              textAlign: TextAlign.center,
              style: TypographyStyles.poppins40014(),
            ),
            VerticalBottomNavigationBarSpace(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(navigate: true),
    );
  }
}
