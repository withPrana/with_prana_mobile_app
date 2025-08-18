import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/bottom_navigation_bar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_appbar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/normal_screen_layout_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/terms_and_privacy_screen_widgets/each_terms_widget.dart';

class TermsAndPrivacyScreen extends HookWidget {
  static const routePath = "/terms-and-privacy";
  TermsAndPrivacyScreen({super.key});

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;

    final readTerms = useState(false);
    final readPrivacy = useState(false);

    return NormalScreenLayoutWidget(
      appBar: MainAppbarWidget(name: "Terms & Privacy"),
      body: SingleChildScrollView(
        child: Column(
          spacing: 56,
          children: [
            EachTermsWidget(
              theme: theme,
              termsTitle: "📄 Terms of Service",
              updatedDate: DateTime.now(),
              termsContent:
                  "By using the With Prana app, you agree to our terms of service. These include acceptable use, user responsibilities, and content rights",
              actionButtonName: "Read Full Terms",
              readContent: readTerms,
            ),
            EachTermsWidget(
              theme: theme,
              termsTitle: "🔒 Privacy Policy",
              updatedDate: DateTime.now(),
              termsContent:
                  "We respect your privacy. Learn how we collect, use, and store your personal data including analytics and login details",
              actionButtonName: "Read Privacy Policy",
              readContent: readPrivacy,
            ),
            VerticalSpace120(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(navigate: true),
    );
  }
}
