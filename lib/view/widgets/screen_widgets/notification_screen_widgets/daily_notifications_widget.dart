import 'package:flutter/material.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/core/utils/date_formatter.dart';
import 'package:with_prana_mobile_app/view/widgets/layout_widgets/list_view_builder_widget.dart';

class DailyNotificationsWidget extends StatelessWidget {
  final ColorPalette theme;
  const DailyNotificationsWidget({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return ListViewBuilderWidget(
      itemCount: 2,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormatter.formatTime(DateTime.now().toString()),
              style: TypographyStyles.poppins40014Colored(
                theme.textDisabledColor,
              ),
            ),
          ],
        );
      },
      seperatorWidget: Divider(),
    );
  }
}
