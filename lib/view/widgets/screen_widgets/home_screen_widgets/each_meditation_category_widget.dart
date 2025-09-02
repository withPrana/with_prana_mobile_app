import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:with_prana_mobile_app/core/route/route_controller.dart';
import 'package:with_prana_mobile_app/core/theme/color_palette.dart';
import 'package:with_prana_mobile_app/core/utils/hex_to_color.dart';
import 'package:with_prana_mobile_app/models/category_models/category_models.dart';
import 'package:with_prana_mobile_app/view/screens/meditation_category_screen.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class EachMeditationCategoryWidget extends StatelessWidget {
  final CategoryResponseModel meditationCategory;
  final ColorPalette theme;
  final double? width;
  final double? height;

  const EachMeditationCategoryWidget({
    super.key,
    this.width,
    this.height,
    required this.meditationCategory,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final contentColor = hexToColor(
      hex: meditationCategory.color ?? '',
      theme: theme,
    );
    final bgColor = contentColor.withValues(alpha: 0.1);
    return InkWell(
      onTap: () {
        RouteController.push(context, MeditationCategoryScreen.routePath, {
          "category": meditationCategory,
        });
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              meditationCategory.icon ?? '',
              errorBuilder:
                  (context, error, stackTrace) => Icon(Icons.error, size: 24.r),
              width: 32.r,
              color: contentColor,
            ),
            VerticalSpace8(),
            SizedBox(
              width: 100.r,
              child: Text(
                meditationCategory.name ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.r,
                  fontWeight: FontWeight.w700,
                  color: contentColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
