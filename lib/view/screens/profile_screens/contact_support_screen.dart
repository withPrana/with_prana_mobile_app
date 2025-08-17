import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/contact_support_controller.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/theme_controller.dart';
import 'package:with_prana_mobile_app/core/utils/callbacks.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/main_appbar_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/contact_support_screen_widgets/contact_support_form_widget.dart';

class ContactSupportScreen extends HookWidget {
  static const routePath = "/contact-support";
  ContactSupportScreen({super.key});

  final themeController = Get.find<ThemeController>();
  final contactSupportController = Get.find<ContactSupportController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;

    useEffect(() {
      Callbacks.postFrameCallback((_) {
        contactSupportController.initReset();
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: theme.inverseColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            MainAppbarWidget(name: "Contact Support"),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: ScreenSize.width(context),
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        border: Border.all(color: theme.disabledLightColor),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: ContactSupportFormWidget(
                        contactSupportController: contactSupportController,
                        theme: theme,
                      ),
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
