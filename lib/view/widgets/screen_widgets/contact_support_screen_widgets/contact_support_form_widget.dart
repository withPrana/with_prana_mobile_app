import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/contact_support_controller.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/button_widgets/primary_button_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/contact_support_screen_widgets/attachment_field_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/screen_widgets/contact_support_screen_widgets/support_message_field_widget.dart';

class ContactSupportFormWidget extends StatelessWidget {
  final ContactSupportController contactSupportController;
  final ColorPalette theme;
  const ContactSupportFormWidget({
    super.key,
    required this.contactSupportController,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        //////
        Obx(
          () => SupportMessageFieldWidget(
            title: "📝 Subject",
            maxLines: 3,
            controller: contactSupportController.subjectController,
            hintText: "e.g., “Issue with subscription”",
            enabled: !contactSupportController.isLoadingSendMessage.value,
          ),
        ),
        //////
        Obx(
          () => SupportMessageFieldWidget(
            title: "💬 Message",
            maxLines: 8,
            controller: contactSupportController.messageController,
            hintText: "Describe the issue or question in detail…",
            enabled: !contactSupportController.isLoadingSendMessage.value,
          ),
        ),
        //////
        AttachmentFieldWidget(
          theme: theme,
          contactSupportController: contactSupportController,
        ),
        VerticalSpace16(),
        ///////
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 175.w,
              child: Text(
                "We usually respond within 24 hours.",
                style: TypographyStyles.poppins40010(),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: PrimaryButtonWidget(
                width: 116.r,
                height: 36.r,
                name: "Send Message",
                onTap: () {},
                isLoading: false,
                textStyle: TypographyStyles.poppinsBold12Inverse(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
