import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class ContentAndActionWidget extends StatelessWidget {
  final String? contentIconPath;
  final String? contentHeading;
  final String? contentString;
  final Widget actions;
  final Widget? customContent;
  final bool enableCustomContent;
  ContentAndActionWidget({
    super.key,
    required this.actions,
    this.contentIconPath,
    this.contentHeading,
    this.contentString,
    this.customContent,
    this.enableCustomContent = false,
  });

  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return Container(
      width: ScreenSize.width(context),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.primaryLightColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          enableCustomContent
              ? customContent ?? SizedBox.fromSize()
              : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  if (contentIconPath != null)
                    ImageIcon(
                      AssetImage(contentIconPath!),
                      size: 50,
                      color: theme.primaryColor,
                    ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (contentHeading != null)
                          Text(
                            contentHeading ?? '',
                            style:
                                TypographyStyles.poppins60014PrimaryColored(),
                          ),
                        if (contentHeading != null) VerticalSpace8(),
                        if (contentString != null)
                          Text(
                            contentString ?? '',
                            style:
                                TypographyStyles.poppins40012PrimaryColored(),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
          VerticalSpace24(),
          actions,
        ],
      ),
    );
  }
}
