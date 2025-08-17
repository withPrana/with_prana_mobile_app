import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/date_formatter.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class EachTermsWidget extends StatelessWidget {
  final ColorPalette theme;
  final String termsTitle;
  final String termsContent;
  final DateTime updatedDate;
  final String actionButtonName;
  final ValueNotifier<bool> readContent;
  const EachTermsWidget({
    super.key,
    required this.theme,
    required this.termsTitle,
    required this.termsContent,
    required this.updatedDate,
    required this.actionButtonName,
    required this.readContent,
  });

  @override
  Widget build(BuildContext context) {
    final readMoreLengthLimit =
        termsContent.length > 150 ? 150 : termsContent.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ////title and update time
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(termsTitle, style: TypographyStyles.poppins40012()),
            Text(
              "📄 Last updated: ${DateFormatter.formatDateWitMonthName(updatedDate.toString())}",
              style: TypographyStyles.poppins40010(),
            ),
          ],
        ),
        VerticalSpace4(),
        ////terms content
        Container(
          width: ScreenSize.width(context),
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: theme.disabledLightColor),
          ),
          child:
              termsContent.length > readMoreLengthLimit
                  ? AnimatedCrossFade(
                    firstChild: Text(
                      "${termsContent.substring(0, readMoreLengthLimit)}...",
                      style: TypographyStyles.poppins40012Colored(
                        theme.textDarkColor,
                      ),
                    ),
                    secondChild: Text(
                      termsContent,
                      style: TypographyStyles.poppins40012Colored(
                        theme.textDarkColor,
                      ),
                    ),
                    crossFadeState:
                        readContent.value
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                    duration: Duration(milliseconds: 100),
                  )
                  : Text(
                    termsContent,
                    style: TypographyStyles.poppins40012Colored(
                      theme.textDarkColor,
                    ),
                  ),
        ),
        VerticalSpace4(),
        ////action button
        if (termsContent.length > readMoreLengthLimit)
          ClipRRect(
            borderRadius: BorderRadius.circular(500.r),
            child: InkWell(
              onTap: () {
                readContent.value = !readContent.value;
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
                decoration: BoxDecoration(
                  border: Border.all(color: theme.primaryColor),
                  borderRadius: BorderRadius.circular(500.r),
                ),
                child: Text(
                  readContent.value ? "Read less" : actionButtonName,
                  style: TypographyStyles.poppins40012Colored(
                    theme.primaryColor,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
