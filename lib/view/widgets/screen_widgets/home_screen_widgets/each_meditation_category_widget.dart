import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:with_prana_mobile_app/controller/getx_controllers/home_controller.dart';
import 'package:with_prana_mobile_app/core/route/route_controller.dart';
import 'package:with_prana_mobile_app/view/screens/meditation_category_screen.dart';
import 'package:with_prana_mobile_app/view/widgets/public_widgets/space_widgets.dart/vertical_space_widgets.dart';

class EachMeditationCategoryWidget extends StatelessWidget {
  final MeditationCategoryModel meditationCategory;
  final double? width;
  final double? height;

  const EachMeditationCategoryWidget({
    super.key,
    this.width,
    this.height,
    required this.meditationCategory,
  });

  @override
  Widget build(BuildContext context) {
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
          color: meditationCategory.color,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage(meditationCategory.iconPath),
              size: 32.r,
              color: meditationCategory.contentColor,
            ),
            VerticalSpace8(),
            Text(
              meditationCategory.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.r,
                fontWeight: FontWeight.w700,
                color: meditationCategory.contentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
