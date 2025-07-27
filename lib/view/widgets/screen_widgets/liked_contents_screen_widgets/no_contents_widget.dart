import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:with_prana_mobile_app/controller/home_controller.dart';
import 'package:with_prana_mobile_app/controller/theme_controller.dart';
import 'package:with_prana_mobile_app/core/constants/icon_constants.dart';
import 'package:with_prana_mobile_app/core/theme/typography_styles.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/button_widgets/primary_button_widget.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class NoContentsWidget extends StatelessWidget {
  const NoContentsWidget({
    super.key,
    required this.themeController,
    required this.homeController,
  });

  final ThemeController themeController;
  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    final theme = themeController.appTheme.value!;
    return Column(
      children: [
        VerticalSpace56(),
        CircleAvatar(
          radius: 22.r,
          backgroundColor: Colors.red,
          child: Center(
            child: ImageIcon(
              AssetImage(IconConstants.icFavourite),
              size: 32.r,
              color: theme.inverseColor,
            ),
          ),
        ),
        VerticalSpace10(),
        Text(
          "You haven’t liked\nanything yet",
          textAlign: TextAlign.center,
          style: TypographyStyles.snigletNormal24secondaryColored(),
        ),
        VerticalSpace10(),
        Text(
          "Subscribe or explore meditations to\nbuild your favorites.",
          textAlign: TextAlign.center,
          style: TypographyStyles.poppins40014(),
        ),
        VerticalSpace24(),
        PrimaryButtonWidget(
          height: 44.r,
          borderOnly: true,
          borderColor: theme.primaryColor,
          primaryColorText: true,
          name: "Browse Meditations",
          onTap: () {
            homeController.changeBottomNavScreenIndex(0);
          },
          isLoading: false,
        ),
      ],
    );
  }
}
