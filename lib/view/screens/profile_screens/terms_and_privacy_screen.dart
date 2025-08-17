import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_appbar_widget.dart';
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

    return Scaffold(
      backgroundColor: theme.inverseColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            MainAppbarWidget(name: "Terms & Privacy"),
            Expanded(
              child: SingleChildScrollView(
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
