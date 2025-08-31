import 'package:flutter/material.dart';
import 'package:with_prana_mobile_app/core/constants/image_constants.dart';
import 'package:with_prana_mobile_app/core/utils/hex_to_color.dart';
import 'package:with_prana_mobile_app/core/utils/screen_size.dart';
import 'package:with_prana_mobile_app/models/category_models/category_models.dart';

class MeditationCategoryBgWidget extends StatelessWidget {
  final CategoryResponseModel meditationCategory;
  final bool whiteBg;
  const MeditationCategoryBgWidget({
    super.key,
    this.whiteBg=true,
    required this.meditationCategory,
  });

  @override
  Widget build(BuildContext context) {
    final contentColor = hexToColor(meditationCategory.color ?? '');
    return Positioned.fill(
      child: SizedBox(
        width: ScreenSize.width(context),
        height: ScreenSize.height(context),

        child: Stack(
          children: [
            Image.asset(
              ImageConstants.imgMeditationCategoryBg,
              width: ScreenSize.width(context),
              fit: BoxFit.cover,
            ),
           if(whiteBg) Positioned(
              bottom: 0,
              child: Container(
                width: ScreenSize.width(context),
                height: ScreenSize.height(context),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.2, 0.32],
                    colors: [
                      contentColor.withValues(alpha: 0),
                      Colors.white,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
